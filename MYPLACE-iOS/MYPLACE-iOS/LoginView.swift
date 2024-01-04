//
//  LoginView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2024/01/05.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack {
            Text("my place")
              .font(
                Font.custom("Inter", size: 50)
                  .weight(.heavy)
              )
              .foregroundColor(Color(red: 0.75, green: 0.33, blue: 0.33))
              .padding(.bottom, 8)
            Text("어디가지? 생각 들 땐 마플!")
              .font(
                Font.custom("Apple SD Gothic Neo", size: 20)
                  .weight(.semibold)
              )
              .foregroundColor(Color(red: 0.45, green: 0.47, blue: 0.5))
              .padding(.bottom, 109)
            VStack(spacing: 26) {
                HStack(alignment: .center, spacing: 16) {
                    Image("GoogleIcon")
                    .frame(width: 24, height: 24)
                    Text("구글로 시작하기")
                      .font(
                        Font.custom("Inter", size: 16)
                          .weight(.medium)
                      )
                      .foregroundColor(Color(red: 0.12, green: 0.16, blue: 0.23))
                }
                .padding(16)
                .frame(width: 280, alignment: .center)
                .cornerRadius(9999)
                .overlay(
                  RoundedRectangle(cornerRadius: 9999)
                    .inset(by: 1)
                    .stroke(Color(red: 0.89, green: 0.91, blue: 0.94), lineWidth: 2)
                )
                HStack(alignment: .center, spacing: 16) {
                    Image("KakaoIcon")
                    .frame(width: 24, height: 24)
                    Text("카카오로 시작하기")
                      .font(
                        Font.custom("Inter", size: 16)
                          .weight(.medium)
                      )
                      .foregroundColor(Color(red: 0.12, green: 0.16, blue: 0.23))
                }
                .padding(16)
                .frame(width: 280, alignment: .center)
                .cornerRadius(9999)
                HStack(alignment: .center, spacing: 16) {
                    Image("AppleIcon")
                    .frame(width: 24, height: 24)
                    Text("애플로 시작하기")
                      .font(
                        Font.custom("Inter", size: 16)
                          .weight(.medium)
                      )
                      .foregroundColor(Color(red: 0.12, green: 0.16, blue: 0.23))
                }
                .padding(16)
                .frame(width: 280, alignment: .center)
                .cornerRadius(9999)
                .overlay(
                  RoundedRectangle(cornerRadius: 9999)
                    .inset(by: 1)
                    .stroke(Color(red: 0.89, green: 0.91, blue: 0.94), lineWidth: 2)
                )
            }
            HStack {
                Text("로그인없이 둘러보기")
                  .font(
                    Font.custom("Apple SD Gothic Neo", size: 15)
                      .weight(.semibold)
                  )
                  .foregroundColor(Color(red: 0.54, green: 0.51, blue: 0.81))
                  .padding(.trailing, 8)
                Image("right")
                .frame(width: 5, height: 5)
            }
        }
    }
}

#Preview {
    LoginView()
}
