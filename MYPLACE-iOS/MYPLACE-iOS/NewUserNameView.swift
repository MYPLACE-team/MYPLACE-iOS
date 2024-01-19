//
//  NewUserNameView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2024/01/05.
//

import SwiftUI

struct NewUserNameView: View {
    @State var nickName: String = ""
    @State var alertColor: Color = Color.black
    @State var alertImage: String = ""
    @State var alertText: String = ""
    @State var isAvailable: Bool = false

    
    @Binding var loginPath: [LoginPathModel]
    
    @StateObject var loginModel = LoginModel()
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Rectangle()
                        .foregroundStyle(.clear)
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
                        .foregroundStyle(Color(red: 0.39, green: 0.37, blue: 0.6))
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(Color(red: 0.39, green: 0.37, blue: 0.6))
                        .overlay(
                            Image("check")
                                .frame(width: 11, height: 9)
                        )
                        .padding(.horizontal, 91)
                    Circle()
                        .frame(width: 19, height: 19)
                        .foregroundStyle(Color(red: 0.79, green: 0.8, blue: 0.82))
                }
            }
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 38, trailing: 0))
            VStack(alignment: .leading) {
                Text("안녕하세요!")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 30)
                            .weight(.bold)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.bottom, 30)
                HStack(spacing: 0) {
                    Text("사용하실 닉네임")
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
                            Font.custom("Inter", size: 25)
                                .weight(.medium)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                }
                Text("입력해주세요 🙂")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 25)
                            .weight(.medium)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.bottom, 100)
                TextField("닉네임 입력", text: $nickName, onCommit: {
                    isNameAvailable()
                    print(nickName)
                })
                .autocapitalization(.none)
                .foregroundStyle(.black)
                .frame(width: 312, height: 40)
                .padding(.leading, 10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(alertColor.opacity(0.25), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.25), radius: 1, x: 0, y: 0)
                .overlay(
                    HStack {
                        Spacer()
                        Image(systemName: alertImage)
                            .resizable()
                            .foregroundStyle(alertColor)
                            .frame(width: 22, height: 22)
                            .padding(.trailing, 10)
                    }
                )
                .padding(.bottom, 5)
                Text("\(alertText)")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 14)
                            .weight(.medium)
                    )
                    .foregroundStyle(alertColor)
                    .padding(.bottom, 20)
                Button(action: {
                    loginPath.append(.newUserProfileView)
                })
                {
                    if isAvailable {
                        HStack(alignment: .center, spacing: 10) {
                            Spacer()
                            Text("다음으로")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 25)
                                        .weight(.medium)
                                )
                                .foregroundStyle(Color(red: 0.39, green: 0.37, blue: 0.6))
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color(red: 0.39, green: 0.37, blue: 0.6))
                                .bold()
                        }
                        .frame(width: 320)
                    }
                }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading ) {
                NewUserBackButton(loginPath: $loginPath)
            }
        }
    }
    
    func isNameAvailable() {
        isAvailable = loginModel.checkNameAvailability(name: nickName)
        
        if(isAvailable) {
            alertText = "사용가능한 닉네임입니다."
            alertColor = Color.blue
            alertImage = "checkmark.circle.fill"
        } else {
            alertText = "이미 사용중인 닉네임입니다.\n8자 이하로 입력해주세요."
            alertColor = Color.red
            alertImage = "exclamationmark.circle.fill"
        }
    }
}

#Preview {
    NewUserNameView(loginPath: .constant([]))
}
