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
            PlaceInformation_DayOffPopup(isPopupPresented: .constant(true), selectedDayOffIndices: .constant([]))
            PlaceInformation_ServicePopup(isPopupPresented: .constant(true), selectedServiceIndices: .constant([]))
            SearchPopup(path: .constant([]), isPopupPresented: .constant(true), popupViewModel: PopupViewModel())
//            FilterPopup(isPopupPresented: .constant(true))
        }
    }
}

struct SearchPopup: View {
    @Binding var path: [PathModel]
    @Binding var isPopupPresented: Bool
    @StateObject var popupViewModel = PopupViewModel.shared
    @StateObject var myPlaceInformationEditViewModel = MyPlaceInformationEditViewModel.shared
    @State var selectedType: PlaceType?
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.6))
            .frame(width: 330, height: 350)
            .overlay(
                VStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                isPopupPresented.toggle()
                            }
                        }) {
                            Xmark()
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
                                    if index < PlaceType.allCases.count {
                                        let placeType = PlaceType.allCases[index]
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(selectedType == placeType ? Color.accentColor : Color(red: 0.97, green: 0.95, blue: 1))
                                            .frame(width: 58, height: 24)
                                            .overlay(
                                                Text("\(placeType.stringValue)")
                                                    .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                                    .foregroundStyle(selectedType == placeType ? Color.white : Color(red: 0.4, green: 0.35, blue: 0.96))
                                                    .padding(.top, 2)
                                            )
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                                            )
                                            .onTapGesture {
                                                withAnimation {
                                                    selectedType = placeType
                                                }
                                            }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 15)
                    Button(action: {
                        myPlaceInformationEditViewModel.name = popupViewModel.selectedPlace?.placeName ?? "장소"
                        myPlaceInformationEditViewModel.address = popupViewModel.selectedPlace?.address ?? "주소"
                        myPlaceInformationEditViewModel.categoryId = selectedType!.rawValue
                        withAnimation {
                            isPopupPresented.toggle()
                        }
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
                    .disabled(selectedType == nil)
                    Spacer()
                }
            )
    }
}

struct FilterPopup: View {
    @Binding var isPopupPresented: Bool
    @StateObject var favoritePostBodyViewModel = FavoritePostBodyViewModel.shared
    @State var selectedTypeIndex: [Int] = []

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.6))
            .frame(width: 330, height: 260)
            .overlay(
                VStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                isPopupPresented.toggle()
                            }
                        }) {
                            Xmark()
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
                                    if index < PlaceType.allCases.count {
                                        let placeType = PlaceType.allCases[index]
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(selectedTypeIndex.contains(placeType.rawValue) ? Color.accentColor : Color(red: 0.97, green: 0.95, blue: 1))

                                            .frame(width: 58, height: 24)
                                            .overlay(
                                                Text("\(placeType.stringValue)")
                                                    .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                                    .foregroundStyle(selectedTypeIndex.contains(placeType.rawValue) ? Color.white : Color(red: 0.4, green: 0.35, blue: 0.96))
                                                    .padding(.top, 2)
                                            )
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                                            )
                                            .onTapGesture {
                                                withAnimation {
                                                    if selectedTypeIndex.contains(placeType.rawValue) {
                                                        selectedTypeIndex.removeAll { $0 == placeType.rawValue }
                                                    } else {
                                                        selectedTypeIndex.append(placeType.rawValue)
                                                    }
                                                    let mappedValues = selectedTypeIndex.map { $0 }
                                                    favoritePostBodyViewModel.category = mappedValues
                                                    print("\(favoritePostBodyViewModel.category)")
                                                }
                                            }
                                    }
                                }
                            }
                        }
                    }
                    Button(action: {
                        withAnimation {
                            isPopupPresented.toggle()
                        }
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
                    Spacer()
                }
            )
            .onAppear {
                selectedTypeIndex = favoritePostBodyViewModel.category
            }
    }
}

struct PlaceInformation_DayOffPopup: View {
    @Binding var isPopupPresented: Bool
    @Binding var selectedDayOffIndices: [Holiday]
    @StateObject var myPlaceInformationEditViewModel = MyPlaceInformationEditViewModel.shared
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.6))
            .frame(width: 330, height: 270)
            .overlay(
                VStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                isPopupPresented.toggle()
                            }
                        }) {
                            Xmark()
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
                                    if index < Holiday.allCases.count {
                                        let holiday = Holiday.allCases[index]
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(selectedDayOffIndices.contains(holiday) ? Color.accentColor : Color(red: 0.97, green: 0.95, blue: 1))
                                            .frame(width: 58, height: 24)
                                            .overlay(
                                                Text(holiday.rawValue)
                                                    .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                                    .foregroundStyle(selectedDayOffIndices.contains(holiday) ? Color.white : Color(red: 0.4, green: 0.35, blue: 0.96))
                                                    .padding(.top, 2)
                                            )
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                                            )
                                            .onTapGesture {
                                                withAnimation {
                                                    if selectedDayOffIndices.contains(holiday) {
                                                        selectedDayOffIndices.removeAll { $0 == holiday }
                                                    } else {
                                                        selectedDayOffIndices.append(holiday)
                                                    }
                                                }
                                            }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 10)
                    Button(action: {
                        myPlaceInformationEditViewModel.closedDay = selectedDayOffIndices.map { $0.rawValue }
                        withAnimation {
                            isPopupPresented.toggle()
                        }
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
                    Spacer()
                }
            )
    }
}

struct PlaceInformation_ServicePopup: View {
    @Binding var isPopupPresented: Bool
    @Binding var selectedServiceIndices: [ProvidedService]
    @StateObject var myPlaceInformationEditViewModel = MyPlaceInformationEditViewModel.shared
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.6))
            .frame(width: 330, height: 320)
            .overlay(
                VStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                isPopupPresented.toggle()
                            }
                        }) {
                            Xmark()
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
                                    if index < ProvidedService.allCases.count {
                                       let service = ProvidedService.allCases[index]
                                        Text(service.rawValue)
                                            .font(Font.custom("Apple SD Gothic Neo", size: 10))
                                            .foregroundStyle(selectedServiceIndices.contains(service) ? Color.white : Color(red: 0.4, green: 0.35, blue: 0.96))
                                            .lineLimit(1)
                                            .padding(.top, 2)
                                            .background(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .foregroundStyle(selectedServiceIndices.contains(service) ? Color.accentColor : Color(red: 0.97, green: 0.95, blue: 1))
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 20)
                                                            .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                                                    )
                                                    .frame(height: 24)
                                                    .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
                                            )
                                            .onTapGesture {
                                                withAnimation {
                                                    if selectedServiceIndices.contains(service) {
                                                        selectedServiceIndices.removeAll { $0 == service }
                                                    } else if selectedServiceIndices.count < 2 {
                                                        selectedServiceIndices.append(service)
                                                    }
                                                }
                                            }
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                    .padding(.top, 10)
                    Button(action: {
                        myPlaceInformationEditViewModel.service = selectedServiceIndices.map {
                            var serviceString = $0.rawValue
                            // 이모지가 포함된 문자열의 맨 앞 이모지를 제거
                            serviceString.removeFirst()
                            return serviceString
                        }
                        withAnimation {
                            isPopupPresented.toggle()
                        }
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
                    .disabled(selectedServiceIndices.isEmpty)
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
