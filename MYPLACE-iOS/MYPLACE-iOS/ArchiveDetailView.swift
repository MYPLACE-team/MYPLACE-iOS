//
//  ArchiveDetailView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 1/19/24.
//

import SwiftUI
struct ArchiveDetailView: View {
    @State var archiveData = archiveDetail
    @State var isLocationView: Bool = true
    @State var isPopupPresented: Bool = false
    @State var popupMode: String = ""
    @State var isCommentPresented: Bool = false
    @State private var tags: [String] = ["한옥", "크로플", "안국역"]
    
    @StateObject private var toastViewModel = ToastViewModel.shared
    @StateObject private var archiveUserViewModel = ArchiveUserViewModel.shared
    @StateObject private var archiveDetailViewModel = ArchiveDetailViewModel.shared
    
    @Binding var path: [PathModel]
    
    var body: some View {
        ZStack{
            Color(red: 0.86, green: 0.87, blue: 0.94)
                .ignoresSafeArea(.all)
            VStack{
                RoundedRectangle(cornerRadius: 60)
                    .foregroundStyle(.white)
                    .ignoresSafeArea(.all)
                    .overlay(
                        VStack{
                            HStack(spacing: 90){
                                VStack(spacing: 8){
                                    Text("\(archiveUserViewModel.user.level)")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 15)
                                                .weight(.bold)
                                        )
                                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                    Text("레벨")
                                        .font(Font.custom("Apple SD Gothic Neo", size: 13))
                                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                }.frame(width: 120, height: 50)
                                VStack(spacing: 8){
                                    Text("\(archiveUserViewModel.user.archiveCount)")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 15)
                                                .weight(.bold)
                                        )
                                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                    Text("아카이브")
                                        .font(Font.custom("Apple SD Gothic Neo", size: 13))
                                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                }.frame(width: 120, height: 50)
                            }
                            .padding(.top, 15)
                            Text(archiveUserViewModel.user.username)
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                        .weight(.bold)
                                )
                                .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                .padding(.top, 10)
                            Text("종로구에 살고 있으며, 커피를 좋아해 \n카페 탐방이 취미입니다.")
                                .font(Font.custom("Apple SD Gothic Neo", size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                .padding(.top, 10)
                            HStack{
                                if isLocationView {
                                    Button(action: {
                                    })
                                    {
                                        VStack(spacing: 4){
                                            Text("location")
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 13)
                                                        .weight(.semibold)
                                                )
                                                .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                                .frame(height: 18)
                                            RoundedRectangle(cornerRadius: 2)
                                                .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                                .frame(width: 30, height: 3)
                                        }
                                        .frame(width: 70)
                                        .padding(.trailing, 30)
                                    }
                                    Button(action: {
                                        isLocationView = false
                                    })
                                    {
                                        VStack(spacing: 4){
                                            Text("My Archive")
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 13)
                                                        .weight(.semibold)
                                                )
                                                .foregroundStyle(Color(red: 0.39, green: 0.45, blue: 0.55))
                                                .frame(height: 18)
                                            RoundedRectangle(cornerRadius: 2)
                                                .foregroundStyle(.clear)
                                                .frame(width: 30, height: 3)
                                        }
                                        .frame(width: 70)
                                    }
                                }
                                else {
                                    Button(action: {
                                        isLocationView = true
                                    })
                                    {
                                        VStack(spacing: 4){
                                            Text("location")
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 13)
                                                        .weight(.semibold)
                                                )
                                                .foregroundStyle(Color(red: 0.39, green: 0.45, blue: 0.55))
                                                .frame(height: 18)
                                            RoundedRectangle(cornerRadius: 2)
                                                .foregroundStyle(.clear)
                                                .frame(width: 30, height: 3)
                                        }
                                        .frame(width: 70)
                                        .padding(.trailing, 30)
                                    }
                                    Button(action: {
                                    })
                                    {
                                        VStack(spacing: 4){
                                            Text("My Archive")
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 13)
                                                        .weight(.semibold)
                                                )
                                                .multilineTextAlignment(.center)
                                                .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                                .frame(height: 18)
                                            RoundedRectangle(cornerRadius: 2)
                                                .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                                .frame(width: 30, height: 3)
                                        }
                                        .frame(width: 70)
                                    }
                                }
                            }
                            .padding(.top, 10)
                            ScrollViewReader { proxy in
                                ScrollView {
                                    if isLocationView {
                                        VStack {
                                            HStack{
                                                Image("DummyImage")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 76, height: 76)
                                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                                                    .padding(.leading, 7)
                                                VStack(alignment:.leading){
                                                    HStack(spacing: 6){
                                                        Text(PlaceType.emojiForCategory(from: archiveDetailViewModel.archiveDetailPlace.categoryID) + " " + archiveDetailViewModel.archiveDetailPlace.name)
                                                            .font(
                                                                Font.custom("Apple SD Gothic Neo", size: 20)
                                                                    .weight(.bold)
                                                            )
                                                            .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                                    }
                                                    .padding(.bottom, 2)
                                                    HStack(spacing: 6){
                                                        Image("map")
                                                            .resizable()
                                                            .frame(width:14, height:18)
                                                            .padding(.horizontal,4)
                                                        Text(archiveDetailViewModel.archiveDetailPlace.address)
                                                            .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                                            .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                                    }
                                                }
                                                .padding(.leading, 6)
                                                Spacer()
                                            }
                                            .frame(width: 343, height: 88)
                                            .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                                            .padding(.top, 12)
                                            Image("DummyImage")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 356, height: 356)
                                                .padding(.vertical, 40)
                                        }
                                        .id("scroll_top")
                                    }
                                    else {
                                        VStack(spacing: 0){
                                            VStack(spacing: 0){
                                                Text(archiveDetailViewModel.archiveDetail.title)
                                                    .font(
                                                        Font.custom("Apple SD Gothic Neo", size: 22)
                                                            .weight(.semibold)
                                                    )
                                                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                                    .padding(.top, 20)
                                                    .padding(.bottom, 8)
                                                Text(dateFormatter(date: stringToDate(date: archiveDetailViewModel.archiveDetail.visitedDate)))
                                                    .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                                    .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                                Divider()
                                                    .background(
                                                        GeometryReader { geometry in
                                                            Path { path in
                                                                path.addLines([
                                                                    .init(x: 0, y: 0),
                                                                    .init(x: geometry.size.width, y: 0)
                                                                ])
                                                            }
                                                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                                            .foregroundStyle(Color(red: 0.76, green: 0.76, blue: 0.77))
                                                        }
                                                    )
                                                    .padding(.top, 18)
                                                    .frame(width: 310)
                                                HStack {
                                                    Image(systemName: "arrowtriangle.forward.fill")
                                                        .resizable()
                                                        .frame(width: 14, height: 18)
                                                        .foregroundStyle(.white)
                                                    Spacer()
                                                    Image(systemName: "arrowtriangle.backward.fill")
                                                        .resizable()
                                                        .frame(width: 14, height: 18)
                                                        .foregroundStyle(.white)
                                                }
                                                .padding(.top, 4)
                                                .padding(.horizontal, -2)
                                                HStack {
                                                    Text("30번째 장소")
                                                        .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                                        .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                                }
                                                .padding(.horizontal, 22)
                                                .padding(.vertical, 9)
                                                .background(Color(red: 0.68, green: 0.65, blue: 1).opacity(0.15))
                                                .cornerRadius(100)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 100)
                                                        .inset(by: 0.5)
                                                        .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                                                )
                                                ZStack {
                                                    VStack {
                                                        HStack(spacing: 6) {
                                                            Image("searchIcon")
                                                                .resizable()
                                                                .frame(width: 18, height: 18)
                                                            Text("Info")
                                                                .font(
                                                                    Font.custom("Apple SD Gothic Neo", size: 18)
                                                                        .weight(.bold)
                                                                )
                                                                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                                            Spacer()
                                                        }
                                                        .padding(.top, 18)
                                                        .padding(.leading, 22)
                                                        VStack{
                                                            HStack{
                                                                Text("💸 사용금액")
                                                                    .font(Font.custom("Apple SD Gothic Neo", size: 16).weight(.semibold))
                                                                    .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                                                    .padding(.leading, 10)
                                                                Spacer()
                                                                Text("\(priceFormatter(price:archiveDetailViewModel.archiveDetail.price))원")
                                                                    .font(
                                                                        Font.custom("Apple SD Gothic Neo", size: 14)
                                                                            .weight(.medium)
                                                                    )
                                                                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                                                    .frame(width: 100, alignment: .leading)
                                                            }
                                                            Divider()
                                                                .background(
                                                                    GeometryReader { geometry in
                                                                        Path { path in
                                                                            path.addLines([
                                                                                .init(x: 0, y: 0),
                                                                                .init(x: 219, y: 0)
                                                                            ])
                                                                        }
                                                                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                                                        .foregroundStyle(Color(red: 0.76, green: 0.76, blue: 0.77))
                                                                    }
                                                                )
                                                            HStack(alignment: .top){
                                                                Text("🍭 대표메뉴")
                                                                    .font(Font.custom("Apple SD Gothic Neo", size: 16).weight(.semibold))
                                                                    .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                                                    .padding(.leading, 10)
                                                                Spacer()
                                                                Text(archiveDetailViewModel.archiveDetail.menu)
                                                                    .font(
                                                                        Font.custom("Apple SD Gothic Neo", size: 14)
                                                                            .weight(.medium)
                                                                    )
                                                                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                                                    .frame(width: 100, alignment: .leading)
                                                            }
                                                            Divider()
                                                                .background(
                                                                    GeometryReader { geometry in
                                                                        Path { path in
                                                                            path.addLines([
                                                                                .init(x: 0, y: 0),
                                                                                .init(x: 219, y: 0)
                                                                            ])
                                                                        }
                                                                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                                                        .foregroundStyle(Color(red: 0.76, green: 0.76, blue: 0.77))
                                                                    }
                                                                )
                                                            HStack {
                                                                Text("🌟 별점")
                                                                    .font(Font.custom("Apple SD Gothic Neo", size: 16).weight(.semibold))
                                                                    .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                                                    .padding(.leading, 10)
                                                                Spacer()
                                                                HStack(spacing: 2) {
                                                                    ForEach(0..<archiveDetailViewModel.archiveDetail.score, id: \.self)
                                                                    {star in
                                                                        Image("StarFill")
                                                                            .resizable()
                                                                            .frame(width: 12, height: 12)
                                                                    }
                                                                    ForEach(0..<5 - archiveDetailViewModel.archiveDetail.score, id: \.self) {star in
                                                                        Image("StarEmpty")
                                                                            .resizable()
                                                                            .frame(width: 12, height: 12)
                                                                    }
                                                                }
                                                                .frame(width: 100, alignment: .leading)
                                                            }
                                                            Divider()
                                                                .background(
                                                                    GeometryReader { geometry in
                                                                        Path { path in
                                                                            path.addLines([
                                                                                .init(x: 0, y: 0),
                                                                                .init(x: 219, y: 0)
                                                                            ])
                                                                        }
                                                                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                                                        .foregroundStyle(Color(red: 0.76, green: 0.76, blue: 0.77))
                                                                    }
                                                                )
                                                        }
                                                        .frame(width: 219, alignment: .top)
                                                        .padding(.top, 24)
                                                        TagCloudView(tags: archiveDetailViewModel.archiveDetail.hashtag)
                                                            .frame(width: 240)
                                                            .padding(.vertical, 12)
                                                    }
                                                }
                                                .frame(width: 272)
                                                .background(.white)
                                                .cornerRadius(10)
                                                .padding(.top, 13)
                                                VStack(spacing: 0) {
                                                    HStack(spacing: 6){
                                                        Image("loveLetter")
                                                            .resizable()
                                                            .frame(width: 18, height: 18)
                                                        Text("comment")
                                                            .font(
                                                                Font.custom("Apple SD Gothic Neo", size: 18)
                                                                    .weight(.bold)
                                                            )
                                                            .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                                    }
                                                    .frame(width: 228, alignment: .leading)
                                                    Text(archiveDetailViewModel.archiveDetail.comment.prefix(60))
                                                        .font(
                                                            Font.custom("Apple SD Gothic Neo", size: 13)
                                                                .weight(.medium)
                                                        )
                                                        .baselineOffset(4)
                                                        .lineLimit(3)
                                                        .multilineTextAlignment(.leading)
                                                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                                        .frame(width: 228)
                                                        .padding(.top, 8)
                                                    if(archiveDetailViewModel.archiveDetail.comment.count > 60) {
                                                        HStack {
                                                            Spacer()
                                                            Button(action: {
                                                                isCommentPresented.toggle()
                                                            })
                                                            {
                                                                Image(systemName: "ellipsis")
                                                                    .resizable()
                                                                    .frame(width: 16, height: 3)
                                                                    .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                                                    .frame(width: 16, height: 16)
                                                            }
                                                        }
                                                        .frame(width: 228, alignment: .top)
                                                        .padding(.trailing, -16)
                                                    }
                                                }
                                                .padding(.horizontal, 22)
                                                .padding(.vertical, 16)
                                                .background(.white)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .padding(.top, 19)
                                                HStack(spacing: 16) {
                                                    Spacer()
                                                    Button(action: {
                                                        popupMode = "store"
                                                        isPopupPresented.toggle()
                                                    })
                                                    {
                                                        Image(systemName: "square.and.arrow.down")
                                                            .bold()
                                                    }
                                                    Button(action: {
                                                        popupMode = "share"
                                                        isPopupPresented.toggle()
                                                    })
                                                    {
                                                        Image(systemName: "arrowshape.turn.up.right")
                                                            .padding(.trailing, 12)
                                                            .bold()
                                                    }
                                                }
                                                .frame(width: 272)
                                                .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                                .padding(.top, 12)
                                                .padding(.bottom, 16)
                                            }
                                            .frame(width: 330)
                                            .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                            .padding(.top, 12)
                                            HStack(spacing: 10){
                                                Button(action: {
                                                    let archive = ArchiveInformationViewModel.shared
                                                    archive.placeId = archiveDetailViewModel.archiveDetailPlace.placeID
                                                    archive.score = archiveDetailViewModel.archiveDetail.score
                                                    archive.isPublic = archiveDetailViewModel.archiveDetail.isPublic
                                                    archive.folder = archiveDetailViewModel.archiveDetail.folderID
                                                    archive.title = archiveDetailViewModel.archiveDetail.title
                                                    archive.comment = archiveDetailViewModel.archiveDetail.comment
                                                    archive.images = []
                                                    archive.hashtag = archiveDetailViewModel.archiveDetail.hashtag
                                                    archive.menu = archiveDetailViewModel.archiveDetail.menu
                                                    archive.price = archiveDetailViewModel.archiveDetail.price
                                                    archive.visitedDate = archiveDetailViewModel.archiveDetail.visitedDate
                                                    path.append(.archiveEditView)
                                                })
                                                {
                                                    RoundedRectangle(cornerRadius: 7)
                                                        .frame(width: 148, height: 44)
                                                        .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                                        .overlay(
                                                            Text("수정하기")
                                                                .font(
                                                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                                                        .weight(.medium)
                                                                )
                                                                .foregroundStyle(.white)
                                                        )
                                                }
                                                Button(action: {
                                                    popupMode = "delete"
                                                    isPopupPresented.toggle()
                                                })
                                                {
                                                    RoundedRectangle(cornerRadius: 7)
                                                        .frame(width: 148, height: 44)
                                                        .foregroundStyle(.white)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 7)
                                                                .inset(by: 1)
                                                                .stroke(Color(red: 0.32, green: 0.29, blue: 0.77), lineWidth: 2)
                                                                .overlay(
                                                                    Text("삭제하기")
                                                                        .font(
                                                                            Font.custom("Apple SD Gothic Neo", size: 16)
                                                                                .weight(.medium)
                                                                        )
                                                                        .foregroundStyle(Color(red: 0.32, green: 0.29, blue: 0.77))
                                                                )
                                                        )
                                                }
                                            }
                                            .padding(.top, 18)
                                        }
                                        .id("scroll_top")
                                    }
                                }
                                .onChange(of: isLocationView) {
                                    withAnimation {
                                        proxy.scrollTo("scroll_top",anchor: .top)
                                    }
                                }
                                .padding(.top, 12)
                            }
                        }
                    )
            }
            .padding(.top, 53)
            VStack{
                Circle()
                    .frame(width: 106, height: 106)
                    .foregroundStyle(.white)
                    .overlay(
                        Image("profile")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .clipShape(Circle())
                    )
                Spacer()
            }
            if isPopupPresented {
                ArchivePopupView(isPopupPresented: $isPopupPresented, mode: $popupMode, path: $path)
            }
            if isCommentPresented {
                CommentView(isPresented: $isCommentPresented, comment: archiveDetailViewModel.archiveDetail.comment)
            }
        }
        .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BasicBackButton(path: $path)
            }
            ToolbarItem(placement: .topBarTrailing) {
                ToolBarView(path: $path)
            }
        }
    }
    
    func priceFormatter(price: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: price as NSNumber) ?? "10"
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

