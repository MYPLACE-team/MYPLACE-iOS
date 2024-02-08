//
//  PrivacyView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/2/24.
//

import SwiftUI

struct PrivacyView: View {
    @State private var showAlert: Bool = false
    @State private var showWithDrawalAlert: Bool = false
    @State private var alertTitle: String = ""
    
    @Binding var path: [PathModel]

    var body: some View {
        VStack(spacing: 0){
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 126, height: 126)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(.white)
                        .padding(.trailing, 1)
                        .padding(.bottom, 1)
                        .shadow(color: .black.opacity(0.25), radius: 3.9, x: 1, y: 4)
                        .overlay(
                            Image("edit")
                                .resizable()
                                .frame(width: 16, height: 16)
                        )
                        .onTapGesture {
                            path.append(.profileEditView)
                        }
                    , alignment: .bottomTrailing)
                .padding(.top, 25)
            VStack(spacing: 0){
                HStack(spacing: 0) {
                    Text("닉네임")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 16)
                                .weight(.semibold)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                        .padding(.leading, 20)
                        .padding(.vertical, 13)
                    Spacer()
                    Text("라일락10글자10글자")
                        .font(Font.custom("Apple SD Gothic Neo", size: 14))
                        .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                        .padding(.trailing, 20)
                }
                Rectangle()
                    .frame(width: 324, height: 1)
                    .foregroundStyle(Color(red: 0.91, green: 0.92, blue: 0.93))
                HStack(alignment: .top, spacing: 0) {
                    Text("소개글")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 16)
                                .weight(.semibold)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 13)
                    Spacer()
                    Text(verbatim: "라일락입니다.라일락입니다.라일락입니다.라일락입니다.라일락입니다.라일락입니다")
                        .baselineOffset(4)
                        .multilineTextAlignment(.trailing)
                        .font(Font.custom("Apple SD Gothic Neo", size: 14))
                        .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                        .padding(.trailing, 20)
                        .padding(.vertical, 15)
                }
                Rectangle()
                    .frame(width: 324, height: 1)
                    .foregroundStyle(Color(red: 0.91, green: 0.92, blue: 0.93))
                HStack(alignment: .top, spacing: 0) {
                    Text("등록 이메일")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 16)
                                .weight(.semibold)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 13)
                    Spacer()
                    Text(verbatim: "cjtysnsj@naver.com")
                        .multilineTextAlignment(.leading)
                        .font(Font.custom("Apple SD Gothic Neo", size: 14))
                        .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                        .padding(.trailing, 20)
                        .padding(.vertical, 15)
                }
            }
            .frame(width: 324)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.91, green: 0.92, blue: 0.93), lineWidth: 1)
            )
            .padding(.top, 95)
            
            HStack(spacing: 0) {
                Text("소셜 로그인")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 16)
                            .weight(.semibold)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.leading, 20)
                Spacer()
                Image("AppleIcon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 56)
            }
            .frame(width: 324, height: 42)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.91, green: 0.92, blue: 0.93), lineWidth: 1)
            )
            .padding(.top, 13)
            Spacer()
            HStack(spacing: 0) {
                Button(action: {
                    alertTitle = "로그아웃 하시겠습니까?"
                    showAlert.toggle()
                })
                {
                    Text("로그아웃")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 14)
                                .weight(.semibold)
                        )
                        .foregroundStyle(Color(red: 0.62, green: 0.64, blue: 0.67))
                        .padding(.horizontal, 13)
                        .padding(.vertical, 2)
                }
                Rectangle()
                    .frame(width:1, height: 12)
                    .foregroundStyle(Color(red: 0.62, green: 0.64, blue: 0.67))
                Button(action: {
                    alertTitle = "정말 탈퇴하시겠습니까?"
                    showAlert.toggle()
                })
                {
                    Text("회원탈퇴")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 14)
                                .weight(.semibold)
                        )
                        .foregroundStyle(Color(red: 0.89, green: 0.39, blue: 0.39))
                        .padding(.horizontal, 13)
                        .padding(.vertical, 2)
                }
            }
            .padding(.bottom, 25)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(alertTitle),
                primaryButton: .default(
                    Text("예"),
                    action: {showAlert = false}),
                secondaryButton: .default(
                    Text("아니요"),
                    action: {showAlert = false})
            )
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BasicBackButton(path: $path)
            }
            
            ToolbarItem(placement: .principal) {
                Text("개인정보 관리")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 20)
                            .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    path.append(.notificationView)
                }) {
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    PrivacyView(path: .constant([]))
}
