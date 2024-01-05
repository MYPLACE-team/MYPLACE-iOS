//
//  NewUserNameView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2024/01/05.
//

import SwiftUI

struct NewUserNameView: View {
    @State var nickName: String = ""
    @State var alertColor: Color = Color.red
    @State var alertImage: String = ""
    @State var alertText: String = "alertText"
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    HStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 163, height: 4)
                            .background(Color(red: 0.39, green: 0.37, blue: 0.6))
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 164, height: 4)
                            .background(Color(red: 0.79, green: 0.8, blue: 0.82))
                    }
                    HStack {
                        Circle()
                            .frame(width: 19, height: 19)
                            .foregroundColor(Color(red: 0.39, green: 0.37, blue: 0.6))
                        Circle()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color(red: 0.39, green: 0.37, blue: 0.6))
                            .overlay(
                                Image("check")
                                .frame(width: 11, height: 9)
                            )
                            .padding(.horizontal, 91)
                        Circle()
                            .frame(width: 19, height: 19)
                            .foregroundColor(Color(red: 0.79, green: 0.8, blue: 0.82))
                    }
                }
                .padding(EdgeInsets(top: 68, leading: 0, bottom: 38, trailing: 0))
                VStack(alignment: .leading) {
                    Text("안녕하세요!")
                        .font(
                            Font.custom("Inter", size: 30)
                                .weight(.bold)
                        )
                        .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
                        .padding(.bottom, 30)
                    HStack(spacing: 0) {
                        Text("사용하실 닉네임")
                            .font(
                                Font.custom("Inter", size: 25)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
                            .background(Color(red: 0.76, green: 0.74, blue: 1).opacity(0.6))
                        Text("을")
                            .font(
                                Font.custom("Inter", size: 25)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
                    }
                    Text("입력해주세요 🙂")
                        .font(
                            Font.custom("Inter", size: 25)
                                .weight(.medium)
                        )
                        .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
                        .padding(.bottom, 100)
                    ZStack(alignment:.trailing) {
                        TextField("닉네임 입력", text: $nickName)
                            .foregroundColor(.clear)
                            .frame(width: 312, height: 40)
                            .padding(.leading, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(Color.black.opacity(0.25), lineWidth: 1)
                            )
                            .shadow(color: .black.opacity(0.25), radius: 1, x: 0, y: 0)
                        Circle()
                            .foregroundColor(.red)
                            .frame(width:22, height:22)
                            .padding(.trailing, 10)
                    }
                    .padding(.bottom, 5)
                    Text("\(alertText)")
                        .font(
                            Font.custom("Noto Sans KR", size: 13)
                                .weight(.medium)
                        )
                        .foregroundColor(Color(red: 1, green: 0, blue: 0))
                }
            }
            Spacer()
        }
    }
}

#Preview {
    NewUserNameView()
}
