//
//  LoginView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2024/01/05.
//

import SwiftUI

struct LoginView: View {
    @State var loginPath: [LoginPathModel] = []
    @StateObject var loginModel = LoginModel()
    var body: some View {
        NavigationStack(path: $loginPath) {
            ZStack{
                VStack{
                    LinearGradient(gradient: Gradient(colors: [Color(red: 0.92, green: 0.92, blue: 0.99), Color(.white)]),
                                   startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: 270)
                    .padding(.top, 117)
                    Spacer()
                }
                VStack{
                    Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, 20)
                    Spacer()
                }
                VStack{
                    Spacer()
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundStyle(Color(red: 0.32, green: 0.29, blue: 0.67))
                        .frame(width: 394, height: 454)
                        .overlay(
                            VStack(spacing: 26) {
                                Button(action : {
                                    loginModel.googleLogin()
                                    loginPath.append(.newUserView)
                                    //loginPath.append(.newUserNameView)
                                })
                                {
                                    HStack(alignment: .center, spacing: 12) {
                                        Image("GoogleIcon")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                        Text("구글로 시작하기")
                                            .font(
                                                Font.custom("Apple SD Gothic Neo", size: 16)
                                                    .weight(.medium)
                                            )
                                            .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                    }
                                    .padding(16)
                                    .frame(width: 280, height:53)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.15, green: 0.16, blue: 0.17), lineWidth: 1)
                                )
                                .padding(.top, 60)
                                Button(action: {
                                    loginModel.kakaoLogin()
                                    loginPath.append(.newUserView)
                                    //loginPath.append(.newUserNameView)
                                })
                                {
                                    HStack(alignment: .center, spacing: 12) {
                                        Image("KakaoIcon")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                        Text("카카오로 시작하기")
                                            .font(
                                                Font.custom("Apple SD Gothic Neo", size: 16)
                                                    .weight(.medium)
                                            )
                                            .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                    }
                                    .padding(16)
                                    .frame(width: 280, height:53)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.15, green: 0.16, blue: 0.17), lineWidth: 1)
                                )
                                Button(action: {
                                    loginModel.appleLogin()
                                    loginPath.append(.newUserView)
                                    //loginPath.append(.newUserNameView)
                                })
                                {
                                    HStack(alignment: .center, spacing: 12) {
                                        Image("AppleIcon")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .padding(.bottom, 3)
                                        Text("애플로 시작하기")
                                            .font(
                                                Font.custom("Apple SD Gothic Neo", size: 16)
                                                    .weight(.medium)
                                            )
                                            .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                        
                                    }
                                    .padding(16)
                                    .frame(width: 280, height:53)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.15, green: 0.16, blue: 0.17), lineWidth: 1)
                                )
                                Spacer()
                            }
                        )
                }
                .ignoresSafeArea(.all)
                VStack{
                    HStack(alignment: .top){
                        Text("My Place")
                            .font(
                                Font.system(size: 50)
                                    .weight(.heavy)
                            )
                            .foregroundStyle(Color(red: 0.32, green: 0.29, blue: 0.77))
                        Image("MyPlaceIcon")
                            .frame(width: 20, height: 20)
                    }
                    .padding(.bottom, 1)
                    .padding(.top, 170)
                    Text("어디가지? 생각 들 땐 마플!")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 20)
                                .weight(.semibold)
                        )
                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        .padding(.bottom, 109)

                    Spacer()
                }
            }
            .navigationDestination(for: LoginPathModel.self) { loginPathModel in
                switch loginPathModel {
                case .newUserView:
                    NewUserView(loginPath: $loginPath)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
