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
    @StateObject var myPlaceInformationEditViewModel = MyPlaceInformationEditViewModel.shared
    @State private var selectedImage: [UIImage] = []
    
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
                    SearchItemView_UnRegistered(path: $path, placeName: (PlaceType( rawValue: myPlaceInformationEditViewModel.categoryId)?.emojiForCategory() ?? "") + selectedPlace.placeName, addressName: selectedPlace.address, isEditing: true)
                        .padding(.bottom, -10)
                } else {
                    Text("뭔가 잘못됐어!!!")
                }
                
                VStack(spacing: 10) {
                    HStack(spacing: 0) {
                        Text("추천 메뉴")
                            .font(
                                .custom("Apple SD Gothic Neo", size: 18)
                                .weight(.bold)
                            )
                            .padding(.top, 15)
                            .padding(.leading, 33)
                        Spacer()
                    }
                    CustomTextField(text: $myPlaceInformationEditViewModel.recDish, placeholder: "추천 메뉴를 1가지 입력해주세요", characterLimit: 15)
                    
                    HStack(spacing: 0) {
                        Text("휴무일")
                            .font(
                                .custom("Apple SD Gothic Neo", size: 18)
                                .weight(.bold)
                            )
                            .padding(.top, 15)
                            .padding(.leading, 33)
                        Spacer()
                    }
                    if selectedDayOffIndices.isEmpty {
                        Rectangle()
                            .stroke(Color(red: 0.62, green: 0.64, blue: 0.67), lineWidth: 1)
                            .foregroundStyle(.white)
                            .frame(width: 320, height: 30)
                            .overlay(
                                HStack {
                                    Text("휴무일을 입력해주세요.")
                                        .font(
                                            .custom("Apple SD Gothic Neo", size: 15)
                                            .weight(.thin)
                                        )
                                        .foregroundStyle(.gray)
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                            )
                            .onTapGesture {
                                isDayOffPopupPresented.toggle()
                            }
                    }
                    else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .center, spacing: 8) {
                                ForEach(selectedDayOffIndices, id: \.self) { holiday in
                                    RedChip(text: holiday.rawValue)
                                }
                                .onTapGesture {
                                    isDayOffPopupPresented.toggle()
                                }
                                Spacer()
                            }
                            .frame(height: 30)
                            .padding(.leading, 5)
                        }
                        .frame(width: 320)
                    }

                    HStack(spacing: 0) {
                        Text("제공 서비스")
                            .font(
                                .custom("Apple SD Gothic Neo", size: 18)
                                .weight(.bold)
                            )
                            .padding(.top, 15)
                            .padding(.leading, 33)
                        Spacer()
                    }
                    if selectedServiceIndices.isEmpty {
                        Rectangle()
                            .stroke(Color(red: 0.62, green: 0.64, blue: 0.67), lineWidth: 1)
                            .foregroundStyle(.white)
                            .frame(width: 320, height: 30)
                            .overlay(
                                HStack {
                                    Text("제공 서비스를 선택해주세요.")
                                        .font(
                                            .custom("Apple SD Gothic Neo", size: 15)
                                            .weight(.thin)
                                        )
                                        .foregroundStyle(.gray)
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                            )
                            .onTapGesture {
                                isServicePopupPresented.toggle()
                            }
                    }
                    else {
                        Button (action: {
                            isServicePopupPresented.toggle()
                        }) {
                            HStack(alignment: .center, spacing: 8) {
                                ForEach(selectedServiceIndices, id: \.self) { service in
                                    BlueChip(text: service.rawValue, isSelected: false)
                                }
                                Spacer()
                            }
                            .frame(height: 30)
                            .padding(.leading, 37)
                        }
                    }
                    HStack(spacing: 0) {
                        Text("인스타그램")
                            .font(
                                .custom("Apple SD Gothic Neo", size: 18)
                                .weight(.bold)
                            )
                            .padding(.top, 15)
                            .padding(.leading, 4)
                        Spacer()
                    }
                    CustomTextField(text: $myPlaceInformationEditViewModel.link, placeholder: "장소의 인스타그램 계정을 입력해주세요.", characterLimit: 30)
                    HStack(spacing: 0) {
                        Text("#태그")
                            .font(
                                .custom("Apple SD Gothic Neo", size: 16)
                                .weight(.bold)
                            )
                            .padding(.top, 10)
                            .padding(.leading, 37)
                        Spacer()
                    }
                    HStack(spacing: 10) {
                        TagView(tag: $myPlaceInformationEditViewModel.hashtag[0])
                            .padding(.leading, 37)
                        TagView(tag: $myPlaceInformationEditViewModel.hashtag[1])
                        TagView(tag: $myPlaceInformationEditViewModel.hashtag[2])
                        Spacer()
                    }
                }
                .padding(.top, 20)
                HStack {
                    ForEach(selectedImage.indices, id: \.self) { index in
                        let image = selectedImage[index]
                        ZStack {
                            let resizedImage = resizeImage(image: image, targetSize: CGSize(width: 82, height: 82))
                            Image(uiImage: resizedImage)
                            Button(action: {
                                selectedImage.remove(at: index)
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.red)
                            }
                            .offset(x: 82/2, y: -82/2)
                        }
                        .frame(width: 82, height: 82)
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
                        .foregroundStyle(.black.opacity(0.4))
                    Spacer()
                }
                .padding(.leading, 38)
                .padding(.top, 5)
                HStack(spacing: 80) {
                    Button(action:  {
                        myPlaceInformationEditViewModel.lat = popupViewModel.selectedPlace?.x ?? "0"
                        myPlaceInformationEditViewModel.lon = popupViewModel.selectedPlace?.y ?? "0"
                        updateViewModelWithFormData(images: selectedImage)
                        MyPlaceManager.shared.registerMyPlace(query: myPlaceInformationEditViewModel) { error in
                            if let error = error {
                                myPlaceInformationEditViewModel.reset()
                                selectedDayOffIndices.removeAll()
                                selectedServiceIndices.removeAll()
                                print("Error registering place: \(error.localizedDescription)")
                                path.removeLast()
                            } else {
                                print("SUCCESSSSSSSSSSSSSSSSSSSSSSSSSSS")
                                myPlaceInformationEditViewModel.reset()
                                selectedDayOffIndices.removeAll()
                                selectedServiceIndices.removeAll()
                                path.removeLast()
                            }
                        }

//                        myPlaceInformationEditViewModel.reset()
//                        print("RESET&&&&&&&&&&&&&&&&&&&: \(myPlaceInformationEditViewModel)")
//                        path.removeLast()
                    }) {
                        Text("등록완료")
                            .font(
                                .custom("Apple SD Gothic Neo", size: 15)
                            )
                            .foregroundStyle(.white)
                            .frame(width: 60, alignment: .center)
                            .background(
                                RoundedRectangle(cornerRadius: 7)
                                    .foregroundStyle(Color.accentColor)
                                    .frame(width: 130, height: 40)
                            )
                    }
                    Button(action:  {
                        myPlaceInformationEditViewModel.reset()
                        selectedDayOffIndices.removeAll()
                        selectedServiceIndices.removeAll()
                        path.removeLast()
                    }) {
                        Text("돌아가기")
                            .font(Font.custom("Apple SD Gothic Neo", size: 15))
                            .foregroundStyle(Color.accentColor)
                            .frame(width: 60, alignment: .center)
                            .background(
                                RoundedRectangle(cornerRadius: 7)
                                    .stroke(Color.accentColor, lineWidth: 2)
                                    .frame(width: 130, height: 40)
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
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(targetSize)
        image.draw(in: CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    func updateViewModelWithFormData(images: [UIImage]) {
        let boundary = "Boundary-\(UUID().uuidString)"
        var formData = Data()

        for image in images {
            guard let imageData = image.jpegData(compressionQuality: 0.5) else {
                continue
            }

            formData.append("--\(boundary)\r\n".data(using: .utf8)!)
            formData.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpeg\"\r\n".data(using: .utf8)!)
            formData.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
            formData.append(imageData)
            formData.append("\r\n".data(using: .utf8)!)
        }

        formData.append("--\(boundary)\r\n".data(using: .utf8)!)

        // Now you have the form data, you can update your ViewModel here
        // For example, you might have a function in your ViewModel like this:
        // viewModel.updateImages(formData: formData)
    }

    
}

struct CustomTextField: View {
    @Binding var text: String
    
    let placeholder: String
    let characterLimit: Int
    
    var body: some View {
        Rectangle()
            .stroke(Color(red: 0.62, green: 0.64, blue: 0.67), lineWidth: 1)
            .foregroundStyle(.white)
            .frame(width: 320, height: 30)
            .overlay(
                TextField(placeholder, text: $text)
                    .onChange(of: text) {
                        if text.count > characterLimit {
                            text = String(text.prefix(characterLimit))
                        }
                    }
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
    @Binding var selectedImage: [UIImage]
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
                    if let imageData = try? await selectedItem?.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: imageData) {
                            selectedImage.append(uiImage)
                        }
                        selectedItem = nil
                    }
                }
            }
    }
}


#Preview {
    PlaceInformationEditView(
        path: .constant([]), isHeartFilled: .constant(false), selectedDayOffIndices: .constant([Holiday.monday, Holiday.tuesday, Holiday.wednesday, Holiday.thursday, Holiday.friday, Holiday.saturday]), selectedServiceIndices: .constant(([]))
    )
}
