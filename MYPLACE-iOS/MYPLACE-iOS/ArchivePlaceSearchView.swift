//
//  ArchivePlaceSearchView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/19/24.
//

import SwiftUI

struct ArchivePlaceSearchView: View {
    @StateObject var kakaoSearchViewModel = KakaoSearchViewModel.shared
    @StateObject var myPlaceListViewModel = MyPlaceListViewModel.shared
    @StateObject var popupViewModel = PopupViewModel.shared
    @StateObject var toastViewModel = ToastViewModel.shared
    @StateObject var searchPlaceViewModel = SearchPlaceViewModel.shared
    
    @State var isNeedUpdate: Bool = false
    @State var searchText: String = ""

    @State private var isPopupPresented = false
    @State private var isFirstSearch = true
    
    @Binding var path: [PathModel]

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
                                    .autocapitalization(.none)
                                    .autocorrectionDisabled()
                                Button(action: {
                                    updateView()
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    isFirstSearch = false
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
                        .padding(.top, 5)
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
                    Text("\(min(kakaoSearchViewModel.meta.pageableCount, 45))")
                        .font(.custom("Apple SD Gothic Neo", size: 15))
                    if kakaoSearchViewModel.meta.pageableCount >= 45 {
                        Text("+")
                            .font(.custom("Apple SD Gothic Neo", size: 15).weight(.thin))
                    }
                    Text("개")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 15)
                            .weight(.thin)
                        )
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                }
                .padding(.top, 5)
                VStack {
                    HStack {
                        if myPlaceListViewModel.result.place.isEmpty && kakaoSearchViewModel.places.isEmpty {
                            VStack {
                                Image("SearchMissing")
                                Text(isFirstSearch ? "아카이브에 등록할 장소를 검색해보세요! ": "해당 장소가 존재하지 않아요. \n 장소 이름을 다시 한번 확인해 주세요!")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 20)
                                            .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .lineSpacing(5)
                                    .padding(.top, 30)
                            }
                        } else {
                            if isNeedUpdate {
                                List {
                                    ForEach(myPlaceListViewModel.result.place, id: \.id) { place in
                                        Button(action: {
                                            searchPlaceViewModel.placeId = place.id
                                            searchPlaceViewModel.name = place.name
                                            searchPlaceViewModel.address = place.address
                                            searchPlaceViewModel.isLike = place.isLike
                                            searchPlaceViewModel.categoryId = place.categoryId
                                            searchPlaceViewModel.image = place.thumbnailUrl
                                            path.append(.newArchiveView)
                                        }) {
                                            SearchItemView_Registered(path: $path, isHeartFilled: place.isLike, searchText: $searchText, thumbnailUrl: place.thumbnailUrl, placeName: PlaceType.emojiForCategory(from: place.categoryId) + place.name, placeAddress: place.address, placeId: place.id)
                                        }
                                        .listRowSeparator(.hidden)
                                    }
                                    ForEach(kakaoSearchViewModel.places, id: \.id) { place in
                                        Button(action: {
                                            popupViewModel.setSelectedPlace(x: place.x, y: place.y, placeName: place.placeName, address: place.addressName)
                                            withAnimation {
                                                isPopupPresented.toggle()
                                            }
                                        }) {
                                            SearchItemView_UnRegistered(path: $path, placeName: place.placeName, addressName: place.addressName)
                                        }
                                        .listRowSeparator(.hidden)
                                    }
                                }
                            }
                            else {
                                List {
                                    ForEach(myPlaceListViewModel.result.place, id: \.id) { place in
                                        Button(action: {
                                            searchPlaceViewModel.placeId = place.id
                                            searchPlaceViewModel.name = place.name
                                            searchPlaceViewModel.address = place.address
                                            searchPlaceViewModel.isLike = place.isLike
                                            searchPlaceViewModel.categoryId = place.categoryId
                                            searchPlaceViewModel.image = place.thumbnailUrl
                                            path.append(.newArchiveView)
                                        }) {
                                            SearchItemView_Registered(path: $path, isHeartFilled: place.isLike, searchText: $searchText, thumbnailUrl: place.thumbnailUrl, placeName: PlaceType.emojiForCategory(from: place.categoryId) + place.name, placeAddress: place.address, placeId: place.id)
                                        }
                                        .listRowSeparator(.hidden)
                                    }
                                    ForEach(kakaoSearchViewModel.places, id: \.id) { place in
                                        Button(action: {
                                            popupViewModel.setSelectedPlace(x: place.x, y: place.y, placeName: place.placeName, address: place.addressName)
                                            withAnimation {
                                                isPopupPresented.toggle()
                                            }
                                        }) {
                                            SearchItemView_UnRegistered(path: $path, placeName: place.placeName, addressName: place.addressName)
                                        }
                                        .listRowSeparator(.hidden)
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .scrollIndicators(.hidden)
                    .onAppear {
                        // updateView()
                        isNeedUpdate.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            isNeedUpdate.toggle()
                        }
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
    
    private func updateView() {
        kakaoSearchViewModel.search(query: searchText)
        myPlaceListViewModel.getMyPlaceList(keyword: searchText)
    }
}

class SearchPlaceViewModel: ObservableObject {
    static let shared = SearchPlaceViewModel()
    
    @Published var placeId: Int = 0
    @Published var image: String = ""
    @Published var name: String = ""
    @Published var address: String = ""
    @Published var isLike: Bool = false
    @Published var categoryId: Int = 1
    
    func reset() {
        self.placeId = 0
        self.image = ""
        self.name = ""
        self.address = ""
        self.isLike = false
        self.categoryId = 1
    }
}



#Preview {
    ArchivePlaceSearchView(path: .constant([]))
}
