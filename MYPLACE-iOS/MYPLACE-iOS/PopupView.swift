//
//  PopupView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/19/24.
//

import SwiftUI

struct PopupView: View {
    var body: some View {
        ScrollView {
            PlaceInformation_DayOffPopup(isPopupPresented: .constant(true))
            PlaceInformation_ServicePopup(isPopupPresented: .constant(true))
            SearchPopup(path: .constant([]), isPopupPresented: .constant(true))
            FilterPopup(isPopupPresented: .constant(true))
        }
    }
}

struct SearchPopup: View {
    @Binding var path: [PathModel]
    @Binding var isPopupPresented: Bool
    @EnvironmentObject var popupViewModel: PopupViewModel
    @State private var selectedTypeIndex: Int?
    
    let placeTypes: [String] = [
        "카페",
        "중식",
        "일식",
        "양식",
        "한식",
        "술집",
        "디저트",
        "문화공간",
        "아시안",
        "고기",
        "팝업스토어",
        "기타"
    ]
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.6))
            .frame(width: 330, height: 350)
            .overlay(
                VStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            isPopupPresented.toggle()
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 17, height: 17)
                                .foregroundStyle(.white)
                                .padding(.trailing, 20)
                                .padding(.top, 20)
                        }
                    }
                    if let selectedPlace = popupViewModel.selectedPlace {
                        HStack {
                            Text(selectedPlace.placeName)
                                .foregroundStyle(Color.white)
                                .fontWeight(.medium)
                                .padding(.leading, 50)
                            Spacer()
                        }
                        HStack {
                            Image("Map")
                                .resizable()
                                .frame(width: 12, height: 15)
                                .padding(.leading, 30)
                            Text(selectedPlace.address)
                                .foregroundStyle(Color.white)
                                .fontWeight(.medium)
                            Spacer()
                        }
                    }
                    else {
                        HStack {
                            Text("장소")
                                .foregroundStyle(Color.white)
                                .fontWeight(.medium)
                                .padding(.leading, 50)
                            Spacer()
                        }
                        HStack {
                            Image("Map")
                                .resizable()
                                .frame(width: 12, height: 15)
                                .padding(.leading, 30)
                            Text("주소")
                                .foregroundStyle(Color.white)
                                .fontWeight(.medium)
                            Spacer()
                        }
                    }
                    DottedDivider()
                        .padding(.top, 10)
                    Text("이 장소의 유형을 한 가지 선택해주세요!")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 18)
                            .weight(.bold)
                        )
                        .foregroundStyle(.white)
                        .padding(.top, 10)
                    VStack(spacing: 10) {
                        ForEach(0..<3) { row in
                            HStack {
                                ForEach(0..<4) { column in
                                    let index = row * 4 + column
                                    if index < placeTypes.count {
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(selectedTypeIndex == index ? Color.accentColor : Color(red: 0.97, green: 0.95, blue: 1))
                                            .frame(width: 58, height: 24)
                                            .overlay(
                                                Text(placeTypes[index])
                                                    .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                                    .foregroundStyle(selectedTypeIndex == index ? Color.white : Color(red: 0.4, green: 0.35, blue: 0.96))
                                                    .padding(.top, 2)
                                            )
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                                            )
                                            .onTapGesture {
                                                selectedTypeIndex = index
                                            }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 15)
                    Button(action: {
                        isPopupPresented.toggle()
                        path.append(.placeInformationEditView)
                    }) {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 70, height: 30)
                            .overlay(
                                Text("️선택완료")
                                    .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                    .foregroundStyle(.white)
                            )
                    }
                    .padding(.top, 15)
                    .disabled(selectedTypeIndex == nil)
                    Spacer()
                }
            )
    }
}

struct FilterPopup: View {
    @Binding var isPopupPresented: Bool
    @State private var selectedTypeIndex: Int?
    
    let placeTypes: [String] = [
        "카페",
        "중식",
        "일식",
        "양식",
        "한식",
        "술집",
        "디저트",
        "문화공간",
        "아시안",
        "고기",
        "팝업스토어",
        "기타"
    ]
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.6))
            .frame(width: 330, height: 260)
            .overlay(
                VStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            isPopupPresented.toggle()
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 17, height: 17)
                                .foregroundStyle(.white)
                                .padding(.trailing, 20)
                                .padding(.top, 20)
                        }
                    }
                    Text("보고 싶은 관심장소 유형을 선택해보세요!")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 18)
                            .weight(.bold)
                        )
                        .foregroundStyle(.white)
                        .padding(.top, 10)
                    VStack(spacing: 10) {
                        ForEach(0..<3) { row in
                            HStack {
                                ForEach(0..<4) { column in
                                    let index = row * 4 + column
                                    if index < placeTypes.count {
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(selectedTypeIndex == index ? Color.accentColor : Color(red: 0.97, green: 0.95, blue: 1))
                                            .frame(width: 58, height: 24)
                                            .overlay(
                                                Text(placeTypes[index])
                                                    .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                                    .foregroundStyle(selectedTypeIndex == index ? Color.white : Color(red: 0.4, green: 0.35, blue: 0.96))
                                                    .padding(.top, 2)
                                            )
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                                            )
                                            .onTapGesture {
                                                selectedTypeIndex = selectedTypeIndex == index ? nil : index
                                            }
                                    }
                                }
                            }
                        }
                    }
                    Button(action: {
                        isPopupPresented.toggle()
                    }) {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 70, height: 30)
                            .overlay(
                                Text("️선택완료")
                                    .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                    .foregroundStyle(.white)
                            )
                    }
                    .padding(.top, 15)
                    .disabled(selectedTypeIndex == nil)
                    Spacer()
                }
            )
    }
}

