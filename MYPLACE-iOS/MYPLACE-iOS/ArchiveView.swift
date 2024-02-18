//
//  ArchiveView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/28/23.
//

import SwiftUI
import PhotosUI

struct ArchiveView: View {
    @State var searchItem: String = ""
    @State var searchItemList: [String] = []
    @State var isTotalView: Bool = true
    
    @State var isPopupPresented: Bool = false
    
    @State var createFolder: Bool = false
    @State var folderImage: [UIImage] = []
    @State var folderName: String = ""
    @State var startDate = Date()
    @State var endDate = Date()
    @State var isCreate: Bool = false
    
    @StateObject var archiveUserViewModel = ArchiveUserViewModel.shared
    @StateObject var archiveListViewModel = ArchiveListViewModel.shared
    
    @Binding var path: [PathModel]
    
    var body: some View {
        ZStack {
            Color("MPLightPurple")
                .ignoresSafeArea(.all)
                .padding(.top, 50)
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.gray)
                        .overlay(
                            Image("profile")
                        )
                        .padding(.top, 20)
                    HStack {
                        Text(archiveUserViewModel.user.username)
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 25)
                                    .weight(.semibold)
                            )
                            .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 30, height: 14)
                            .foregroundStyle(Color(red: 0.68, green: 0.65, blue: 1))
                            .overlay(
                                Text("Lv.\(archiveUserViewModel.user.level)")
                                    .font(Font.custom("Apple SD Gothic Neo", size: 9))
                                    .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                    .bold()
                                    .padding([.top, .leading], 1)
                            )
                    }
                    .frame(height: 25)
                    .padding(.top, 12)
                    HStack(spacing: 0) {
                        Text("이번 달 ")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 23)
                                    .weight(.medium)
                            )
                            .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                        Text("\(archiveUserViewModel.user.monthPlaceCount)곳 달성 ")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 23)
                                    .weight(.medium)
                            )
                            .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                            .background(
                                VStack{
                                    Spacer()
                                    Rectangle()
                                        .frame(height: 10)
                                        .foregroundStyle(Color(red: 0.76, green: 0.74, blue: 1).opacity(0.6))
                                }
                            )
                    }
                    .padding(.top, 8)
                    Button(action: {
                        if isTotalView {
                            path.append(.newArchiveView)
                        }
                        else {
                            isCreate = true
                            folderImage.removeAll()
                            folderName = ""
                            startDate = Date()
                            endDate = Date()
                            createFolder.toggle()
                        }
                    }){
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 96, height: 28, alignment: .center)
                            .foregroundStyle(Color(red: 0.35, green: 0.5, blue: 0.79))
                            .overlay(
                                HStack(spacing: 6) {
                                    if isTotalView {
                                        Text("새 아카이브")
                                            .font(Font.custom("Apple SD Gothic Neo", size: 12)
                                                .weight(.medium))
                                            .foregroundStyle(Color(red: 0.97, green: 0.97, blue: 0.98))
                                            .padding(.top, 1)
                                    }
                                    else {
                                        Text("새 폴더")
                                            .font(Font.custom("Apple SD Gothic Neo", size: 12)
                                                .weight(.medium))
                                            .foregroundStyle(Color(red: 0.97, green: 0.97, blue: 0.98))
                                            .padding(.top, 1)
                                    }
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .frame(width: 4, height: 8)
                                        .bold()
                                        .foregroundStyle(.white)
                                }
                            )
                    }
                    .padding(.top, 26)
                    HStack(spacing: 16){
                        Button(action: {
                            isTotalView = true
                        })
                        {
                            if isTotalView {
                                VStack(spacing: 6){
                                    HStack(spacing: 4){
                                        Text("전체 보기")
                                            .font(
                                                Font.custom("Apple SD Gothic Neo", size: 16)
                                                    .weight(.bold)
                                            )
                                        Text("\(archiveUserViewModel.user.archiveCount)")
                                            .font(
                                            Font.custom("Apple SD Gothic Neo", size: 12)
                                            .weight(.medium)
                                            )
                                            .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 2)
                                            .background(Color(red: 0.95, green: 0.96, blue: 0.97))
                                            .cornerRadius(10)
                                    }
                                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, topTrailing: 10))
                                        .frame(width: 151, height: 4)
                                }
                                .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                            }
                            else {
                                VStack(spacing: 6){
                                    Text("전체 보기")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 16)
                                                .weight(.semibold)
                                        )
                                        .foregroundStyle(Color(red: 0.79, green: 0.8, blue: 0.82))
                                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, topTrailing: 10))
                                        .frame(width: 151, height: 4)
                                        .foregroundStyle(.clear)
                                }
                            }
                        }
                        Button(action: {
                            isTotalView = false
                        })
                        {
                            if isTotalView {
                                VStack(spacing: 6){
                                    Text("폴더 보기")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 16)
                                                .weight(.semibold)
                                        )
                                        .foregroundStyle(Color(red: 0.79, green: 0.8, blue: 0.82))
                                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, topTrailing: 10))
                                        .frame(width: 151, height: 4)
                                        .foregroundStyle(.clear)
                                }
                            } else {
                                VStack(spacing: 6){
                                    Text("폴더 보기")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 16)
                                                .weight(.bold)
                                        )
                                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, topTrailing: 10))
                                        .frame(width: 151, height: 4)
                                }
                                .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                            }
                        }
                    }
                    .padding(.top, 18)
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 20, bottomTrailingRadius: 20, topTrailingRadius: 0))
                if isTotalView {
                    HStack(spacing: 8){
                        if searchItemList.count > 0 {
                            ForEach(searchItemList.indices, id: \.self) { index in
                                HStack(spacing: 3){
                                    Text("#"+searchItemList[index])
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 12)
                                        )
                                        .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                        .padding(.top, 2)
                                    Button(action: {
                                        searchItemList.remove(at: index)
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
                        }
                        if searchItemList.count < 2 {
                            TextField("태그 검색하기", text: $searchItem)
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 14)
                                        .weight(.medium)
                                )
                                .foregroundStyle(Color(red: 0.12, green: 0.12, blue: 0.12).opacity(0.4))
                            
                                .submitLabel(.done)
                                .onSubmit {
                                    if(searchItem != "") {
                                        searchItemList.append(searchItem)
                                        searchItem = ""
                                    }
                                }
                                .autocapitalization(.none)
                        }
                        Spacer()
                        Button(action: {
                            if(searchItemList.count == 0) {
                                archiveListViewModel.getArchiveList()
                            } else {
                                archiveListViewModel.getArchiveListWithTag(tag: searchItemList)
                            }
                        })
                        {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundStyle(.gray)
                        }
                    }
                    .frame(width: 344, height: 32)
                    .padding(.horizontal, 13)
                    .background(Color(red: 0.98, green: 0.99, blue: 1))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .padding(.top, 15)
                    .padding(.bottom, 24)
                    ScrollView {
                        LazyVStack(spacing: 14){
                            ForEach(archiveListViewModel.archivePlaceList){ place in
                                Button(action: {
                                    ArchiveDetailViewModel.shared.getArchiveDetail(archiveId: place.id)
                                    path.append(.archiveDetailView)
                                })
                                {
                                    ArchivePlaceView(image: place.thumbnailUrl ?? "DummyImage", category: place.categoryId, title: place.name, address: place.address, score: place.score, tags: place.hashtag)
                                }
                            }
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    Spacer()
                }
                else
                {
                    HStack(spacing: 6){
                        Spacer()
                        Text("총")
                            .font(Font.custom("Apple SD Gothic Neo", size: 14))
                        Text("\(archiveUserViewModel.folders.count)")
                            .font(Font.custom("Apple SD Gothic Neo", size: 18).weight(.semibold))
                        Text("건")
                            .font(Font.custom("Apple SD Gothic Neo", size: 14))
                            .padding(.trailing, 36)
                    }
                    .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                    .padding(.vertical, 18)
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing:18) {
                            ForEach(archiveUserViewModel.folders, id:\.self) { folder in
                                Image("DummyImage")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 130, height: 110)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                                    .overlay(
                                        Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.6)
                                            .overlay(
                                                VStack(alignment: .leading, spacing: 0){
                                                    HStack{
                                                        Spacer()
                                                        Button(action: {
                                                            isPopupPresented.toggle()
                                                        })
                                                        {
                                                            Circle()
                                                                .frame(width: 17, height: 17)
                                                                .foregroundStyle(Color(red: 0.89, green: 0.39, blue: 0.39))
                                                                .overlay(
                                                                    Image(systemName: "xmark")
                                                                        .resizable()
                                                                        .frame(width: 7, height: 7)
                                                                        .foregroundStyle(.white)
                                                                )
                                                        }
                                                    }
                                                    .padding(.top, 7)
                                                    .padding(.trailing, 8)
                                                    HStack(alignment: .bottom,spacing: 2){
                                                        Text("\(folder.title)")
                                                            .font(
                                                                Font.custom("Apple SD Gothic Neo", size: 15)
                                                                    .weight(.bold)
                                                            )
                                                            .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                                            
                                                        Button(action: {
                                                            folderName = "\(folder.title)"
                                                            isCreate = false
                                                            createFolder.toggle()
                                                        })
                                                        {
                                                            Image("edit")
                                                                .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                                                .padding(.bottom, 4)
                                                        }
                                                    }
                                                    .padding(.leading, 6)
                                                    .padding(.top, 46)
                                                    Text("4?")
                                                        .font(
                                                            Font.custom("Apple SD Gothic Neo", size: 10)
                                                                .weight(.semibold)
                                                        )
                                                        .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                                        .padding(.leading, 6)
                                                }
                                                , alignment: .top)
                                    )
                            }
                        }
                    }
                    .frame(width: 290)
                    Spacer()
                }
            }
            if createFolder {
                createFolderView(image: $folderImage, name: $folderName, start: $startDate, end: $endDate, show: $createFolder, isCreate: isCreate)
            }
            if isPopupPresented {
                FolderPopupView(isPopupPresented: $isPopupPresented)
            }
        }
        .onAppear {
             archiveUserViewModel.getArchiveUserInfo()
             archiveListViewModel.getArchiveList()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BasicBackButton(path: $path)
            }
            ToolbarItem(placement: .principal) {
                HStack {
                    Image("ArchiveBook")
                    Text("아카이브")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 20)
                            .weight(.heavy)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                ToolBarView(path: $path)
            }
        }
    }
    
    func dateFormatter(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let newDate = dateFormatter.date(from: date)
        return dateFormatter.string(from: newDate!)
    }
}