struct ArchivePopupView: View {
    @State var modeColor: Color = Color(red: 1, green: 0.85, blue: 0.07)
    @State var modeTitle: String = "게시물을 정말 삭제할까요?"
    @State var modeContent: String = "삭제된 게시물은 복구할 수 없어요."
    @State var modeButton: String = "삭제하기"
    @State var modeImage: String = "exclamationmark"
    @State var modeButtonTop: CGFloat = 0
    
    @Binding var isPopupPresented: Bool
    @Binding var mode: String
    @Binding var path: [PathModel]
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
            VStack(spacing: 0){
                Circle()
                    .frame(width: 96, height: 96)
                    .foregroundStyle(modeColor.opacity(0.2))
                    .overlay(
                        Image(systemName: modeImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 46, height: 46)
                            .bold()
                            .foregroundStyle(modeColor)
                            .padding(.top, modeButtonTop)
                    )
                Text(modeTitle)
                  .font(
                    Font.custom("Apple SD Gothic Neo", size: 20)
                      .weight(.bold)
                  )
                  .foregroundStyle(.black)
                  .padding(.top, 30)
                
                Text(modeContent)
                  .font(Font.custom("Apple SD Gothic Neo", size: 15))
                  .foregroundStyle(.black)
                  .padding(.top, 18)
                HStack(spacing: 10) {
                    Button(action: {
                        if mode == "delete" {
                            ArchiveManager.shared.deleteArchive(archiveId: ArchiveDetailViewModel.shared.archiveDetail.archiveID) { error in
                                if let error = error {
                                    print(String(describing: error))
                                } else {
                                    ToastViewModel.shared.showToastWithString(text: "아카이브 게시물을 삭제했어요.")
                                    ArchiveListViewModel.shared.getArchiveList()
                                    isPopupPresented.toggle()
                                    path.removeLast()
                                }
                            }
                        } else if mode == "share" {
                            ToastViewModel.shared.showToastWithString(text: "URL이 복사되었어요.")
                            isPopupPresented.toggle()
                        } else if mode == "store" {
                            ToastViewModel.shared.showToastWithString(text: "사진 앱에 사진이 저장되었어요.")
                            isPopupPresented.toggle()
                        }
                    })
                    {
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: 100, height: 44)
                            .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                            .overlay(
                                Text(modeButton)
                                    .font(Font.custom("Apple SD Gothic Neo", size: 16))
                                    .foregroundStyle(.white)
                            )
                    }
                    Button(action: {
                        isPopupPresented.toggle()
                    })
                    {
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: 100, height: 44)
                            .foregroundStyle(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .inset(by: 1)
                                    .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 2)
                                    .overlay(
                                        Text("돌아가기")
                                            .font(Font.custom("Apple SD Gothic Neo", size: 16))
                                            .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                    )
                            )
                    }
                }
                .padding(.top, 24)
            }
            .frame(width: 282)
            .padding(.vertical, 30)
            .padding(.horizontal, 24)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .onAppear {
            if mode == "share" {
                modeColor = Color(red: 0, green: 0.48, blue: 1)
                modeTitle = "게시물을 공유할까요?"
                modeContent = "URL을 전달해 친구들과 공유해 보세요."
                modeButton = "복사하기"
                modeImage = "paperplane"
                modeButtonTop = 5
            } else if mode == "store" {
                modeColor = Color(red: 0.15, green: 0.68, blue: 0.38)
                modeTitle = "아카이브 사진을 저장할까요?"
                modeContent = "‘사진'에서 해당 사진을 확인할 수 있어요."
                modeButton = "저장하기"
                modeImage = "square.and.arrow.down"
                modeButtonTop = -5
            } else if mode == "delete" {
                
            } else {
                isPopupPresented.toggle()
            }
        }
    }
}

