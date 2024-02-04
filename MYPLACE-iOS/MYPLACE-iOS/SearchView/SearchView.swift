//
//  SearchView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/30/23.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var kakaoSearchViewModel: KakaoSearchViewModel
    @StateObject var popupViewModel = PopupViewModel.shared
    
    @Binding var searchText: String
    @Binding var path: [PathModel]
    @Binding var isHeartFilled: Bool
    @State private var isPopupPresented = false
    @StateObject var toastViewModel = ToastViewModel.shared
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 7)
                        .frame(width: 340, height: 40)
                        .foregroundStyle(Color(red: 0.97, green: 0.97, blue: 0.97))
                        .overlay(
                            HStack {
                                TextField("장소명 검색하기", text: $searchText)
                                    .font(
                                        .custom("Apple SD Gothic Neo", size: 15)
                                        .weight(.semibold)
                                    )
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 13)
                                Button(action: {
                                    kakaoSearchViewModel.search(query: searchText)
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                }) {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundStyle(.gray)
                                }
                                .padding(.trailing, 13)
                            }
                    )
                    Spacer()
                }
                .padding(.top, 10)
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
                        Button(action: {
                            path.append(.placeInformationView)
                        }) {
                            SearchItemView_Registered(isHeartFilled: $isHeartFilled, path: $path, place: dummyPlaces[1])
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
                            .onAppear {
                                kakaoSearchViewModel.search(query: searchText)
                            }

                            Spacer()
                        }
                        Spacer()
                    }
                Spacer()
            }
            .blur(radius: isPopupPresented ? 10 : 0)
            .disabled(isPopupPresented)
            if isPopupPresented {
                SearchPopup(path: $path, isPopupPresented: $isPopupPresented, popupViewModel: popupViewModel)
            }
        }
        .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
        .padding(.top, 10)
    }
}



#Preview {
    SearchView(kakaoSearchViewModel: KakaoSearchViewModel(), searchText: .constant("강원"), path: .constant([]), isHeartFilled: .constant(false))
}