struct PlaceInformation_DayOffPopup: View {
    @Binding var isPopupPresented: Bool
    @State private var selectedTypeIndex: Int?
    
    let days: [String] = [
        "월요일",
        "화요일",
        "수요일",
        "목요일",
        "금요일",
        "토요일",
        "일요일",
        "공휴일",
        "연중무휴"
    ]
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.6))
            .frame(width: 330, height: 270)
            .overlay(
                VStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            isPopupPresented.toggle()
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 17, height: 17)
                                .foregroundStyle(.white)
                                .padding(.trailing, 20)
                                .padding(.top, 20)
                        }
                    }
                    Text("이 장소의 휴무 정보를 알려주세요.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 18)
                            .weight(.bold)
                        )
                        .foregroundStyle(.white)
                        .padding(.top, 10)
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(0..<3) { row in
                            HStack {
                                ForEach(0..<4) { column in
                                    let index = row * 4 + column
                                    if index < days.count {
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(selectedTypeIndex == index ? Color.accentColor : Color(red: 0.97, green: 0.95, blue: 1))
                                            .frame(width: 58, height: 24)
                                            .overlay(
                                                Text(days[index])
                                                    .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                                    .foregroundStyle(selectedTypeIndex == index ? Color.white : Color(red: 0.4, green: 0.35, blue: 0.96))
                                                    .padding(.top, 2)
                                            )
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                                            )
                                            .onTapGesture {
                                                selectedTypeIndex = selectedTypeIndex == index ? nil : index
                                            }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 10)
                    Button(action: {
                        isPopupPresented.toggle()
                    }) {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 70, height: 30)
                            .overlay(
                                Text("️선택완료")
                                    .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                    .foregroundStyle(.white)
                            )
                    }
                    .padding(.top, 15)
                    .disabled(selectedTypeIndex == nil)
                    Spacer()
                }
            )
    }
}

struct PlaceInformation_ServicePopup: View {
    @Binding var isPopupPresented: Bool
    @State private var selectedTypeIndex: Int?
    
    let services: [String] = [
        "💰 저렴한 가격",
        "☺️ 친절한 서비스",
        "⛰️ 좋은 뷰",
        "🚗 주차 가능",
        "💺 편안한 좌석",
        "🤤 최고의 맛",
        "🎧 집중하기 좋은 곳",
        "💐 좋은 분위기",
        "👶🏻 키즈존",
        "😻 반려동물 동반",
        "🎶 좋은 음악 큐레이션"
    ]
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.6))
            .frame(width: 330, height: 320)
            .overlay(
                VStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            isPopupPresented.toggle()
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 17, height: 17)
                                .foregroundStyle(.white)
                                .padding(.trailing, 20)
                                .padding(.top, 20)
                        }
                    }
                    Text("이 장소가 제공하는 서비스를\n최대 2개까지 알려주세요.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 18)
                            .weight(.bold)
                        )
                        .lineSpacing(5)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(.top, 10)
                    VStack(alignment: .leading, spacing: 17) {
                        ForEach(0..<4) { row in
                            HStack(spacing: 28) {
                                Spacer()
                                ForEach(0..<3) { column in
                                    let index = row * 3 + column
                                    if index < services.count {                                          
                                        Text(services[index])
                                            .font(Font.custom("Apple SD Gothic Neo", size: 10))
                                            .foregroundStyle(selectedTypeIndex == index ? Color.white : Color(red: 0.4, green: 0.35, blue: 0.96))
                                            .lineLimit(1)
                                            .padding(.top, 2)
                                            .background(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .foregroundStyle(selectedTypeIndex == index ? Color.accentColor : Color(red: 0.97, green: 0.95, blue: 1))
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 20)
                                                            .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                                                    )
                                                    .frame(height: 24)
                                                    .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
                                            )
                                            .onTapGesture {
                                                selectedTypeIndex = selectedTypeIndex == index ? nil : index
                                            }
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                    .padding(.top, 10)
                    Button(action: {
                        isPopupPresented.toggle()
                    }) {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 70, height: 30)
                            .overlay(
                                Text("️선택완료")
                                    .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                    .foregroundStyle(.white)
                            )
                    }
                    .padding(.top, 15)
                    .disabled(selectedTypeIndex == nil)
                    Spacer()
                }
            )
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
    PopupView()
}
