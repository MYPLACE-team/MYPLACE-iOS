//
//  ArchiveEditView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/18/24.
//

import SwiftUI
import PhotosUI

struct ArchiveEditView: View {
    @State private var showPublicInfo: Bool = false
    
    @State private var folderName: String = ArchiveDetailViewModel.shared.archiveDetail.folderName
    @State private var folderId: Int = ArchiveDetailViewModel.shared.archiveDetail.folderID
    
    @State private var images: [UIImage] = []
    @State private var tag: String = ""
    @State var price: Int? = ArchiveInformationViewModel.shared.price

    @State var date = Date()
    
    @StateObject private var archive = ArchiveInformationViewModel.shared
    @StateObject private var toastViewModel = ToastViewModel.shared
    
    @State var createFolder: Bool = false
    @State var folderImage: [UIImage] = []
    @State var newFolderName: String = ""
    @State var startDate = Date()
    @State var endDate = Date()

    @Binding var path: [PathModel]
    var archiveId = ArchiveDetailViewModel.shared.archiveDetail.archiveID
    var placeName = ArchiveDetailViewModel.shared.archiveDetailPlace.name
    var placeLocation = ArchiveDetailViewModel.shared.archiveDetailPlace.address
    var isLike = ArchiveDetailViewModel.shared.archiveDetailPlace.isLike
    var categoryId = ArchiveDetailViewModel.shared.archiveDetailPlace.categoryID
    var asyncImage = ArchiveDetailViewModel.shared.archiveDetailPlace.thumbnail
        
