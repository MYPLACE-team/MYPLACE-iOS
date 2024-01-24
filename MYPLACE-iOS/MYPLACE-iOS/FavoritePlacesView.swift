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
    @State private var items = ["Item 1",
                                "Item 2",
                                "Item 3"]
    @State var isPopupPresented = false
    @State var isVisited = false
    @State var isLatestSelected: String = "최신순"
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
                    Button(action: {
                        isLatestSelected = "최신순"
                    }) {
                        Text("최신순")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 14)
                                    .weight(.semibold)
                            )
                            .foregroundStyle(isLatestSelected == "최신순" ? Color.accentColor : Color(red: 0.62, green: 0.64, blue: 0.67))
                    }
                    .padding(.leading, 40)
                    Button(action: {
                        isLatestSelected = "등록순"
                    }) {
                        Text("등록순")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 14)
                                    .weight(.semibold)
                            )
                            .foregroundStyle(isLatestSelected == "등록순" ? Color.accentColor : Color(red: 0.62, green: 0.64, blue: 0.67))
                    }
                    Spacer()
                    //MARK: - Filter button
                    Button(action: {
                        isPopupPresented.toggle()
                    }) {
                        Image("Setting")
                            .resizable()
                            .frame(width: 18, height: 19)
                    }
                    .padding(.trailing, 40)
                }
                .padding(.top, 20)
                .padding(.bottom, 10)
                
                if selectedTab == "전체" {
                    Group {
                        ForEach(items, id: \.self) { item in
                            Section {
                                SwipeItem(content: {
                                    FavoriteItemView(path: $path, isVisited: $isVisited, place: places[1])
                                        .background( Color(red: 0.93, green: 0.93, blue: 1))
                                },  left: {
                                    ZStack {
                                        UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10)
                                            .fill(Color.green)
                                        
                                        Button(action: {
                                            isVisited = true
                                            let toastMessage = "다녀올 장소에 저장되었어요"
                                            ToastViewModel.shared.showToastWithString(text: toastMessage)
                                        }) {
                                            Image(systemName: "archivebox")
                                                .foregroundStyle(.white)
                                                .font(.largeTitle)
                                        }
                                        .tint(.green)
                                    }
                                },  right: {
                                    ZStack {
                                        UnevenRoundedRectangle(bottomTrailingRadius: 10, topTrailingRadius: 10)
                                            .fill(Color.red)
                                        
                                        Button(action: {
                                            if let index = items.firstIndex(of: item) {
                                                items.remove(at: index)
                                            }
                                            let toastMessage = "관심 장소 저장이 해제되었습니다."
                                            ToastViewModel.shared.showToastWithString(text: toastMessage)
                                        }) {
                                            Image(systemName: "trash")
                                                .foregroundStyle(.white)
                                                .font(.largeTitle)
                                        }
                                        .tint(.red)
                                    }
                                }, itemHeight: 80, path: $path)
                            }
                            .frame(height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .listRowSeparator(.hidden)
                            .listSectionSpacing(0)
                        }
                    }
                    .frame(width: 340)
                    .padding(.top, 15)
                    
                    Spacer()
                }
                else if selectedTab == "다녀온 장소" {
                    Text("")
                }
                else if selectedTab == "다녀올 장소" {
                    Text("")
                }
                    
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
            
            .blur(radius: isPopupPresented ? 10 : 0)
            .disabled(isPopupPresented)
            if isPopupPresented {
                FilterPopup(isPopupPresented: $isPopupPresented)
            }
        }
        .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
    }
}

struct SwipeItem<Content: View, Left: View, Right: View>: View {
    var content: () -> Content
    var left: () -> Left
    var right: () -> Right
    var itemHeight: CGFloat
    
    @State var hoffset: CGFloat = 0
    @State var anchor: CGFloat = 0
    
    let screenWidth = UIScreen.main.bounds.width
    var anchorWidth: CGFloat { screenWidth / 4 }
    var swipeThreshold: CGFloat { screenWidth / 15 }
    
    @State var rightPast = false
    @State var leftPast = false
    @State private var isSwipeActive = false
    
    @Binding var path: [PathModel]
    
    init(@ViewBuilder content: @escaping () -> Content,
         @ViewBuilder left: @escaping () -> Left,
         @ViewBuilder right: @escaping () -> Right,
         itemHeight: CGFloat,
         path: Binding<[PathModel]>) {
        self.content = content
        self.left = left
        self.right = right
        self.itemHeight = itemHeight
        self._path = path
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation {
                    hoffset = anchor + value.translation.width
                    
                    if abs(hoffset) > anchorWidth {
                        if leftPast {
                            hoffset = anchorWidth
                        } else if rightPast {
                            hoffset = -anchorWidth
                        }
                    }
                    
                    if anchor > 0 {
                        leftPast = hoffset > anchorWidth - swipeThreshold
                    } else {
                        leftPast = hoffset > swipeThreshold
                    }
                    
                    if anchor < 0 {
                        rightPast = hoffset < -anchorWidth + swipeThreshold
                    } else {
                        rightPast = hoffset < -swipeThreshold
                    }
                }
            }
            .onEnded { value in
                withAnimation {
                    if rightPast {
                        anchor = -anchorWidth
                        isSwipeActive = true
                    } else if leftPast {
                        anchor = anchorWidth
                        isSwipeActive = true
                    }
                    hoffset = anchor
                }
            }
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                left()
                    .frame(width: anchorWidth)
                    .zIndex(0)
                    .clipped()
                
                content()
                    .frame(width: geo.size.width)
                    .zIndex(1)
                    .onTapGesture {
                        if isSwipeActive {
                            withAnimation {
                                anchor = 0
                                hoffset = 0
                            }
                            isSwipeActive = false
                        }
                        else {
                            path.append(.placeInformationView)
                        }
                    }
                right()
                    .frame(width: anchorWidth)
                    .zIndex(0)
                    .clipped()
            }
        }
        .offset(x: -anchorWidth + hoffset)
        .frame(maxHeight: itemHeight)
        .contentShape(Rectangle())
        .gesture(drag)
        .clipped()
    }
}

#Preview {
    FavoritePlacesView(path: .constant([]))
}