struct CommentView : View {
    @Binding var isPresented: Bool
    var comment: String
    
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
            VStack(spacing: 6){
                HStack(spacing: 6){
                    Image("loveLetter")
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text("comment")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 18)
                                .weight(.bold)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    Spacer()
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Circle()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(Color(red: 0.89, green: 0.39, blue: 0.39))
                            .overlay(
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 9, height: 9)
                                    .foregroundStyle(.white)
                            )
                    }
                    
                }
                .frame(width: 236)
                Text(comment)
                  .font(
                    Font.custom("Apple SD Gothic Neo", size: 14)
                      .weight(.medium)
                  )
                  .baselineOffset(4)
                  .multilineTextAlignment(.leading)
                  .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                  .frame(width: 236, alignment: .leading)
            }
            .padding(.all, 18)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct TagCloudView: View {
    var tags: [String]
    
    @State private var totalHeight = CGFloat.zero

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                self.item(for: tag)
                    .padding(.horizontal, 5)
                    .padding(.bottom, 7)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String) -> some View {
        Text("# \(text)")
            .font(Font.custom("Apple SD Gothic Neo", size: 12))
            .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
            .padding(.horizontal, 15)
            .padding(.vertical, 6)
            .background(Color(red: 0.97, green: 0.95, blue: 1))
            .cornerRadius(19)
            .overlay(
                RoundedRectangle(cornerRadius: 19)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
            )
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

#Preview {
    ArchiveDetailView(path: .constant([]))
}