struct ArchivePlaceView: View {
    let image: String
    let category: Int
    let title, address: String
    let score: Int
    let tags: [String]
    
    var body: some View {
        
        HStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 76, height: 76)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .padding(.leading, 7)
            VStack(alignment:.leading){
                HStack(spacing: 6){
                    Image(category == 1 ? "CafeIcon" : "CafeIcon")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text(title.prefix(6))
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
                    Text(getSubAddress(address:address))
                        .font(Font.custom("Apple SD Gothic Neo", size: 15))
                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                }
            }
            .padding(.leading, 6)
            Spacer()
            VStack(alignment: .trailing){
                HStack(spacing: 2){
                    ForEach(0..<score, id: \.self)
                    {star in
                        Image("StarFill")
                    }
                    ForEach(0..<5 - score, id: \.self) {star in
                        Image("StarEmpty")
                    }
                }
                .padding(.bottom, 6)
                HStack(spacing: 3){
                    ForEach(tags.indices) {idx in
                        Text("#"+tags[idx])
                            .font(Font.custom("Apple SD Gothic Neo", size: 12))
                            .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                            .frame(height: 22)
                            .padding(.horizontal, 8)
                            .padding(.top, 2)
                            .background(Color(red: 0.97, green: 0.95, blue: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                            )
                    }
                }
                .frame(height: 22)
            }
            .padding(.trailing, 8)
        }
        .frame(width: 343, height: 88)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    func getSubAddress(address: String) -> String {
           let components = address.components(separatedBy: " ")
           
           if components.count >= 3 {
               let substring = components[0] + " " + components[1]
               return substring
           } else {
               return address
           }
       }
    
}

