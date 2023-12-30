//
//  SearchDetailView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/30/23.
//

import SwiftUI

struct SearchDetailView: View {
    @Binding var path: [PathModel]
    @Binding var place: Place
    @State private var recommendedMenu: String = ""
    @State private var dayOff: String = ""
    @State private var providedService: String = ""
    @State private var url: String = ""
    @State private var tag: String = ""
    
    var body: some View {
        Text("다른 사용자들을 위해 조금 더 자세히 입력해주시면\n10포인트를 지급해드려요 !")
            .font(
                .custom("Apple SD Gothic Neo", size: 14)
                .weight(.semibold)
            )
            .multilineTextAlignment(.center)
            .foregroundStyle(Color(red: 0.76, green: 0.09, blue: 0.09))
            .frame(width: 301, alignment: .top)
        SearchItemView(path: $path, place: place)
            .padding(.top, 10)
        
        
        VStack(spacing: 10) {
            SectionView(imageName: "Fork", title: "추천 메뉴", placeholder: "추천 메뉴를 1가지 입력해주세요.", text: $recommendedMenu)
            SectionView(imageName: "Clock", title: "휴무일", placeholder: "휴무일을 입력해주세요.", text: $dayOff)
            SectionView(imageName: "MoneyBag", title: "제공 서비스", placeholder: "제공 서비스를 1가지 입력해주세요.", text: $providedService)
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
            
        }
        .padding(.top, 20)
        Button(action: {
            //MARK: - ImagePicker 구현
        }) {
            Rectangle()
                .stroke(Color(red: 0.62, green: 0.64, blue: 0.67), lineWidth: 1)
                .foregroundStyle(.clear)
                .frame(width: 82, height: 82)
                .overlay(
                    Image(systemName: "plus")
                        .font(
                            .system(size: 20)
                            .bold()
                        )
                        .foregroundStyle(Color(red: 0.62, green: 0.64, blue: 0.67))
                )
        }
        .padding(.top, 20)
        HStack {
            Text("첫 번째 사진은 썸네일로 사용됩니다.")
                .font(Font.custom("Apple SD Gothic Neo", size: 12))
                .multilineTextAlignment(.center)
                .foregroundColor(.black.opacity(0.4))
            Spacer()
        }
        .padding(.leading, 35)
        HStack(spacing: 30) {
            Text("돌아가기")
                .font(Font.custom("Apple SD Gothic Neo", size: 15))
                .foregroundStyle(Color(red: 0, green: 0.48, blue: 1))
                .frame(width: 60, alignment: .center)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(red: 0, green: 0.48, blue: 1), lineWidth: 1)
                        .foregroundStyle(Color(red: 0, green: 0.48, blue: 1))
                        .frame(width: 75, height: 30)
                )
            Text("등록완료")
                .font(
                    .custom("Apple SD Gothic Neo", size: 15)
                )
                .foregroundStyle(.white)
                .frame(width: 60, alignment: .center)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(Color(red: 0, green: 0.48, blue: 1))
                        .frame(width: 75, height: 30)
                )
        }
        .padding(.top, 15)
        Spacer()
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
                .frame(width: 16, height: 16)
                .padding(.leading, 33)
                .padding(.top, 13)
            Text(title)
                .font(
                    .custom("Apple SD Gothic Neo", size: 16)
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
        RoundedRectangle(cornerRadius: 3)
            .stroke(Color(red: 0.62, green: 0.64, blue: 0.67), lineWidth: 1)
            .foregroundStyle(.white)
            .frame(width: 320, height: 30)
            .overlay(
                TextField(placeholder, text: $text)
                    .font(
                        .custom("Apple SD Gothic Neo", size: 15)
                        .weight(.medium)
                    )
                    .foregroundStyle(.gray)
                    .padding(.leading, 10)
            )
    }
}


#Preview {
    SearchDetailView(
        path: .constant([]),
        place: .constant(Place(imageName: "DummyImage", name: "장소1", address: "주소1"))
    )
}
