//
//  LoginView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2024/01/05.
//

import SwiftUI

struct LoginView: View {
//    @State var loginPath: 
    var body: some View {
        NavigationStack {
            Text("my place")
                .font(
                    Font.system(size: 56)
                        .weight(.black)
                )
                .foregroundStyle(Color(red: 0.75, green: 0.33, blue: 0.33))
                .padding(.bottom, 8)
            Text("어디가지? 생각 들 땐 마플!")
                .font(
                    Font.custom("Apple SD Gothic Neo", size: 20)
                        .weight(.semibold)
                )
                .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                .padding(.bottom, 109)
            VStack(spacing: 26) {
                HStack(alignment: .center, spacing: 12) {
                    Image("GoogleIcon")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("구글로 시작하기")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 16)
                                .weight(.medium)
                        )
                        .foregroundStyle(Color(red: 0.12, green: 0.16, blue: 0.23))
                }
                .frame(width: 248, height:20)
                .padding(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .inset(by: 1)
                        .stroke(Color(red: 0.89, green: 0.91, blue: 0.94), lineWidth: 2)
                )
                HStack(alignment: .center, spacing: 12) {
                    Image("KakaoIcon")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("카카오로 시작하기")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 16)
                                .weight(.medium)
                        )
                        .foregroundStyle(Color(red: 0.12, green: 0.16, blue: 0.23))
                }
                .frame(width: 248, height:20)
                .padding(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .inset(by: 1)
                        .stroke(Color(red: 0.89, green: 0.91, blue: 0.94), lineWidth: 2)
                )
                HStack(alignment: .center, spacing: 12) {
                    Image("AppleIcon")
                        .resizable()
                        .frame(width: 23, height: 23)
                    Text("애플로 시작하기")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 16)
                                .weight(.medium)
                        )
                        .foregroundStyle(Color(red: 0.12, green: 0.16, blue: 0.23))
                }
                .frame(width: 248, height:20, alignment: .center)
                .padding(16)
                .overlay(
                  RoundedRectangle(cornerRadius: 40)
                    .inset(by: 1)
                    .stroke(Color(red: 0.89, green: 0.91, blue: 0.94), lineWidth: 2)
                )
            }
            .padding(.bottom, 21)
            HStack(alignment: .center) {
                Text("로그인없이 둘러보기")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 15)
                            .weight(.semibold)
                    )
                    .foregroundStyle(Color(red: 0.54, green: 0.51, blue: 0.81))
                    .padding(.trailing, 8)
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 5, height: 11)
                    .foregroundStyle(Color(red: 0.54, green: 0.51, blue: 0.81))
                    .bold()
            }
        }
    }
}

#Preview {
    LoginView()
}