struct FolderPopupView: View {
    @Binding var isPopupPresented: Bool

    var body: some View {
        ZStack {
            Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
            VStack(spacing: 0){
                Circle()
                    .frame(width: 96, height: 96)
                    .foregroundStyle(Color(red: 1, green: 0.85, blue: 0.07).opacity(0.2))
                    .overlay(
                        Image(systemName: "exclamationmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 46, height: 46)
                            .bold()
                            .foregroundStyle(Color(red: 1, green: 0.85, blue: 0.07))
                    )
                Text("폴더를 정말 삭제할까요?")
                  .font(
                    Font.custom("Apple SD Gothic Neo", size: 20)
                      .weight(.bold)
                  )
                  .foregroundStyle(.black)
                  .padding(.top, 30)
                
                Text("삭제한 폴더는 복구할 수 없어요.")
                  .font(Font.custom("Apple SD Gothic Neo", size: 15))
                  .foregroundStyle(.black)
                  .padding(.top, 18)
                HStack(spacing: 10) {
                    Button(action: {
                    
                    })
                    {
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: 100, height: 44)
                            .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                            .overlay(
                                Text("삭제하기")
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
    }
}

struct createFolderView: View {
    @Binding var image: [UIImage]
    @Binding var name: String
    @Binding var start: Date
    @Binding var end: Date
    @Binding var show: Bool
    var isCreate: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    show.toggle()
                }
            VStack{
                Spacer()
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 40, topTrailing: 40))
                    .foregroundStyle(.white)
                    .frame(width: 394, height: 547)
                    .overlay(
                        VStack(spacing: 0){
                            if isCreate {
                                Text("새 폴더를 추가해 주세요!")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 30)
                                            .weight(.bold)
                                    )
                                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                    .background(
                                        Rectangle()
                                            .foregroundStyle(Color(red: 0.76, green: 0.74, blue: 1).opacity(0.6))
                                            .frame(height: 15), alignment: .bottom)
                                    .frame(width: 324, alignment: .leading)
                            } else {
                                Text("폴더를 수정해 주세요!")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 30)
                                            .weight(.bold)
                                    )
                                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                    .background(
                                        Rectangle()
                                            .foregroundStyle(Color(red: 0.76, green: 0.74, blue: 1).opacity(0.6))
                                            .frame(height: 15), alignment: .bottom)
                                    .frame(width: 324, alignment: .leading)
                            }
                            if(image.count > 0) {
                                Image(uiImage: image.first ?? UIImage())
                                    .resizable()
                                    .frame(width: 118, height: 118)
                                    .overlay(
                                        Button(action: {
                                            image = []
                                        }) {
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundStyle(.red)
                                        }
                                            .offset(x: 118/2, y: -118/2)
                                        
                                    )
                                    .padding(.top, 24)
                            } else {
                                SquarePhotosPicker(selectedImage: $image, squareWidth: 118, squareHeight: 118)
                                    .padding(.top, 24)
                            }
                            Text("*해당 사진은 폴더의 썸네일로 등록돼요.")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 14)
                                        .weight(.medium)
                                )
                                .foregroundStyle(Color(red: 0.62, green: 0.64, blue: 0.67))
                                .padding(.top, 3)
                            HStack(spacing: 0){
                                Text("폴더명")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 25)
                                            .weight(.semibold)
                                    )
                                    .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                Text("*")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 25)
                                            .weight(.semibold)
                                    )
                                    .foregroundStyle(Color(red: 0.89, green: 0.39, blue: 0.39))
                            }
                            .padding(.top, 14)
                            .frame(width: 324, alignment: .leading)
                            HStack(spacing: 0) {
                                TextField("폴더명을 입력해주세요.", text: $name)
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 16)
                                            .weight(.medium)
                                    )
                                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                    .onChange(of: name) {
                                        if name.count > 8 {
                                            name = String(name.prefix(8))
                                        }
                                    }
                                Spacer()
                                Text("\(name.count)/8")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 14)
                                            .weight(.medium)
                                    )
                                    .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                            }
                            .padding(.vertical, 5)
                            .padding(.horizontal, 12)
                            .frame(width: 324, height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 0.62, green: 0.64, blue: 0.67), lineWidth: 1)
                            )
                            .padding(.top, 4)
                            Text("방문 날짜")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 25)
                                        .weight(.semibold)
                                )
                                .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                .padding(.top, 27)
                                .frame(width: 324, alignment: .leading)
                            HStack(spacing: 20) {
                                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 5, topTrailing: 5))
                                    .frame(width: 135, height: 50)
                                    .foregroundStyle(Color(red: 0.91, green: 0.92, blue: 0.93))
                                    .overlay(
                                        VStack(alignment: .leading, spacing: 0) {
                                            Text("Start")
                                                .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                                .foregroundStyle(.black)
                                                .padding(.top, 6)
                                                .padding(.leading, 9)
                                            Text(dateFormatter(date: start))
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                                        .weight(.medium)
                                                )
                                                .foregroundStyle(.black)
                                                .padding(.top, 1)
                                                .padding(.leading, 9)
                                                .overlay(
                                                    DatePicker("visitDate", selection: $start, displayedComponents: [.date])
                                                        .labelsHidden()
                                                        .blendMode(.destinationOver)
                                                )
                                            Spacer()
                                            Rectangle()
                                                .frame(height: 1)
                                                .foregroundStyle(.black)
                                        }
                                        , alignment: .topLeading)
                                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 5, topTrailing: 5))
                                    .frame(width: 135, height: 50)
                                    .foregroundStyle(Color(red: 0.91, green: 0.92, blue: 0.93))
                                    .overlay(
                                        VStack(alignment: .leading, spacing: 0) {
                                            Text("End")
                                                .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                                .foregroundStyle(Color.accentColor)
                                                .padding(.top, 6)
                                                .padding(.leading, 9)
                                            Text(dateFormatter(date: end))
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                                        .weight(.medium)
                                                )
                                                .foregroundStyle(.black)
                                                .padding(.top, 1)
                                                .padding(.leading, 9)
                                                .overlay(
                                                    DatePicker("visitDate", selection: $end, displayedComponents: [.date])
                                                        .labelsHidden()
                                                        .blendMode(.destinationOver)
                                                )
                                            Spacer()
                                            Rectangle()
                                                .frame(height: 1)
                                                .foregroundStyle(Color.accentColor)
                                        }
                                        , alignment: .topLeading)
                            }
                            .padding(.top, 5)
                            .frame(width: 324, alignment: .leading)
                            if isCreate {
                                Button(action: {
                                    show.toggle()
                                })
                                {
                                    Text("새 폴더 추가 완료")
                                        .font(Font.custom("Apple SD Gothic Neo", size: 16))
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                        .background(Color(red: 0.4, green: 0.35, blue: 0.96))
                                        .clipShape(RoundedRectangle(cornerRadius: 14))
                                        .padding(.top, 27)
                                }
                            } else {
                                Button(action: {
                                    show.toggle()
                                })
                                {
                                    Text("수정 완료")
                                        .font(Font.custom("Apple SD Gothic Neo", size: 16))
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                        .background(Color(red: 0.4, green: 0.35, blue: 0.96))
                                        .clipShape(RoundedRectangle(cornerRadius: 14))
                                        .padding(.top, 27)
                                }
                            }
                        }
                    )
            }
            .ignoresSafeArea(.all)
        }
    }
    
    func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: date)
    }
}

#Preview {
    ArchiveView(path: .constant([]))
}

