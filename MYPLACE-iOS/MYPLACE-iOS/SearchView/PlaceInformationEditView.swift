//
//  PlaceInformationEditView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/30/23.
//

import SwiftUI
import PhotosUI

struct PlaceInformationEditView: View {
    @Binding var path: [PathModel]
    @Binding var isHeartFilled: Bool
    @StateObject var popupViewModel = PopupViewModel.shared
    @State var isFirstImageSelected: Bool = false
    @State var isSecondImageSelected: Bool = false
    @State var isThirdImageSelected: Bool = false
    
    @State private var recommendedMenu: String = ""
    @State private var dayOff: String = ""
    @State private var providedService: String = ""
    @State private var url: String = ""
    @State private var tag: String = ""
    @State private var tags: [String] = []
    
    @State private var isDayOffPopupPresented = false
    @Binding var selectedDayOffIndices: [Holiday]
    @State private var isServicePopupPresented = false
    @Binding var selectedServiceIndices: [ProvidedService]
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 3) {
                    Text("다른 사용자들을 위해 조금 더 자세히 입력해주시면")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 14)
                            .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color(red: 0.49, green: 0.47, blue: 0.75))
                        .frame(width: 301, alignment: .top)
                        .toolbar(.hidden)
                    Text("10포인트를 지급해드려요!")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 15)
                            .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color(red: 0.49, green: 0.47, blue: 0.75))
                        .frame(width: 301, alignment: .top)
                        .toolbar(.hidden)
                }
                .padding(.top, 10)
                if let selectedPlace = popupViewModel.selectedPlace {
                    SearchItemView_UnRegistered(path: $path, placeName: selectedPlace.placeName, addressName: selectedPlace.address, isEditing: true)
                } else {
                    SearchItemView_Registered(isHeartFilled: $isHeartFilled, path: $path, place: places[1])
                        .padding(.top, 10)
                }
                
                VStack(spacing: 10) {
                    SectionView(imageName: "Fork", title: "추천 메뉴", placeholder: "추천 메뉴를 1가지 입력해주세요.", text: $recommendedMenu)
                    HStack(spacing: 0) {
                        Image("Clock")
                            .resizable()
                            .frame(width: 18, height: 16)
                            .padding(.leading, 33)
                            .padding(.top, 13)
                        Text("휴무일")
                            .font(
                                .custom("Apple SD Gothic Neo", size: 18)
                                .weight(.bold)
                            )
                            .padding(.top, 15)
                            .padding(.leading, 4)
                        Spacer()
                    }
                    if selectedDayOffIndices.isEmpty {
                        Button (action: {
                            isDayOffPopupPresented.toggle()
                        }) {
                            CustomTextField(placeholder: "휴무일을 입력해주세요.", text: $dayOff)
                        }
                    }
                    else {
                        Button (action: {
                            isDayOffPopupPresented.toggle()
                        }) {
                            HStack(spacing: 8) {
                                ForEach(selectedDayOffIndices, id: \.self) { holiday in
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundStyle(Color(red: 1, green: 0.95, blue: 0.95))
                                        .frame(width: 58, height: 24)
                                        .overlay(
                                            Text(holiday.rawValue)
                                                .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                                .foregroundStyle(Color(red: 0.89, green: 0.39, blue: 0.39))
                                                .padding(.top, 2)
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color(red: 0.89, green: 0.39, blue: 0.39), lineWidth: 1)
                                        )
                                }
                            }
                        }
                    }

                    HStack(spacing: 0) {
                        Image("MoneyBag")
                            .resizable()
                            .frame(width: 18, height: 16)
                            .padding(.leading, 33)
                            .padding(.top, 13)
                        Text("제공 서비스")
                            .font(
                                .custom("Apple SD Gothic Neo", size: 18)
                                .weight(.bold)
                            )
                            .padding(.top, 15)
                            .padding(.leading, 4)
                        Spacer()
                    }
                    if selectedServiceIndices.isEmpty {
                        Button (action: {
                            isServicePopupPresented.toggle()
                        }) {
                            CustomTextField(placeholder: "제공 서비스를 선택해주세요.", text: $providedService)
                        }
                    }
                    else {
                        Button (action: {
                            isServicePopupPresented.toggle()
                        }) {
                            HStack(spacing: 8) {
                                ForEach(selectedServiceIndices, id: \.self) { service in
                                    Text(service.rawValue)
                                        .font(Font.custom("Apple SD Gothic Neo", size: 10))
                                        .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                        .lineLimit(1)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(Color(red: 0.97, green: 0.95, blue: 1))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                                                )
                                        )
                                }
                            }
                        }
                    }
                    SectionView(imageName: "CheckMark", title: "외부 링크", placeholder: "URL 형태로 입력해주세요.", text: $url)
                    HStack(spacing: 0) {
                        Text("#태그")
                            .font(
                                .custom("Apple SD Gothic Neo", size: 16)
                                .weight(.bold)
                            )
                            .padding(.top, 15)
                            .padding(.leading, 37)
                        Spacer()
                    }
                    CustomTextField(placeholder: "장소를 나타내는 #태그를 3개까지만 입력해주세요.", text: $tag)
                        .submitLabel(.done)
                        .onSubmit {
                            if !tag.isEmpty {
                                let newTags = tag.split(separator: "\n").map { String($0) }
                                tags.append(contentsOf: newTags)
                                tag = " "
                            }
                        }
                        .overlay(
                            HStack {
                                ForEach(tags.indices, id: \.self) { index in
                                    HStack(spacing: 3) {
                                        Text(tags[index])
                                            .font(
                                                Font.custom("Apple SD Gothic Neo", size: 12)
                                                    .weight(.bold)
                                            )
                                            .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                            .padding(.top, 2)
                                        Button(action: {
                                            tags.remove(at: index)
                                        }) {
                                            Image(systemName: "xmark")
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                                .foregroundStyle(.gray)
                                                .bold()
                                        }
                                    }
                                    .frame(height: 22)
                                    .padding(.horizontal, 8)
                                    .background(Color(red: 0.97, green: 0.95, blue: 1))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .inset(by: 0.5)
                                            .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                                    )
                                }
                                Spacer()
                            }
                    )
                }
                .padding(.top, 20)
                HStack {
                    SquarePhotosPicker(squareWidth: 82, squareHeight: 82, isSelected: $isFirstImageSelected)
                    if isFirstImageSelected {
                        SquarePhotosPicker(squareWidth: 82, squareHeight: 82, isSelected: $isSecondImageSelected)
                    }
                    if isSecondImageSelected {
                        SquarePhotosPicker(squareWidth: 82, squareHeight: 82, isSelected: $isThirdImageSelected)
                    }
                    Spacer()
                }
                .padding(.leading, 38)
                .padding(.top, 5)
                
                HStack {
                    Text("첫 번째 사진은 썸네일로 사용됩니다.")
                        .font(Font.custom("Apple SD Gothic Neo", size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.4))
                    Spacer()
                }
                .padding(.leading, 38)
                .padding(.top, 5)
                HStack(spacing: 40) {
                    Button(action:  {
                        path.removeLast()
                    }) {
                        Text("등록완료")
                            .font(
                                .custom("Apple SD Gothic Neo", size: 15)
                            )
                            .foregroundStyle(.white)
                            .frame(width: 60, alignment: .center)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .foregroundStyle(Color(red: 0, green: 0.48, blue: 1))
                                    .frame(width: 90, height: 40)
                            )
                    }
                    Button(action:  {
                        path.removeLast()
                        selectedDayOffIndices.removeAll()
                        selectedServiceIndices.removeAll()
                    }) {
                        Text("돌아가기")
                            .font(Font.custom("Apple SD Gothic Neo", size: 15))
                            .foregroundStyle(Color(red: 0, green: 0.48, blue: 1))
                            .frame(width: 60, alignment: .center)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color(red: 0, green: 0.48, blue: 1), lineWidth: 2)
                                    .foregroundStyle(Color(red: 0, green: 0.48, blue: 1))
                                    .frame(width: 90, height: 40)
                            )
                    }
                }
                .padding(.top, 15)
                Spacer()
            }
            .blur(radius: isServicePopupPresented || isDayOffPopupPresented ? 10 : 0)
            .disabled(isDayOffPopupPresented || isServicePopupPresented)
            if isDayOffPopupPresented {
                PlaceInformation_DayOffPopup(isPopupPresented: $isDayOffPopupPresented, selectedDayOffIndices: $selectedDayOffIndices)
            }
            else if isServicePopupPresented {
                PlaceInformation_ServicePopup(isPopupPresented: $isServicePopupPresented, selectedServiceIndices: $selectedServiceIndices)
            }
        }
    }
}

