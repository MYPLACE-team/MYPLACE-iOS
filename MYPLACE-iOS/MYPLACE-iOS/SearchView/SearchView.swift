//
//  SearchView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/30/23.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var kakaoSearchViewModel: KakaoSearchViewModel
    @ObservedObject var popupViewModel: PopupViewModel
    
    @Binding var searchText: String
    @Binding var path: [PathModel]
    @Binding var isHeartFilled: Bool
    @State private var isPopupPresented = false
    @StateObject var toastViewModel = ToastViewModel.shared
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    TextField("장소명 검색하기", text: $searchText)
                        .font(
                            .custom("Apple SD Gothic Neo", size: 15)
                            .weight(.semibold)
                        )
                        .foregroundStyle(.gray)
                        .padding(.leading, 40)
                    Button(action: {
                        kakaoSearchViewModel.searchPlaces(query: searchText)
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                    }
                    .onAppear {
                        kakaoSearchViewModel.searchPlaces(query: searchText)
                    }
                    Spacer()
                }
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        BasicBackButton(path: $path)
                    }
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("장소 검색")
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 20)
                                    .weight(.semibold)
                                )
                        }
                        .foregroundStyle(.black)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        ToolBarView(path: $path)
                    }
                }
                Divider()
                    .background(.black)
                    .padding(.top, 10)
                HStack(spacing: 0) {
                    Spacer()
                    Text("총 ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 15)
                            .weight(.thin)
                        )
                    Text("\(kakaoSearchViewModel.meta.pageableCount)")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 15)
                        )
                    Text("개")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 15)
                            .weight(.thin)
                        )
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                }
                .padding(.top, 5)
                    VStack {
//                        ForEach(places, id: \.self) { place in
//                            Button(action: {
//                                popupViewModel.setSelectedPlace(placeModel: place)
//                                isPopupPresented.toggle()
//                            }) {
//                                SearchItemView(path: $path)
//                                    .padding(.top, 5)
//                            }
//                        }
                        Button(action: {
                            path.append(.placeInformationView)
                        }) {
                            SearchItemView_Registered(isHeartFilled: $isHeartFilled, path: $path, place: places[1])
                        }
                        HStack {
                            Spacer()
                            List {
                                ForEach(kakaoSearchViewModel.places, id: \.id) { place in
                                    Button(action: {
                                        popupViewModel.setSelectedPlace(placeName: place.placeName, address: place.addressName)
                                        isPopupPresented.toggle()
                                    }) {
                                        SearchItemView_UnRegistered(path: $path, placeName: place.placeName, addressName: place.addressName)
                                    }
                                    .listRowSeparator(.hidden)
                                }
                            }
                            .listStyle(PlainListStyle())
                            .scrollIndicators(.hidden)
                            Spacer()
                        }
                        Spacer()
                    }
//                    .frame(maxWidth: .infinity)
                Spacer()
            }
            .blur(radius: isPopupPresented ? 10 : 0)
            .disabled(isPopupPresented)
            if isPopupPresented {
                SearchPopup(path: $path, isPopupPresented: $isPopupPresented, popupViewModel: popupViewModel)
                    .environmentObject(popupViewModel)
            }
        }
        .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
        .padding(.top, 10)
    }
}



struct DottedDivider: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [3]))
            .foregroundStyle(.white)
        }
        .frame(height: 1)
    }
}

#Preview {
    SearchView(kakaoSearchViewModel: KakaoSearchViewModel(), popupViewModel: PopupViewModel(), searchText: .constant("StarBucks"), path: .constant([]), isHeartFilled: .constant(false))
}

