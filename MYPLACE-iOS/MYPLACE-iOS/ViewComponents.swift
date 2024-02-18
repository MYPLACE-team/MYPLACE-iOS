//
//  ViewComponents.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/5/24.
//

import SwiftUI

struct ViewComponents: View {
    var body: some View {
        SearchItemView_Registered(myPlaceListViewModel: MyPlaceListViewModel(), path: .constant([]), isHeartFilled: false, searchText: .constant(""), placeName: "test", placeAddress: "test", placeId: 50)
        SearchItemView_UnRegistered(path: .constant([]), placeName: "카카오프렌즈카카오프렌즈카카오프렌즈", addressName: "서울")
        FavoriteItemView(path: .constant([]), isVisited: false, place: FavoritePlace(id: 1, name: "testName", address: "testAddress", categoryID: 50, lat: "1", lon: "1", isVisited: 0))
        KakaoSearchView(kakaoSearchViewModel: KakaoSearchViewModel(), myPlaceListViewModel: MyPlaceListViewModel(), path: .constant([]), searchText: .constant(""))
        BlueChip(text: "가나다라마바사", isSelected: false)
        RedChip(text: "가나다라마바사")
    }
}


struct BlueChip: View {
    private let text: String
    private let isSelected: Bool
    
    init(text: String, isSelected: Bool) {
        self.text = text
        self.isSelected = isSelected
    }
    
    var body: some View {
        if !text.isEmpty {
            Text(text)
                .font(
                    .custom("Apple SD Gothic Neo", size: 12)
                )
                .foregroundStyle(isSelected ? Color.white : Color(red: 0.4, green: 0.35, blue: 0.96))
                .lineLimit(1)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(isSelected ? Color.accentColor : Color(red: 0.97, green: 0.95, blue: 1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                        )
                )
        }
        else {
            Text("선택된 서비스가 없어요")
                .font(
                    .custom("Apple SD Gothic Neo", size: 12)
                )
        }
    }
}

struct RedChip: View {
    private let text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        if !text.isEmpty {
            Text(text)
                .font(
                    .custom("Apple SD Gothic Neo", size: 12)
                )
                .foregroundStyle(Color(red: 0.89, green: 0.39, blue: 0.39))
                .lineLimit(1)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(Color(red: 1, green: 0.95, blue: 0.95))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 0.89, green: 0.39, blue: 0.39), lineWidth: 1)
                        )
                )
        }
        else {
            Text("휴무일을 알 수 없어요")
                .font(
                    .custom("Apple SD Gothic Neo", size: 12)
                )
        }
    }
}

struct Xmark: View {
    var body: some View {
        Image(systemName: "xmark")
            .resizable()
            .frame(width: 17, height: 17)
            .foregroundStyle(.white)
            .padding(.trailing, 20)
            .padding(.top, 20)
    }
}

struct SearchItemView_Registered: View {
    @StateObject var myPlaceListViewModel = MyPlaceListViewModel.shared
    @Binding var path: [PathModel]
    @State var isHeartFilled: Bool
    @Binding var searchText: String
    let placeName: String
    let placeAddress: String
    let placeId: Int
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color(red: 0.96, green: 0.96, blue: 0.96))
            .frame(width: 340, height: 80)
            .overlay(
                HStack {
                    Image("DummyImage2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            AutoScrollingText(text: placeName, fontName: "Apple SD Gothic Neo", fontSize: 18, fontWeight: .semibold)
                                .frame(width: 165, height: 22)
                                .clipped()
                                .foregroundStyle(.black)
                            Spacer()
                            Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                                .foregroundStyle(isHeartFilled ? .red : .gray)
                                .onTapGesture {
                                    if !isHeartFilled {
                                        MyPlaceManager.shared.registerFavoritePlace(placeId: placeId) { error in
                                            if error != nil {
                                                print("error in registerFavoritePlace")
                                            } else {
                                                withAnimation {
                                                    isHeartFilled.toggle()
                                                }
                                                print("!!\(placeName)")
                                                myPlaceListViewModel.getMyPlaceList(keyword: searchText)
                                                print("success in registerFavoritePlace")
                                            }
                                        }
                                    } else {
                                        MyPlaceManager.shared.deleteFavoritePlace(placeId: placeId) {
                                            error in
                                            if error != nil {
                                                print("error in deleteFavoritePlace")
                                            }
                                            else {
                                                withAnimation {
                                                    isHeartFilled.toggle()
                                                }
                                                myPlaceListViewModel.getMyPlaceList(keyword: searchText)
                                                print("success in deleteFavoritePlace")
                                            }
                                        }
                                    }
                                    let toastMessage = !isHeartFilled ? "관심 장소로 저장되었습니다." : "관심 장소 저장이 해제되었습니다."
                                    ToastViewModel.shared.showToastWithString(text: toastMessage)
                                }
                                .padding(.trailing, 10)
                                .padding(.bottom, 5)
                        }
                        HStack {
                            Image("Map")
                                .resizable()
                                .frame(width: 12, height: 15)
                            AutoScrollingText(text: placeAddress, fontName: "Apple SD Gothic Neo", fontSize: 15, fontWeight: .thin)
                                .frame(width: 165, height: 18)
                                .clipped()
                                .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        }
                    }
                    .padding(.leading, 20)
                    Spacer()
                }
            )
    }
}

