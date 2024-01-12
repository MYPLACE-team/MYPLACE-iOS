//
//  NewUserProfileView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2024/01/05.
//

import SwiftUI

struct NewUserProfileView: View {
    @Binding var loginPath: [LoginPathModel]

    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Rectangle()
                        .foregroundStyle(Color(red: 0.39, green: 0.37, blue: 0.6))
                        .frame(width: 273, height: 4)
                    Rectangle()
                        .foregroundStyle(Color(red: 0.79, green: 0.8, blue: 0.82))
                        .frame(width: 54, height: 4)
                }
                HStack {
                    Circle()
                        .frame(width: 19, height: 19)
                        .foregroundStyle(Color(red: 0.39, green: 0.37, blue: 0.6))
                    Circle()
                        .frame(width: 19, height: 19)
                        .foregroundStyle(Color(red: 0.39, green: 0.37, blue: 0.6))
                        .padding(.horizontal, 91)
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(Color(red: 0.39, green: 0.37, blue: 0.6))
                        .overlay(
                            Image("check")
                                .frame(width: 11, height: 9))
                }
            }.padding(EdgeInsets(top: 20, leading: 0, bottom: 38, trailing: 0))
            VStack(alignment: .leading) {
                Text("거의 다 왔어요!")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 30)
                            .weight(.bold)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.bottom, 20)
                HStack(spacing: 0) {
                    Text("나를 잘 나타내는 사진")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 25)
                                .weight(.medium)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                        .background(
                            VStack{
                                Spacer()
                                Rectangle()
                                    .foregroundStyle(Color(red: 0.76, green: 0.74, blue: 1).opacity(0.6))
                                    .frame(height: 12)
                            }
                        )
                    Text("을")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 25)
                                .weight(.medium)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                }
                Text("설정해주세요 🥳")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 25)
                            .weight(.medium)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                
            }
            .frame(width: 327, alignment: .leading)
            .padding(.bottom, 40)
            Button(action: {
                
            })
            {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(Color(red: 0.79, green: 0.8, blue: 0.82))
                    .frame(width:192, height:192)
                    .overlay(
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(style: StrokeStyle(lineWidth: 4, dash: [5]))
                                .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                            Text("+")
                                .font(Font.system(size: 30))
                                .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                        }
                    )
                    .padding(.bottom, 40)
            }
            HStack(spacing: 18) {
                Button(action: {
                    
                })
                {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 118, height: 34)
                        .foregroundStyle(Color(red: 0.4, green: 0.37, blue: 0.8))
                        .overlay(
                            HStack(spacing: 0){
                                Image("AddPhoto")
                                    .frame(width:20, height: 20)
                                Text("사진 선택하기")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 14)
                                            .weight(.medium)
                                    )
                                    .foregroundStyle(.white)
                            }
                        )
                }
                Button(action: {
                    
                })
                {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.4, green: 0.37, blue:0.8))
                        .frame(width: 118, height: 34)
                        .foregroundStyle(.clear)
                        .overlay(
                            Text("다음에 할게요")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 14)
                                        .weight(.medium)
                                )
                                .foregroundStyle(Color(red: 0.4, green: 0.37, blue: 0.8))
                        )
                }
            }.padding(.bottom, 25)
            HStack(alignment: .center, spacing: 0) {
                Text("다음에 할게요 ")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 14)
                            .weight(.bold)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                Text("선택 시")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 14)
                            .weight(.medium)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
            }
            Text("기본이미지로 설정됩니다.")
                .font(
                    Font.custom("Apple SD Gothic Neo", size: 14)
                        .weight(.medium)
                )
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
            Text("프로필 사진은 추후")
                .font(
                    Font.custom("Apple SD Gothic Neo", size: 14)
                        .weight(.medium)
                )
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
            HStack(alignment: .center, spacing:0) {
                Text("설정")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 14)
                            .weight(.bold)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                Text("에서 변경이 가능합니다.")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 14)
                            .weight(.medium)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
            }
            Spacer()
            Button(action: {
                
            })
            {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(Color(red: 0.4, green: 0.37, blue: 0.8))
                    .frame(width: 308, height: 46)
                    .overlay(
                        Text("시작하기")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 20)
                                    .weight(.bold)
                            )
                            .foregroundStyle(.white))
                    .padding(.bottom, 20)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading ) {
                NewUserBackButton(loginPath: $loginPath)
            }
        }
    }
}

#Preview {
    NewUserProfileView(loginPath: .constant([]))
}