struct SectionView: View {
    let imageName: String
    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        HStack(spacing: 0) {
            Image(imageName)
                .resizable()
                .frame(width: 18, height: 16)
                .padding(.leading, 33)
                .padding(.top, 13)
            Text(title)
                .font(
                    .custom("Apple SD Gothic Neo", size: 18)
                    .weight(.bold)
                )
                .padding(.top, 15)
                .padding(.leading, 4)
            Spacer()
        }
        CustomTextField(placeholder: placeholder, text: $text)
    }
}

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        Rectangle()
            .stroke(Color(red: 0.62, green: 0.64, blue: 0.67), lineWidth: 1)
            .foregroundStyle(.white)
            .frame(width: 320, height: 30)
            .overlay(
                TextField(placeholder, text: $text)
                    .font(
                        .custom("Apple SD Gothic Neo", size: 15)
                        .weight(.medium)
                    )
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.gray)
                    .padding(.leading, 10)
            )
    }
}

struct SquarePhotosPicker: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    var squareWidth: CGFloat
    var squareHeight: CGFloat
    @Binding var isSelected: Bool

    var body: some View {
        if let selectedImageData,
           let uiImage = UIImage(data: selectedImageData) {
            ZStack {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: squareWidth, height: squareHeight)
                    .scaledToFill()
                Button(action: {
                    deleteSelectedImage()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                }
                .offset(x: squareWidth/2, y: -squareHeight/2)
            }
            .frame(width: squareWidth, height: squareHeight)
        }
        else {
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    Rectangle()
                        .stroke(Color(red: 0.62, green: 0.64, blue: 0.67), lineWidth: 1)
                        .foregroundStyle(.clear)
                        .frame(width: squareWidth, height: squareHeight)
                        .overlay(
                            Image(systemName: "plus")
                                .font(
                                    .system(size: 20)
                                    .bold()
                                )
                                .foregroundStyle(Color(red: 0.62, green: 0.64, blue: 0.67))
                        )
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                            isSelected = true
                        }
                    }
                }
        }
    }
    private func deleteSelectedImage() {
        selectedImageData = nil
        isSelected = false
    }
}

#Preview {
    PlaceInformationEditView(
        path: .constant([]), isHeartFilled: .constant(false), selectedDayOffIndices: .constant([]), selectedServiceIndices: .constant(([]))
    )
}
