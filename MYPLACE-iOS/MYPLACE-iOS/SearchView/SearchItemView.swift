//
//  SearchItemView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/5/24.
//

import SwiftUI

struct SearchItemView: View {
    var body: some View {
        SearchItemView_Registered(isHeartFilled: .constant(false), path: .constant([]), place: places[1])
        SearchItemView_UnRegistered(path: .constant([]), placeName: "카카오프렌즈카카오프렌즈카카오프렌즈", addressName: "서울")
        FavoriteItemView(path: .constant([]), isVisited: .constant(false), place: places[1])
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
                            Group {
                                GeometryReader { proxy in
                                    RewindingTextTicker(
                                        textKey: placeName,
                                        viewWidth: proxy.size.width
                                    )
                                }
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 18)
                                    .weight(.semibold)
                                )
                                .frame(height: 22)
                                .lineLimit(1)
                            }
                            .frame(width: 165)
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

struct OffsetModifier: ViewModifier, Animatable {
    private let maxOffset: CGFloat
    private let rewindSpeedFactor: Int
    private let endWaitFraction: CGFloat
    private var progress: CGFloat
    
    // The progress value at which the end wait begins
    private let endWaitThreshold: CGFloat
    
    // The progress value at which rewind begins
    private let rewindThreshold: CGFloat
    
    init(
        maxOffset: CGFloat,
        rewindSpeedFactor: Int = 5,
        endWaitFraction: CGFloat = 0,
        progress: CGFloat
    ) {
        self.maxOffset = maxOffset
        self.rewindSpeedFactor = rewindSpeedFactor
        self.endWaitFraction = endWaitFraction
        self.progress = progress
        
        // Compute the thresholds for waiting and for rewinding
        let rewindFraction = (CGFloat(1) - endWaitFraction) / CGFloat(rewindSpeedFactor + 1)
        self.rewindThreshold = CGFloat(1) - rewindFraction
        self.endWaitThreshold = CGFloat(1) - rewindFraction - endWaitFraction
    }
    
    /// Implementation of protocol property
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    var xOffset: CGFloat {
        let fraction: CGFloat
        if progress > rewindThreshold {
            fraction = endWaitThreshold - ((progress - rewindThreshold) * CGFloat(rewindSpeedFactor))
        } else {
            fraction = min(progress, endWaitThreshold)
        }
        return endWaitThreshold > 0 ? (fraction / endWaitThreshold) * maxOffset : 0
    }
    
    func body(content: Content) -> some View {
        content.offset(x: xOffset)
    }
}

struct RewindingTextTicker: View {
    let textKey: String
    let viewWidth: CGFloat
    let beginEndDelaySecs: TimeInterval
    
    init(
        textKey: String,
        viewWidth: CGFloat,
        beginEndDelaySecs: TimeInterval = 1.0
    ) {
        self.textKey = textKey
        self.viewWidth = viewWidth
        self.beginEndDelaySecs = beginEndDelaySecs
    }
    
    let pixelsPerSec = 100
    @State private var progress = CGFloat.zero
    
    private func duration(width: CGFloat) -> TimeInterval {
        (TimeInterval(max(width, 0)) / TimeInterval(pixelsPerSec)) + beginEndDelaySecs
    }
    
    private func endWaitFraction(textWidth: CGFloat) -> CGFloat {
        let totalDuration = duration(width: textWidth - viewWidth)
        return totalDuration > 0 ? beginEndDelaySecs / totalDuration : 0
    }
    
    var body: some View {
        // Display the full text on one line.
        // This establishes the width that is needed
        Text(LocalizedStringKey(textKey))
            .lineLimit(1)
            .fixedSize(horizontal: true, vertical: true)
        // Perform the animation in an overlay
            .overlay(
                GeometryReader { proxy in
                    Text(LocalizedStringKey(textKey))
                        .modifier(
                            OffsetModifier(
                                maxOffset: viewWidth - proxy.size.width,
                                endWaitFraction: endWaitFraction(textWidth: proxy.size.width),
                                progress: progress
                            )
                        )
                        .animation(
                            .linear(duration: duration(width: proxy.size.width - viewWidth))
                            .delay(beginEndDelaySecs)
                            .repeatForever(autoreverses: false),
                            value: progress
                        )
                    // Mask out the base view
                    //MARK: - 글씨 뒷 배경 색
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                }
            )
            .onAppear { progress = 1.0 }
    }
}

#Preview {
    SearchItemView()
}