    var body: some View {
        ZStack{
            ScrollView{
                VStack(spacing: 0){
                    placeView(name: placeName, location: placeLocation, image: asyncImage ?? "DummyImage2", isHeartFilled: isLike == 0 ? false : true, categoryId: categoryId)
                        .padding(.top, 32)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("나의 점수")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 15)
                                        .weight(.semibold)
                                )
                                .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                            HStack(spacing: 8){
                                ForEach(0..<5)
                                {index in
                                    Image( index < archive.score ? "BigStarFill" : "BigStarEmpty")
                                        .frame(width: 28, height: 28)
                                        .onTapGesture {
                                            if(archive.score == index + 1) {
                                                archive.score = 0
                                            } else {
                                                archive.score = index + 1
                                            }
                                        }
                                }
                            }
                        }
                        Spacer()
                        VStack(spacing: 2){
                            HStack(spacing: 2){
                                Text("커뮤니티 공개")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 12)
                                            .weight(.semibold)
                                    )
                                    .foregroundStyle(Color(red: 0.89, green: 0.39, blue: 0.39))
                                Image(systemName: "info.circle")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundStyle(Color(red: 0.89, green: 0.39, blue: 0.39))
                                    .onTapGesture {
                                        showPublicInfo = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            showPublicInfo = false
                                        }
                                    }
                            }
                            .padding(.top, 6)
                            .overlay(
                                VStack(spacing: 0){
                                    if showPublicInfo {
                                        Text("모든 유저가 조회할 수 있어요.")
                                            .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                            .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 12)
                                            .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 6))
                                        Image(systemName: "arrowtriangle.down.fill")
                                            .resizable()
                                            .frame(width: 8, height: 4)
                                            .padding(.leading, 127)
                                            .foregroundStyle(.white)
                                    }
                                }
                                    .frame(width: 173)
                                    .shadow(color: Color(red: 0.2, green: 0.2, blue: 0.2).opacity(0.08), radius: 8, x: 0, y: 4)
                                    .padding(.trailing, 60)
                                    .padding(.top, -50)
                                    .animation(.easeInOut(duration: 0.5), value: showPublicInfo)
                            )
                            Toggle("community",isOn: $archive.isPublic)
                                .labelsHidden()
                        }
                    }
                    .padding(.horizontal, 1)
                    .frame(width: 358)
                    .padding(.top, 32)
                    folderSelectView(select: $folderName, id: $folderId, createFolder: $createFolder)
                        .padding(.top, 24)
                        .zIndex(2)
                    HStack(spacing: 0){
                        TextField("Title (10자 이내)", text: $archive.title)
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 16)
                                    .weight(.medium)
                            )
                            .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                            .onChange(of: archive.title) {
                                if archive.title.count > 10 {
                                    archive.title = String(archive.title.prefix(10))
                                }
                            }
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 16)
                    .frame(width: 358,height: 56)
                    .background(
                        Rectangle()
                            .inset(by: 1)
                            .stroke(.black.opacity(0.23), lineWidth: 1)
                    )
                    .padding(.top, 16)
                    VStack(spacing: 0){
                        TextField("comment (300자 이내)",text: $archive.comment, axis: .vertical)
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 16)
                                    .weight(.medium)
                            )
                            .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                            .onChange(of: archive.comment) {
                                if archive.comment.count > 300 {
                                    archive.comment = String(archive.comment.prefix(300))
                                }
                            }
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                        Spacer()
                        HStack {
                            Spacer()
                            Text("\(archive.comment.count)/300")
                                .font(Font.custom("Apple SD Gothic Neo", size: 14))
                                .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        }
                        .padding(.bottom, -16)
                        .padding(.trailing, -10)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 16)
                    .frame(width: 358)
                    .overlay(
                        Rectangle()
                            .inset(by: 1)
                            .stroke(.black.opacity(0.23), lineWidth: 1)
                    )
                    .padding(.top, 16)
                    VStack(alignment: .leading, spacing: 0) {
                        Text("사진 추가")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 15)
                                    .weight(.semibold)
                            )
                            .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                            .padding(.top, 22)
                        HStack(spacing: 20) {
                            ForEach(images.indices, id: \.self) { index in
                                let image = images[index]
                                ZStack {
                                    let resizedImage = resizeImage(image: image, targetSize: CGSize(width: 72, height: 72))
                                    Image(uiImage: resizedImage)
                                    Button(action: {
                                        images.remove(at: index)
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundStyle(.red)
                                    }
                                    .offset(x: 72/2, y: -72/2)
                                }
                                .frame(width: 72, height: 72)
                            }
                            if images.count < 3 {
                                SquarePhotosPicker(selectedImage: $images, squareWidth: 72, squareHeight: 72)
                            }
                        }
                        .padding(.top, 3)
                        Text("태그")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 15)
                                    .weight(.semibold)
                            )
                            .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                            .padding(.top, 16)
                        HStack(spacing: 8) {
                            ForEach(archive.hashtag.indices, id: \.self) {index in
                                HStack(spacing: 4){
                                    Text("#\(archive.hashtag[index])")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 13)
                                                .weight(.bold)
                                        )
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                        .bold()
                                        .onTapGesture {
                                            archive.hashtag.remove(at: index)
                                        }
                                    
                                }
                                .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                                )
                            }
                            if archive.hashtag.count < 3 {
                                TextField("", text: $tag)
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 16)
                                            .weight(.semibold)
                                    )
                                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .frame(width: 72, height: 40)
                                    .overlay(
                                        Rectangle()
                                            .inset(by: 0.5)
                                            .stroke(.black.opacity(0.23), lineWidth: 1)
                                    )
                                    .autocapitalization(.none)
                                    .autocorrectionDisabled()                                    .onSubmit {
                                        if(tag != "") {
                                            archive.hashtag.append(tag)
                                            tag = ""
                                        }
                                        
                                    }
                                ForEach(0..<2 - archive.hashtag.count, id: \.self) { tag in
                                    Rectangle()
                                        .inset(by: 0.5)
                                        .stroke(.black.opacity(0.23), lineWidth: 1)
                                        .frame(width: 72, height: 40)
                                }
                            }
                        }
                        .padding(.top, 8)
                        .frame(height: 40)
                        TextField("menu (30자 이내)",text: $archive.menu)
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 16)
                                    .weight(.medium)
                            )
                            .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                            .onChange(of: archive.menu) {
                                if archive.menu.count > 24 {
                                    archive.menu = String(archive.menu.prefix(24))
                                }
                            }
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                            .padding(.horizontal, 12)
                            .padding(.vertical, 16)
                            .frame(width: 358, alignment: .leading)
                            .background(
                                Rectangle()
                                    .inset(by: 1)
                                    .stroke(.black.opacity(0.23), lineWidth: 1)
                            )
                            .overlay(
                                Text("대표 메뉴:")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 15)
                                            .weight(.semibold)
                                    )
                                    .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                    .padding(.horizontal, 4)
                                    .background(.white)
                                    .padding(.top, -8)
                                    .padding(.leading, 12)
                                , alignment: .topLeading)
                            .padding(.top, 28)
                        HStack(spacing: 5) {
                            TextField("원", value: $price, format: .number.grouping(.automatic).precision(.fractionLength(0)))
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                        .weight(.medium)
                                )
                                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                .keyboardType(.numberPad)
                                .fixedSize(horizontal: true, vertical: true)
                            if(price != nil) {
                                Text("원")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 16)
                                            .weight(.medium)
                                    )
                                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 16)
                        .frame(width: 358, alignment: .leading)
                        .background(
                            Rectangle()
                                .inset(by: 1)
                                .stroke(.black.opacity(0.23), lineWidth: 1)
                        )
                        .overlay(
                            Text("사용한 금액:")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 15)
                                        .weight(.semibold)
                                )
                                .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                .padding(.horizontal, 4)
                                .background(.white)
                                .padding(.top, -8)
                                .padding(.leading, 12)
                            , alignment: .topLeading)
                        .padding(.top, 28)
                        VStack(alignment: .leading, spacing: 0) {
                            Text("방문날짜")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 12)
                                        .weight(.semibold)
                                )
                                .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                            Text(dateFormatter(date: date))
                                .font(Font.custom("Apple SD Gothic Neo", size: 16))
                                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                .overlay(
                                    DatePicker("visitDate", selection: $date, displayedComponents: [.date])
                                        .labelsHidden()
                                        .blendMode(.destinationOver)
                                )
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .frame(width: 358, height: 54, alignment: .leading)
                        .background(
                            Rectangle()
                                .inset(by: 1)
                                .stroke(.black.opacity(0.23), lineWidth: 1)
                        )
                        .padding(.top, 18)
                    }
                    .frame(width: 358, alignment: .leading)
                    Button(action: {
                        if(archive.title == "" || archive.comment == "" || archive.menu == "" || price == nil || folderName == "" ) {
                            toastViewModel.showToastWithString(text: "title, folder, comment, menu, price를 모두 입력해주세요.")
                        } else {
                            archive.price = price ?? 0
                            archive.folder = folderId
                            archive.visitedDate = dateFormatter(date: date)
                            archive.placeId = ArchiveDetailViewModel.shared.archiveDetailPlace.placeID
                            func uploadImages(_ images: [UIImage], currentIndex: Int) {
                                guard currentIndex < images.count else {
                                    ArchiveManager.shared.editArchive(archiveId: archiveId, query: archive) { result in
                                        if(result == nil) {
                                            toastViewModel.showToastWithString(text: "아카이브 게시물 수정에 실패했습니다.")
                                        } else {
                                            ArchiveDetailViewModel.shared.getArchiveDetail(archiveId: archiveId)
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                path.removeLast()
                                                archive.reset()
                                            }
                                        }
                                    }
                                    return
                                }
                                FirebaseStorageManager.uploadImage(image: images[currentIndex]) { url in
                                    if let imageUrl = url {
                                        print("Image uploaded successfully. URL: \(imageUrl)")
                                        archive.images.append("\(imageUrl)")
                                    } else {
                                        print("Failed to upload image.")
                                    }
                                    
                                    // 다음 이미지 업로드를 위해 재귀 호출
                                    uploadImages(images, currentIndex: currentIndex + 1)
                                }
                            }

                            // 첫 번째 이미지부터 업로드 시작
                            uploadImages(self.images, currentIndex: 0)
                        }
                    })
                    {
                        RoundedRectangle(cornerRadius: 7)
                            .frame(width: 300, height: 44)
                            .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                            .padding(.vertical, 32)
                            .overlay(
                                Text("작성 완료")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 16)
                                            .weight(.medium)
                                    )
                                    .foregroundStyle(.white)
                            )
                    }
                    Spacer()
                }
            }
            .scrollIndicators(.hidden)
        }
        .onAppear {
            date = stringToDate(date: archive.visitedDate)
        }
        .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
        .sheet(isPresented: $createFolder, onDismiss: {
            ArchiveFolderViewModel.shared.reset()
        }) {
            createFolderView(image: $folderImage, start: $startDate, end: $endDate, show: $createFolder, isCreate: true, id: folderId)
                .presentationDetents([.height(520)])
                .presentationDragIndicator(.visible)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    if path.count > 0 {
                        path.removeLast()
                        archive.reset()
                        print("archive리셋")
                    }
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                    }
                    .foregroundStyle(.black)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("아카이브")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                ToolBarView(path: $path)
            }
        }
    }
    
    let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
            UIGraphicsBeginImageContext(targetSize)
            image.draw(in: CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return newImage!
        }
    
    func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: date)
    }
    
    func stringToDate(date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter.date(from: date) ?? Date()
    }
}

#Preview {
    ArchiveEditView(path: .constant([]))
}
