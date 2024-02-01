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
    @State private var selectedImage: [Image?] = []
    
    @State private var recommendedMenu: String = ""
    @State private var dayOff: String = ""
    @State private var providedService: String = ""
    @State private var url: String = ""
    @State private var tag1: String = ""
    @State private var tag2: String = ""
    @State private var tag3: String = ""
    
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
                    //MARK: - 15자 제한
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
                    SectionView(imageName: "CheckMark", title: "인스타그램", placeholder: "장소의 인스타그램 계정을 입력해주세요.", text: $url)
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
                    HStack(spacing: 10) {
                        TagView(tag: $tag1)
                            .padding(.leading, 37)
                        TagView(tag: $tag2)
                        TagView(tag: $tag3)
                        Spacer()
                    }
                }
                .padding(.top, 20)
                HStack {
//                    SquarePhotosPicker(selectedImage: $selectedImage, imageIndex: $imageIndex, squareWidth: 82, squareHeight: 82)
//                    if isImageSelected[0] {
//                        SquarePhotosPicker(selectedImage: $selectedImage, imageIndex: $imageIndex, squareWidth: 82, squareHeight: 82)
//                    }
//                    if isImageSelected[0] && isImageSelected[1] {
//                        SquarePhotosPicker(selectedImage: $selectedImage, imageIndex: $imageIndex, squareWidth: 82, squareHeight: 82)
//                    }
//                    if let selectedImage = selectedImage[imageIndex] {
//                        ZStack {
//                            selectedImage
//                                .resizable()
//                                .frame(width: 82, height: 82)
//                                .scaledToFill()
//                            Button(action: {
//                                self.selectedImage.remove(at: imageIndex)
////                                selectedItem = nil
//                            }) {
//                                Image(systemName: "xmark.circle.fill")
//                                    .foregroundColor(.red)
//                            }
//                            .offset(x: 82/2, y: -82/2)
//                        }
//                        .frame(width: 82, height: 82)
//                    }
//                    else {
//                        SquarePhotosPicker(selectedImage: $selectedImage, imageIndex: $imageIndex, squareWidth: 82, squareHeight: 82)
//                    }
                    ForEach(selectedImage.indices, id: \.self) { index in
                        if let image = selectedImage[index] {
                            ZStack {
                                image
                                    .resizable()
                                    .frame(width: 82, height: 82)
                                    .scaledToFill()
                                Button(action: {
                                    selectedImage.remove(at: index)
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                }
                                .offset(x: 82/2, y: -82/2)
                            }
                            .frame(width: 82, height: 82)
                        }
                        else {
                            SquarePhotosPicker(selectedImage: $selectedImage, squareWidth: 82, squareHeight: 82)
                        }
                    }
                    if selectedImage.count < 3 {
                        SquarePhotosPicker(selectedImage: $selectedImage, squareWidth: 82, squareHeight: 82)
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

struct TagView: View {
    @Binding var tag: String
    @State private var isSubmitted = false
    
    var body: some View {
        HStack {
            if !isSubmitted {
                Rectangle()
                    .stroke(Color(red: 0.62, green: 0.64, blue: 0.67), lineWidth: 1)
                    .foregroundStyle(.white)
                    .frame(width: 55, height: 30)
                    .overlay(
                        HStack {
                            TextField("#", text: $tag)
                                .submitLabel(.done)
                                .onChange(of: tag) {
                                    if tag.count > 11 {
                                        tag = String(tag.prefix(11))
                                    }
                                }
                                .onTapGesture {
                                    if tag.isEmpty {
                                        tag = "#"
                                    }
                                }
                                .onSubmit {
                                    if tag.isEmpty || tag == "#" {
                                        tag = "#"
                                    }
                                    else if !tag.hasPrefix("#") {
                                        tag = "#" + tag
                                        isSubmitted.toggle()
                                    }
                                    else {
                                        isSubmitted.toggle()
                                    }
                                }
                                .autocapitalization(.none)
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 15)
                                    .weight(.medium)
                                )
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.gray)
                                .padding(.leading, 10)
                            
                            Spacer()
                        }
                    )
            }
            else {
                Text(tag)
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 14)
                    )
                    .foregroundStyle(.black)
                    .padding(.top, 2)
                    .background(
                        Rectangle()
                            .foregroundStyle(Color(red: 0.98, green: 0.96, blue: 1))
                            .frame(height: 30)
                            .overlay(
                                Rectangle()
                                    .stroke(Color(red: 0.62, green: 0.64, blue: 0.67), lineWidth: 1)
                            )
                            .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
                    )
                    .padding([.leading, .trailing], 10)
                    .onTapGesture {
                        isSubmitted.toggle()
                    }
            }
        }
    }
}

struct SquarePhotosPicker: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @Binding var selectedImage: [Image?]
    var squareWidth: CGFloat
    var squareHeight: CGFloat

    var body: some View {
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
            .onChange(of: selectedItem) {
                Task {
                    if let image = try? await selectedItem?.loadTransferable(type: Image.self) {
                        selectedImage.append(image)
                        selectedItem = nil
                    }
                }
            }
    }
}


#Preview {
    PlaceInformationEditView(
        path: .constant([]), isHeartFilled: .constant(false), selectedDayOffIndices: .constant([]), selectedServiceIndices: .constant(([]))
    )
}
