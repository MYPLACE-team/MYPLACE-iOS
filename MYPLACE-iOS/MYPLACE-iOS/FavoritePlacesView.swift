//
//  FavoritePlacesView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/28/23.
//

import SwiftUI

struct FavoritePlacesView: View {
    @StateObject var favoritePlaceViewModel = FavoritePlaceViewModel.shared
    @StateObject var favoritePostBodyViewModel = FavoritePostBodyViewModel.shared
    
    @Binding var path: [PathModel]
    @Binding var placeId: Int
    @Binding var isHeartFilled: Bool
    
    @State private var selectedTab: String = "전체"
    @StateObject private var toastViewModel = ToastViewModel.shared
    @State var isPopupPresented = false
    @State var isLatestSelected: String = "등록순"
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
                                    Text("\(favoritePlaceViewModel.result.count)")
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
                        withAnimation {
                            selectedTab = "전체"
                        }
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
                                    Text("\(favoritePlaceViewModel.result.filter { $0.isVisited == 1 }.count)")
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
                        withAnimation {
                            selectedTab = "다녀온 장소"
                        }
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
                                    Text("\(favoritePlaceViewModel.result.filter { $0.isVisited == 0 }.count)")
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
                        withAnimation {
                            selectedTab = "다녀올 장소"
                        }
                    }
                }
                .padding(.top, 5)
                Divider()
                HStack {
                    Button(action: {
                        isLatestSelected = "등록순"
                        favoritePostBodyViewModel.sort = 2000
                        favoritePlaceViewModel.searchMyPlaceList()
                    }) {
                        Text("등록순")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 14)
                                    .weight(.semibold)
                            )
                            .foregroundStyle(isLatestSelected == "등록순" ? Color.accentColor : Color(red: 0.62, green: 0.64, blue: 0.67))
                    }
                    .padding(.leading, 40)
                    Button(action: {
                        isLatestSelected = "이름순"
                        favoritePostBodyViewModel.sort = 2001
                        favoritePlaceViewModel.searchMyPlaceList()
                    }) {
                        Text("이름순")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 14)
                                    .weight(.semibold)
                            )
                            .foregroundStyle(isLatestSelected == "이름순" ? Color.accentColor : Color(red: 0.62, green: 0.64, blue: 0.67))
                    }
                    Spacer()
                    ScrollView(.horizontal) {
                        HStack(spacing: 25) {
                            ForEach(favoritePostBodyViewModel.category.compactMap { PlaceType(rawValue: $0)?.stringValue }, id: \.self) { categoryText in
                                Text("\(categoryText)")
                                    .font(
                                        .custom("Apple SD Gothic Neo", size: 13)
                                        .weight(.regular)
                                    )
                                    .foregroundStyle(Color.accentColor)
                                    .background(
                                        RoundedRectangle(cornerRadius: 40)
                                            .foregroundStyle(.white)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 40)
                                                    .fill(Color.white)
                                                    .stroke(Color.accentColor, lineWidth: 1.3)
                                                    .padding(EdgeInsets(top: -5, leading: -10, bottom: -4, trailing: -10))
                                            )
                                    )
                            }
                        }
                        .padding(.leading, 20)
                        .frame(height: 30)
                    }
                    .scrollIndicators(.hidden)
                    
                    Spacer()
                    Button(action: {
                        withAnimation {
                            isPopupPresented.toggle()
                        }
                    }) {
                        Image("Setting")
                            .resizable()
                            .frame(width: 18, height: 19)
                    }
                    .padding(.trailing, 40)
                }
                .padding(.top, 20)
                .padding(.bottom, 10)
                ScrollView {
                    //MARK: - 전체
                    if selectedTab == "전체" {
                        if favoritePlaceViewModel.result.isEmpty {
                            VStack {
                                Image("FavoritePlaceMissing1")
                                Text("등록한 관심장소가 없어요.\n첫번째 관심장소를 찾아볼까요?")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 20)
                                            .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .lineSpacing(5)
                                    .padding(.top, 30)
                                Button(action: {
                                    path.append(.searchView)
                                }) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(Color.accentColor)
                                        .frame(width: 240, height: 50)
                                        .overlay(
                                            Text("장소 둘러보기")
                                                .foregroundStyle(.white)
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 20)
                                                        .weight(.semibold)
                                                )
                                            
                                        )
                                        .padding(.top, 25)
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color(red: 0.94, green: 0.93, blue: 1).opacity(0.7))
                        }
                        else {
                            Group {
                                ForEach(favoritePlaceViewModel.result, id: \.id) { favoritePlace in
                                    Section {
                                        SwipeItem(content: {
                                            let isVisitedBool: Bool = favoritePlace.isVisited == 1 ? true : false
                                            FavoriteItemView(path: $path, isVisited: isVisitedBool, place: favoritePlace)
                                                .background( Color(red: 0.93, green: 0.93, blue: 1))
                                                .onTapGesture {
                                                    placeId = favoritePlace.id
                                                    isHeartFilled = true
                                                    path.append(.placeInformationView)
                                                }
                                            
                                        },  left: {
                                            ZStack {
                                                UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10)
                                                    .fill(Color.green)
                                                
                                                Button(action: {
                                                    favoritePlaceViewModel.patchFavoritePlaceIsVisited(placeId: favoritePlace.id)
                                                    favoritePlaceViewModel.searchMyPlaceList()
                                                    if favoritePlace.isVisited == 1 {
                                                        let toastMessage = "다녀올 장소에 저장되었어요"
                                                        ToastViewModel.shared.showToastWithString(text: toastMessage)
                                                    }
                                                    else if favoritePlace.isVisited == 0 {
                                                        let toastMessage = "다녀올 장소에서 삭제되었어요"
                                                        ToastViewModel.shared.showToastWithString(text: toastMessage)
                                                    }
                                                    
                                                    withAnimation {
                                                        selectedTab = "로딩 화면"
                                                    }
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
                                                    MyPlaceManager.shared.deleteFavoritePlace(placeId: favoritePlace.id) { error in
                                                        if error != nil {
                                                            print("관심장소 삭제 실패")
                                                        }
                                                        else {
                                                            favoritePlaceViewModel.searchMyPlaceList()
                                                            print("관심장소 삭제 성공")
                                                        }
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
                    }
                    //MARK: - 다녀온 장소
                    else if selectedTab == "다녀온 장소" {
                        if !favoritePlaceViewModel.result.contains(where: { $0.isVisited == 1 }) {
                            VStack {
                                Image("FavoritePlaceMissing2")
                                Text("다녀온 장소가 없어요.\n원활한 방문을 위해 알림을 보내드릴까요?")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 20)
                                            .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .lineSpacing(5)
                                    .padding(.top, 30)
                                Button(action: {
                                    
                                }) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(Color.accentColor)
                                        .frame(width: 240, height: 50)
                                        .overlay(
                                            Text("알림 설정")
                                                .foregroundStyle(.white)
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 20)
                                                        .weight(.semibold)
                                                )
                                            
                                        )
                                        .padding(.top, 25)
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color(red: 0.94, green: 0.93, blue: 1).opacity(0.7))
                        }
                        else {
                            Group {
                                ForEach(favoritePlaceViewModel.result, id: \.id) { favoritePlace in
                                    Section {
                                        if favoritePlace.isVisited == 1 {
                                            SwipeItem(content: {
                                                let isVisitedBool: Bool = favoritePlace.isVisited == 1 ? true : false
                                                FavoriteItemView(path: $path, isVisited: isVisitedBool, place: favoritePlace)
                                                    .background( Color(red: 0.93, green: 0.93, blue: 1))
                                                    .onTapGesture {
                                                        placeId = favoritePlace.id
                                                        isHeartFilled = true
                                                        path.append(.placeInformationView)
                                                    }
                                                
                                            },  left: {
                                                ZStack {
                                                    UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10)
                                                        .fill(Color.green)
                                                    
                                                    Button(action: {
                                                        favoritePlaceViewModel.patchFavoritePlaceIsVisited(placeId: favoritePlace.id)
                                                        favoritePlaceViewModel.searchMyPlaceList()
                                                        let toastMessage = "다녀올 장소에 저장되었어요"
                                                        ToastViewModel.shared.showToastWithString(text: toastMessage)
                                                        withAnimation {
                                                            selectedTab = "로딩 화면"
                                                        }
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
                                                        MyPlaceManager.shared.deleteFavoritePlace(placeId: favoritePlace.id) { error in
                                                            if error != nil {
                                                                print("관심장소 삭제 실패")
                                                            }
                                                            else {
                                                                favoritePlaceViewModel.searchMyPlaceList()
                                                                print("관심장소 삭제 성공")
                                                            }
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
                    }
                    //MARK: - 다녀올 장소
                    else if selectedTab == "다녀올 장소" {
                        if !favoritePlaceViewModel.result.contains(where: { $0.isVisited == 0 }) {
                            VStack {
                                Image("FavoritePlaceMissing3")
                                Text("관심장소를 모두 방문했어요. \n새로운 관심장소를 찾아볼까요?")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 20)
                                            .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .lineSpacing(5)
                                    .padding(.top, 30)
                                Button(action: {
                                    
                                }) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(Color.accentColor)
                                        .frame(width: 240, height: 50)
                                        .overlay(
                                            Text("장소 둘러보기")
                                                .foregroundStyle(.white)
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 20)
                                                        .weight(.semibold)
                                                )
                                            
                                        )
                                        .padding(.top, 25)
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color(red: 0.94, green: 0.93, blue: 1).opacity(0.7))
                        }
                        else {
                            Group {
                                ForEach(favoritePlaceViewModel.result, id: \.id) { favoritePlace in
                                    Section {
                                        if favoritePlace.isVisited == 0 {
                                            SwipeItem(content: {
                                                let isVisitedBool: Bool = favoritePlace.isVisited == 1 ? true : false
                                                FavoriteItemView(path: $path, isVisited: isVisitedBool, place: favoritePlace)
                                                    .background( Color(red: 0.93, green: 0.93, blue: 1))
                                                    .onTapGesture {
                                                        placeId = favoritePlace.id
                                                        isHeartFilled = true
                                                        path.append(.placeInformationView)
                                                    }
                                                
                                            },  left: {
                                                ZStack {
                                                    UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10)
                                                        .fill(Color.green)
                                                    
                                                    Button(action: {
                                                        favoritePlaceViewModel.patchFavoritePlaceIsVisited(placeId: favoritePlace.id)
                                                        favoritePlaceViewModel.searchMyPlaceList()
                                                        let toastMessage = "다녀올 장소에 저장되었어요"
                                                        ToastViewModel.shared.showToastWithString(text: toastMessage)
                                                        withAnimation {
                                                            selectedTab = "로딩 화면"
                                                        }
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
                                                        MyPlaceManager.shared.deleteFavoritePlace(placeId: favoritePlace.id) { error in
                                                            if error != nil {
                                                                print("관심장소 삭제 실패")
                                                            }
                                                            else {
                                                                favoritePlaceViewModel.searchMyPlaceList()
                                                                print("관심장소 삭제 성공")
                                                            }
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
                    }
                    else if selectedTab == "로딩 화면" {
                        VStack {
                            //FavoritePlaceLoading
                            Image("FavoritePlaceMissing2")
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        withAnimation {
                                            selectedTab = "전체"
                                        }
                                    }
                                }
                            Text("로딩중이에요......")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 20)
                                        .weight(.semibold)
                                )
                                .multilineTextAlignment(.center)
                                .lineSpacing(5)
                                .padding(.top, 30)
                            Spacer()
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        BasicBackButton(path: $path)
                    }
                    
                    ToolbarItem(placement: .principal) {
                        HStack {
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
                .onAppear {
                    favoritePlaceViewModel.searchMyPlaceList()
                }
                .blur(radius: isPopupPresented ? 10 : 0)
                .disabled(isPopupPresented)
                if isPopupPresented {
                    FilterPopup(isPopupPresented: $isPopupPresented)
                        .onDisappear {
                            withAnimation {
                                selectedTab = "로딩 화면"
                                favoritePlaceViewModel.searchMyPlaceList()
                            }
                        }
                }
            }
            .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
        }
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
                    if rightPast && isSwipeActive {
                        anchor = 0
                        isSwipeActive = false
                    }
                    else if leftPast && isSwipeActive {
                        anchor = 0
                        isSwipeActive = false
                    }
                    else if rightPast {
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
    FavoritePlacesView(path: .constant([]), placeId: .constant(1), isHeartFilled: .constant(true))
}
