//
//  FavoritePlacesView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/28/23.
//

import SwiftUI

struct FavoritePlacesView: View {
    @Binding var path: [PathModel]
    @State private var selectedTab: String = "전체"
    @StateObject private var toastViewModel = ToastViewModel.shared
    //MARK: - 관심 장소 리스트 받으면 그거 배열 model에 따로 저장할거고, 그걸로 정보랑 개수 불러올 예정 아래 코드는 임시용
    @State private var selectedSortingOption: Int = 1
    @State private var items = ["Item 1",
                                "Item 2",
                                "Item 3"]
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: 30){
                    VStack(spacing: 10){
                        HStack(spacing: 5) {
                            Text("전체")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                        .weight(.bold)
                                )
                                .foregroundStyle(selectedTab == "전체" ? Color.accentColor : Color(red: 0.39, green: 0.45, blue: 0.55))
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color(red: 0.95, green: 0.96, blue: 0.97))
                                .frame(width: 24, height: 20)
                                .overlay(
                                    Text("6")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 14)
                                                .weight(.medium)
                                        )
                                )
                        }
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, topTrailing: 10))
                            .frame(width: 100, height: 4)
                            .foregroundStyle(selectedTab == "전체" ? Color.accentColor : .clear)
                    }
                    .onTapGesture {
                        selectedTab = "전체"
                    }
                    VStack(spacing: 10){
                        HStack(spacing: 5) {
                            Text("다녀온 장소")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                        .weight(.semibold)
                                )
                                .foregroundStyle(selectedTab == "다녀온 장소" ? Color.accentColor : Color(red: 0.39, green: 0.45, blue: 0.55))
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color(red: 0.95, green: 0.96, blue: 0.97))
                                .frame(width: 24, height: 20)
                                .overlay(
                                    Text("6")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 14)
                                                .weight(.medium)
                                        )
                                )
                        }
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, topTrailing: 10))
                            .frame(width: 100, height: 4)
                            .foregroundStyle(selectedTab == "다녀온 장소" ? Color.accentColor : .clear)
                    }
                    .onTapGesture {
                        selectedTab = "다녀온 장소"
                    }
                    VStack(spacing: 10){
                        HStack(spacing: 5) {
                            Text("다녀올 장소")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                        .weight(.semibold)
                                )
                                .foregroundStyle(selectedTab == "다녀올 장소" ? Color.accentColor : Color(red: 0.39, green: 0.45, blue: 0.55))
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color(red: 0.95, green: 0.96, blue: 0.97))
                                .frame(width: 24, height: 20)
                                .overlay(
                                    Text("6")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 14)
                                                .weight(.medium)
                                        )
                                )
                        }
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, topTrailing: 10))
                            .frame(width: 100, height: 4)
                            .foregroundStyle(selectedTab == "다녀올 장소" ? Color.accentColor : .clear)
                    }
                    .onTapGesture {
                        selectedTab = "다녀올 장소"
                    }
                }
                .padding(.top, 5)
                Divider()
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 100, height: 40)
                        .foregroundStyle(.blue)
                        .overlay(
                            Picker(selection: $selectedSortingOption, label: Text("Picker")) {
                                Text("등록순").tag(1)
                                Text("이름순").tag(2)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                                .tint(.white)
                        )
                        .padding(.leading, 15)
                    Spacer()
                    Image("Setting")
                        .resizable()
                        .frame(width: 18, height: 19)
                        .padding(.trailing, 10)
                }
                .padding(.top, 10)
                List {
                    ForEach(items, id: \.self) { item in
                        Section {
                            SwipeItem(content: {
                                FavoriteItemView(path: $path, place: places[1])
                             },
                             left: {
                                ZStack {
                                    Rectangle()
                                        .fill(Color.orange)
                                    
                                    Image(systemName: "pencil.circle")
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                }
                             },
                             right: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.red)
                                    
                                    Image(systemName: "trash.circle")
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                }
                             }, itemHeight: 50)
                            FavoriteItemView(path: $path, place: places[1])
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button(action: {
                                        if let index = items.firstIndex(of: item) {
                                            items.remove(at: index)
                                        }
                                        let toastMessage = "관심 장소 저장이 해제되었습니다."
                                        ToastViewModel.shared.showToastWithString(text: toastMessage)
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundStyle(.white)
                                    }
                                    .tint(.red)
                                }
                                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                    Button(action: {
                                        let toastMessage = "다녀올 장소에 저장되었어요"
                                        ToastViewModel.shared.showToastWithString(text: toastMessage)
                                    }) {
                                        Image(systemName: "archivebox")
                                            .foregroundStyle(.white)
                                    }
                                    .tint(.green)
                                }
                        }
                        .frame(height: 60)
                        .listRowSeparator(.hidden)
                        .listSectionSpacing(10)
                    }
                }
                .listStyle(PlainListStyle())
                .frame(width: 340)
                .padding(.top, 10)
                
                Spacer()
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BasicBackButton(path: $path)
                }
                
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("Star")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("관심장소")
                            .font(
                                .custom("Apple SD Gothic Neo", size: 20)
                                .weight(.semibold)
                            )
                    }
                    .foregroundStyle(.black)
                    .padding(.top, 3)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    ToolBarView(path: $path)
                }
            }
        }
        .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
    }
}

#Preview {
    FavoritePlacesView(path: .constant([]))
}
