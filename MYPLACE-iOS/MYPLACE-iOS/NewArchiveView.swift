//
//  NewArchiveView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/2/24.
//

import SwiftUI
import PhotosUI

struct NewArchiveView: View {
    @State private var showPublicInfo: Bool = false
    
    @State private var folderName: String = ""
    @State private var folderId: Int = 0
    
    @State private var images: [UIImage] = []
    @State private var tag: String = ""
    @State private var price: Int?
    @State private var date = Date()
    
    @State private var selectedOption: String?
    
    @StateObject private var place = SearchPlaceViewModel.shared
    @StateObject private var archive = ArchiveInformationViewModel.shared
    @StateObject private var toastViewModel = ToastViewModel.shared
    
    @State var createFolder: Bool = false
    @State var folderImage: [UIImage] = []
    @State var newFolderName: String = ""
    @State var startDate = Date()
    @State var endDate = Date()

    @Binding var path: [PathModel]
        
    var body: some View {
        ZStack{
            ScrollView{
                VStack(spacing: 0){
                    placeView(name: place.name, location: place.address, image: "DummyImage", isHeartFilled: place.isLike, categoryId: place.categoryId)
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
                            TextEditor(text: $archive.comment)
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
                                .scrollContentBackground(.hidden)
                                .autocapitalization(.none)
                                .autocorrectionDisabled()
                                .frame(minHeight: 36)
                                .padding(.top, -4)
                                .padding(.leading, -3)
                                .background(
                                    Text("comment (300자 이내)")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 16)
                                        )
                                        .foregroundStyle(archive.comment.count == 0 ? .gray.opacity(0.5) : .clear)
                                        .padding(.top, 4)
                                        .padding(.leading, 1)
                                    ,alignment: .topLeading)
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
                                    .autocorrectionDisabled()                                   .onSubmit {
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
                            toastViewModel.showToastWithString(text: "title, comment, menu, price를 모두 입력해주세요.")
                        } else {
                            archive.price = price ?? 0
                            archive.folder = folderId
                            archive.visitedDate = dateFormatter(date: date)
                            archive.placeId = place.placeId
                            ArchiveManager.shared.registerArchive(query: archive) { result in
                                if(result == nil) {
                                    toastViewModel.showToastWithString(text: "아카이브 게시물 등록에 실패했습니다.")
                                } else {
                                    ArchiveDetailViewModel.shared.getArchiveDetail(archiveId: result ?? 0)
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        // MARK: - 수정 필요
                                        path.removeLast()
                                        archive.reset()
                                        path.append(.archiveDetailView)
                                    }
                                }
                            }
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
            .sheet(isPresented: $createFolder, onDismiss: {
                ArchiveFolderViewModel.shared.reset()
            }) {
                createFolderView(image: $folderImage, start: $startDate, end: $endDate, show: $createFolder, isCreate: true, id: folderId)
                    .presentationDetents([.height(520)])
                    .presentationDragIndicator(.visible)
            }
        }
        .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    if path.count > 0 {
                        path.removeLast()
                        archive.reset()
                        place.reset()
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
}

struct placeView: View{
    var name: String
    var location: String
    var image: String
    var isHeartFilled: Bool
    var categoryId: Int
    
    var body: some View {
        HStack(spacing: 0){
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 77, height: 77)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .padding(.all, 6)
            VStack(alignment: .leading, spacing: 9){
                Text(PlaceType.emojiForCategory(from: categoryId) + " " + name)
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 18)
                            .weight(.semibold)
                    )
                    .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                HStack(spacing: 3) {
                    Image("map")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 14, height: 14)
                        .padding(.horizontal, 3)
                    Text(location)
                      .font(Font.custom("Apple SD Gothic Neo", size: 15))
                      .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                }
            }
            .padding(.leading, 20)
            .frame(maxWidth: 250, alignment: .leading)
            Spacer()
            VStack(spacing: 0){
                Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                    .foregroundStyle(isHeartFilled ? .red : .gray)
                    .padding(.top, 18)
                    .padding(.trailing, 9)
                Spacer()
            }
            
        }
        .frame(width: 343, height: 88)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
    }
}

struct folderSelectView: View {
    @StateObject var userViewModel = ArchiveUserViewModel.shared
    @State var show: Bool = false
    @Binding var select: String
    @Binding var id: Int
    @Binding var createFolder: Bool
    
    var body: some View {
        HStack(spacing: 0){
            Text(select == "" ? "폴더 선택" : select)
                .font(
                    Font.custom("Apple SD Gothic Neo", size: 16)
                        .weight(.medium)
                )
                .foregroundStyle(select == "" ? Color(red: 0.45, green: 0.47, blue: 0.5) : Color(red: 0.15, green: 0.16, blue: 0.17))
            Spacer()
            if select == "" {
                Image(systemName: "chevron.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                    .bold()
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 16)
        .frame(width: 358,height: 56)
        .background(
            Rectangle()
                .inset(by: 1)
                .stroke(.black.opacity(0.23), lineWidth: 1)
        )
        .onTapGesture {
            show.toggle()
        }
        .overlay(
            VStack(spacing: 0) {
                if (show) {
                    HStack(spacing: 0) {
                        Text(select == "" ? "폴더 선택" : select)
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 16)
                                    .weight(.medium)
                            )
                            .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        Spacer()
                        Image(systemName: "chevron.up")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16, height: 16)
                            .bold()
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 16)
                    .frame(width: 358,height: 56)
                    .background(.white)
                    .overlay(
                        Rectangle()
                            .inset(by: 1)
                            .stroke(.black.opacity(0.23), lineWidth: 1))
                    .onTapGesture {
                        show.toggle()
                    }
                    VStack(spacing: 0){
                        ForEach(userViewModel.folders, id: \.self) { folder in
                            Rectangle()
                                .foregroundStyle(select == folder.title ? Color(red: 0.91, green: 0.92, blue: 0.93) : .white)
                                .frame(width: 358, height: 40)
                                .overlay(
                                    HStack(spacing: 0) {
                                        Text(folder.title)
                                            .font(Font.custom("Apple SD Gothic Neo", size: 16))
                                        Spacer()
                                        Image(systemName:"checkmark")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 12, height: 12)
                                            .bold()
                                            .foregroundStyle(select == folder.title ? Color(red: 0.15, green: 0.16, blue: 0.17) : .clear)
                                    }
                                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                        .padding(.horizontal, 12))
                                .onTapGesture {
                                    select = folder.title
                                    id = folder.id
                                    show.toggle()
                                }
                        }
                        Rectangle()
                            .fill(.white)
                            .frame(width: 358, height: 40)
                            .overlay(
                                HStack(spacing: 0) {
                                    Text("새 폴더")
                                        .font(Font.custom("Apple SD Gothic Neo", size: 16))
                                    Spacer()
                                    Image(systemName:"checkmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 12, height: 12)
                                        .bold()
                                        .foregroundStyle(.clear)
                                }
                                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                    .padding(.horizontal, 12))
                            .onTapGesture {
                                select = ""
                                createFolder.toggle()
                            }
                    }
                    .padding(.top, -2)
                    .overlay(
                        Rectangle()
                            .inset(by: 1)
                            .stroke(.black.opacity(0.23), lineWidth: 1)
                            .padding(.top, -2)
                    )
                }
            }
            ,alignment: .top)
    }
}

#Preview {
    NewArchiveView(path: .constant([]))
}