struct SearchItemView_UnRegistered: View {
    @Binding var path: [PathModel]
    let placeName: String
    let addressName: String
    var isEditing: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color(red: 0.96, green: 0.96, blue: 0.96))
            .frame(width: 340, height: 80)
            .overlay(
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 70, height: 70)
                        .foregroundStyle(Color(red: 0.88, green: 0.88, blue: 0.88))
                        .overlay(
                            Image("MyPlaceLogo")
                        )
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            AutoScrollingText(text: placeName, fontName: "Apple SD Gothic Neo", fontSize: 18, fontWeight: .semibold)
                                .frame(width: 165, height: 22)
                                .clipped()
                                .foregroundStyle(.black)
                            Spacer()
                            if !isEditing {
                                Text("등록하기")
                                    .font(
                                        .custom("Apple SD Gothic Neo", size: 11)
                                    )
                                    .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(red: 0.89, green: 0.89, blue: 0.95).opacity(0.42))
                                            .foregroundStyle(.clear)
                                            .frame(width: 55, height: 18)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 0.5)
                                            )
                                    )
                                    .padding(.trailing, 10)
                            }
                        }
                        HStack {
                            Image("Map")
                                .resizable()
                                .frame(width: 12, height: 15)
                            AutoScrollingText(text: addressName, fontName: "Apple SD Gothic Neo", fontSize: 15, fontWeight: .thin)
                                .frame(width: 200, height: 18)
                                .clipped()
                                .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        }
                    }
                    .padding(.leading, 20)
                    Spacer()
                }
            )
    }
}

struct FavoriteItemView: View {
    @Binding var path: [PathModel]
    @State var isVisited: Bool
    var place: FavoritePlace
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(width: 340, height: 80)
            .foregroundStyle(isVisited ? Color(red: 0.96, green: 0.96, blue: 0.96) : Color(red: 0.93, green: 0.93, blue: 1))
            .overlay(
                HStack {
                    Image("DummyImage2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            AutoScrollingText(text: PlaceType.emojiForCategory(from: place.categoryID) + place.name, fontName: "Apple SD Gothic Neo", fontSize: 18, fontWeight: .semibold)
                                .frame(width: 165, height: 22)
                                .clipped()
                                .foregroundStyle(.black)
                            Spacer()
                        }
                        HStack {
                            Image("Map")
                                .resizable()
                                .frame(width: 12, height: 15)
                            AutoScrollingText(text: place.address, fontName: "Apple SD Gothic Neo", fontSize: 15, fontWeight: .thin)
                                .frame(width: 165, height: 18)
                                .clipped()
                                .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        }
                    }
                    .padding(.leading, 20)
                    Spacer()
                }
            )
    }
}

struct AutoScrollingText: View {
    @State private var scrollPosition: CGFloat = 0
    private let text: String
    private let fontName: String
    private let fontSize: CGFloat
    private let fontWeight: Font.Weight

    init(text: String, fontName: String, fontSize: CGFloat, fontWeight: Font.Weight) {
        self.text = text
        self.fontName = fontName
        self.fontSize = fontSize
        self.fontWeight = fontWeight
    }

    var body: some View {
        GeometryReader { geometry in
            Text(text)
                .font(
                    .custom(fontName, size: fontSize)
                    .weight(fontWeight)
                )
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: true)
                .background(GeometryReader {
                    Color.clear.preference(key: TextWidthPreferenceKey.self, value: $0.frame(in: .local).size.width)
                })
                .onPreferenceChange(TextWidthPreferenceKey.self) { textWidth in
                    let visibleWidth = geometry.size.width
                    if textWidth > visibleWidth {
                        let animationDuration = Double(text.count) * 0.3
                        withAnimation(
                            Animation.timingCurve(0.0, 0.0, 0.5, 1, duration: animationDuration)
                                .delay(1)
                                .repeatForever(autoreverses: false)
                        ) {
                            self.scrollPosition = textWidth - visibleWidth
                        }
                    }
                }
                .offset(x: -self.scrollPosition, y: 0)
        }
    }
}

struct TextWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct KakaoSearchView: View {
//    @ObservedObject var kakaoSearchViewModel: KakaoSearchViewModel
//    @ObservedObject var myPlaceListViewModel: MyPlaceListViewModel
    @StateObject var kakaoSearchViewModel = KakaoSearchViewModel.shared
    @StateObject var myPlaceListViewModel = MyPlaceListViewModel.shared
    @Binding var path: [PathModel]
    @Binding var searchText: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(Color(red: 0.97, green: 0.97, blue: 0.98))
            .frame(height: 40)
            .overlay(
                HStack {
                    Image("Map")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 19, height: 19)
                        .padding(.leading, 15)
                    TextField("장소명 검색하기", text: $searchText)
                        .font(
                            .custom("Apple SD Gothic Neo", size: 15)
                            .weight(.semibold)
                        )
                        .foregroundStyle(.gray)
                        .padding(.leading, 5)
                    Button(action: {
                        kakaoSearchViewModel.search(query: searchText)
                        myPlaceListViewModel.getMyPlaceList(keyword: searchText)
                        path.append(.searchView)
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                }
            )
    }
}

struct BackgroundBlurView: UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
        
        DispatchQueue.main.async{
            view.superview?.superview?.backgroundColor = .clear
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}

#Preview {
    ViewComponents()
}
