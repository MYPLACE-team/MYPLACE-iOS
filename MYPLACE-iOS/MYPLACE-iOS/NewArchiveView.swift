//
//  NewArchiveView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/2/24.
//

import SwiftUI
import PhotosUI

struct NewArchiveView: View {
    @State var placeName: String = "명동돈까스"
    @State var placeLocation: String = "서울특별시 중구 명동3로"
    @State var placeImage: String = "DummyImage"
    @State var isplaceHeart: Bool = false
    @State var stars: Int = 0
    @State private var showPublicInfo: Bool = false
    @State private var isPublic: Bool = false
    @State private var folderName: String = ""
    @State private var title: String = ""
    @State private var comment: String = ""
    @State private var images: [Image?] = []
    @State private var tags: [String] = []
    @State private var tag: String = ""
    @State private var menu: String = ""
    @State private var price: Int?
    @State private var date: String = "2023.04.03"
    @State private var selectedOption: String?
            
    @Binding var path: [PathModel]
    
    let options = ["속초여행", "데이트", "새 폴더"]
    
    var body: some View {
        ScrollView{
            VStack{
                placeView(name: $placeName, location: $placeLocation, image: $placeImage, isHeartFilled: $isplaceHeart)
                    .padding(.top, 32)
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("나의 점수")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 15)
                                    .weight(.semibold)
                            )
                            .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
                        HStack(spacing: 8){
                            ForEach(0..<5)
                            {index in
                                Image( index < stars ? "BigStarFill" : "BigStarEmpty")
                                    .frame(width: 28, height: 28)
                                    .onTapGesture {
                                        if(stars == index + 1) {
                                            stars = 0
                                        } else {
                                            stars = index + 1
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
                                        .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
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
                        Toggle("community",isOn: $isPublic)
                            .labelsHidden()
                    }
                }
                .frame(width: 358)
                .padding(.top, 32)
                HStack(spacing: 0){
                    Text(folderName == "" ? "폴더 선택" : folderName)
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 16)
                                .weight(.medium)
                        )
                        .foregroundStyle(folderName == "" ? Color(red: 0.45, green: 0.47, blue: 0.5) : Color(red: 0.15, green: 0.16, blue: 0.17))
                    Spacer()
                    if folderName == "" {
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
                        .stroke(.black.opacity(0.23), lineWidth: 1)
                )
                .padding(.top, 24)
                HStack(spacing: 0){
                    TextField("Title (10자 이내)", text: $title)
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 16)
                                .weight(.medium)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                        .onChange(of: title) {
                            if title.count > 10 {
                                title = String(title.prefix(10))
                            }
                        }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 16)
                .frame(width: 358,height: 56)
                .overlay(
                    Rectangle()
                        .stroke(.black.opacity(0.23), lineWidth: 1)
                )
                .padding(.top, 16)
                VStack(spacing: 0){
                    TextField("comment (300자 이내)",text: $comment, axis: .vertical)
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 16)
                                .weight(.medium)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                        .onChange(of: comment) {
                            if comment.count > 300 {
                                comment = String(comment.prefix(300))
                            }
                        }
                    Spacer()
                    HStack {
                        Spacer()
                        Text("\(comment.count)/300")
                            .font(Font.custom("Apple SD Gothic Neo", size: 14))
                            .foregroundColor(Color(red: 0.45, green: 0.47, blue: 0.5))
                    }
                    .padding(.bottom, -16)
                    .padding(.trailing, -10)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 16)
                .frame(width: 358)
                .overlay(
                    Rectangle()
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
                            if let image = images[index] {
                                ZStack {
                                    image
                                        .resizable()
                                        .frame(width: 72, height: 72)
                                        .scaledToFill()
                                    Button(action: {
                                        images.remove(at: index)
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.red)
                                    }
                                    .offset(x: 72/2, y: -72/2)
                                }
                                .frame(width: 72, height: 72)
                            }
                            else {
                                SquarePhotosPicker(selectedImage: $images, squareWidth: 72, squareHeight: 72)
                            }
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
                        ForEach(tags.indices, id: \.self) {index in
                            HStack(spacing: 4){
                                Text("#\(tags[index])")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 13)
                                            .weight(.bold)
                                    )
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 8, height: 8)
                                    .bold()
                                    .onTapGesture {
                                        tags.remove(at: index)
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
                        if tags.count < 3 {
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
                                        .stroke(.black.opacity(0.12), lineWidth: 1)
                                )
                                .onSubmit {
                                    if(tag != "") {
                                        tags.append(tag)
                                        tag = ""
                                    }
                                    
                                }
                            ForEach(0..<2 - tags.count, id: \.self) { tag in
                                Rectangle()
                                    .inset(by: 0.5)
                                    .stroke(.black.opacity(0.12), lineWidth: 1)
                                    .frame(width: 72, height: 40)
                            }
                        }
                    }
                    .padding(.top, 8)
                    TextField("",text: $menu, axis: .vertical)
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 16)
                                .weight(.medium)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                        .onChange(of: menu) {
                            if menu.count > 30 {
                                menu = String(menu.prefix(30))
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 16)
                        .frame(width: 358)
                        .background(
                            Rectangle()
                                .stroke(.black.opacity(0.23), lineWidth: 1)
                        )
                        .overlay(
                            Text("먹은 메뉴:")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 15)
                                        .weight(.semibold)
                                )
                                .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
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
                        Text(date)
                            .font(Font.custom("Apple SD Gothic Neo", size: 16))
                            .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .frame(width: 358, height: 54, alignment: .leading)
                    .background(
                        Rectangle()
                            .stroke(.black.opacity(0.23), lineWidth: 1)
                    )
                    .padding(.top, 18)
                }
                .frame(width: 358, alignment: .leading)
                Button(action: {
                    path.removeLast()
                    path.append(.archiveDetailView)
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
                                .foregroundColor(.white)
                        )
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BasicBackButton(path: $path)
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
}

struct placeView: View{
    @Binding var name: String
    @Binding var location: String
    @Binding var image: String
    @Binding var isHeartFilled: Bool
    
    var body: some View {
        HStack(spacing: 0){
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 77, height: 77)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .padding(.all, 6)
            VStack(alignment: .leading, spacing: 9){
                Text("☕️ 명돈돈까스")
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
                    Text("서울특별시 중구 명동3로")
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
                    .onTapGesture {
                        isHeartFilled.toggle()
                    }
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

#Preview {
    NewArchiveView(path: .constant([]))
}
