//
//  ViewComponents.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/5/24.
//

import SwiftUI

struct ViewComponents: View {
    var body: some View {
        SearchItemView_Registered(isHeartFilled: .constant(false), path: .constant([]), place: dummyPlaces[1])
        SearchItemView_UnRegistered(path: .constant([]), placeName: "카카오프렌즈카카오프렌즈카카오프렌즈", addressName: "서울")
        FavoriteItemView(path: .constant([]), isVisited: .constant(false), place: dummyPlaces[1])
    }
}

struct SearchItemView_Registered: View {
    @Binding var isHeartFilled: Bool
    @Binding var path: [PathModel]
    var place: PlaceModel
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color(red: 0.96, green: 0.96, blue: 0.96))
            .frame(width: 340, height: 80)
            .overlay(
                HStack {
                    Image(place.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text(place.name)
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 18)
                                    .weight(.semibold)
                                )
                                .foregroundStyle(.black)
                            Spacer()
                            Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                                .foregroundStyle(isHeartFilled ? .red : .gray)
                                .onTapGesture {
                                    isHeartFilled.toggle()
                                    let toastMessage = isHeartFilled ? "관심 장소로 저장되었습니다." : "관심 장소 저장이 해제되었습니다."
                                    ToastViewModel.shared.showToastWithString(text: toastMessage)
                                }
                                .padding(.trailing, 10)
                                .padding(.bottom, 5)
                        }
                        HStack {
                            Image("Map")
                                .resizable()
                                .frame(width: 12, height: 15)
                            Text(place.address)
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 15)
                                    .weight(.thin)
                                )
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
    @State private var offset: CGFloat = 0
    @State private var textWidth: CGFloat = 0
    @State private var scrollPosition: CGFloat = 0
    private func startScrolling(in textWidth: CGFloat, parentWidth: CGFloat) {
        let distance = textWidth + parentWidth
        withAnimation(Animation.linear(duration: Double(distance) / 50)) {
            self.offset = -distance
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(distance) / 50) {
            withAnimation(.none) {
                self.offset = 0
                self.startScrolling(in: textWidth, parentWidth: parentWidth)
            }
        }
    }
    private func calculateTextWidth(text: String, fontSize: CGFloat) -> CGFloat {
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: fontSize)]
        let size = (text as NSString).size(withAttributes: attributes)
        return ceil(size.width)
    }
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color(red: 0.96, green: 0.96, blue: 0.96))
            .frame(width: 340, height: 80)
            .overlay(
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 70, height: 70)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                        .foregroundStyle(Color(red: 0.88, green: 0.88, blue: 0.88))
                        .overlay(
                            Image("MyPlaceLogo")
                        )
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            AutoScrollingText(text: placeName, fontName: "Apple SD Gothic Neo", fontSize: 18, fontWeight: .semibold)
                                .frame(width: 165, height: 22)
                                .clipped()
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
                                            .foregroundColor(.clear)
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
                            Text(addressName)
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 15)
                                    .weight(.thin)
                                )
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
    @Binding var isVisited: Bool
    var place: PlaceModel
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(width: 340, height: 80)
            .foregroundStyle(isVisited ? Color(red: 0.96, green: 0.96, blue: 0.96) : Color(red: 0.93, green: 0.93, blue: 1))
            .overlay(
                HStack {
                    Image(place.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Image("CafeIcon")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text(place.name)
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 18)
                                    .weight(.semibold)
                                )
                                .foregroundStyle(.black)
                            Spacer()
                        }
                        HStack {
                            Image("Map")
                                .resizable()
                                .frame(width: 12, height: 15)
                            Text(place.address)
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 15)
                                    .weight(.thin)
                                )
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
                        .weight(self.fontWeight)
                )
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: true)
                .offset(x: -self.scrollPosition, y: 0)
                .animation(
                    Animation.timingCurve(0.0, 0.0, 0.5, 1, duration: Double(self.text.count) * 0.3)
                        .delay(1)
                        .repeatForever(autoreverses: false),
                    value: self.scrollPosition
                )
                .onAppear {
                    let textWidth = self.calculateTextWidth(text: self.text, fontSize: self.fontSize)
                    self.scrollPosition = textWidth > geometry.size.width ? textWidth - geometry.size.width : 0
                }
        }
    }

    private func calculateTextWidth(text: String, fontSize: CGFloat) -> CGFloat {
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: fontSize)]
        let size = (text as NSString).size(withAttributes: attributes)
        return ceil(size.width)
    }
}

#Preview {
    ViewComponents()
}
