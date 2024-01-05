//
//  NewUserProfileView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2024/01/05.
//

import SwiftUI

struct NewUserProfileView: View {
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 273, height: 4)
                        .background(Color(red: 0.39, green: 0.37, blue: 0.6))
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 54, height: 4)
                        .background(Color(red: 0.79, green: 0.8, blue: 0.82))
                }
                HStack {
                    Circle()
                        .frame(width: 19, height: 19)
                        .foregroundColor(Color(red: 0.39, green: 0.37, blue: 0.6))
                    Circle()
                        .frame(width: 19, height: 19)
                        .foregroundColor(Color(red: 0.39, green: 0.37, blue: 0.6))
                        .padding(.horizontal, 91)
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color(red: 0.39, green: 0.37, blue: 0.6))
                        .overlay(
                            Image("check")
                                .frame(width: 11, height: 9))
                }
            }.padding(EdgeInsets(top: 68, leading: 0, bottom: 38, trailing: 0))
            VStack(alignment: .leading, spacing:30) {
                Text("거의 다 왔어요!")
                    .font(
                        Font.custom("Inter", size: 30)
                            .weight(.bold)
                    )
                    .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 216, height: 11)
                        .background(Color(red: 0.76, green: 0.74, blue: 1).opacity(0.6))
                        .padding(.top, 14)
                    Text("나를 잘 나타내는 사진을\n설정해주세요 🥳")
                        .font(
                            Font.custom("Inter", size: 25)
                                .weight(.medium)
                        )
                        .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
                }
            }
            .frame(width: 327, alignment: .leading)
            .padding(.bottom, 80)
            Rectangle()
                .stroke(Color(red: 0.27, green: 0.3, blue: 0.33), lineWidth: 1)
                .frame(width:192, height:192)
                .overlay(
                    Text("+")
                        .font(Font.system(size: 30))
                        .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
                )
                .padding(.bottom, 40)
            HStack(spacing: 18) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 118, height: 34)
                    .foregroundColor(Color(red: 0.4, green: 0.37, blue: 0.8))
                    .overlay(
                        HStack(spacing: 0){
                            Image("AddPhoto")
                                .frame(width:20, height: 20)
                            Text("사진 선택하기")
                                .font(
                                    Font.custom("Inter", size: 14)
                                        .weight(.medium)
                                )
                                .foregroundColor(.white)
                        }
                    )
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.4, green: 0.37, blue:0.8))
                    .frame(width: 118, height: 34)
                    .foregroundColor(.clear)
                    .overlay(
                        Text("다음에 할게요")
                            .font(
                                Font.custom("Inter", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.4, green: 0.37, blue: 0.8))
                    )
            }.padding(.bottom, 25)
            HStack(alignment: .center, spacing: 0) {
                Text("다음에 할게요 ")
                    .font(
                        Font.custom("Inter", size: 12)
                            .weight(.bold)
                    )
                    .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
                Text("선택 시")
                    .font(
                        Font.custom("Inter", size: 12)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
            }
            Text("기본이미지로 설정됩니다.")
                .font(
                    Font.custom("Inter", size: 12)
                        .weight(.medium)
                )
                .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
            Text("프로필 사진은 추후")
                .font(
                    Font.custom("Inter", size: 12)
                        .weight(.medium)
                )
                .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
            HStack(alignment: .center, spacing:0) {
                Text("설정")
                    .font(
                        Font.custom("Inter", size: 12)
                            .weight(.bold)
                    )
                    .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
                Text("에서 변경이 가능합니다")
                    .font(
                        Font.custom("Inter", size: 12)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
            }.padding(.bottom, 84)
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color(red: 0.54, green: 0.51, blue: 0.81))
                .frame(width: 308, height: 46)
                .overlay(
                    Text("시작하기")
                        .font(
                            Font.custom("Noto Sans KR", size: 20)
                                .weight(.bold)
                        )
                        .foregroundColor(.white))
        }
        Spacer()
    }
}

#Preview {
    NewUserProfileView()
}
