//
//  NewUserView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 1/19/24.
//

import SwiftUI
import PhotosUI

struct NewUserView: View {
    @State private var nickName: String = ""
    @State private var alertColor: Color = Color(red: 0.62, green: 0.64, blue: 0.67)
    @State private var alertImage: String = ""
    @State private var alertText: String = ""
    @State private var isAvailable: Bool = false
    @State private var isNameView: Bool = true
    @State private var lineLength: CGFloat = 156
    @State private var profileItem: PhotosPickerItem?
    @State private var profileImage: Image?
    
    @Binding var loginPath: [LoginPathModel]
    @StateObject var loginModel = LoginModel()
    
    var body: some View {
        VStack {
            ZStack {
                HStack(spacing: 0) {
                    Rectangle()
                        .foregroundStyle(Color(red: 0.31, green: 0.27, blue: 0.9))
                        .frame(width: lineLength, height: 2)
                        .animation(.linear(duration: 2), value: true)
                    Rectangle()
                        .foregroundStyle(Color(red: 0.82, green: 0.84, blue: 0.86))
                        .frame(width: 312-lineLength, height: 2)
                }
                HStack {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(Color(red: 0.31, green: 0.27, blue: 0.9))
                        .overlay(
                            Image(systemName: "checkmark")
                                .resizable()
                                .foregroundStyle(.white)
                                .frame(width: 14, height: 10)
                        )
                    if isNameView {
                        Circle()
                            .frame(width: 28, height: 28)
                            .foregroundStyle(.white)
                            .background(
                                Circle()
                                    .frame(width: 32, height: 32)
                                    .foregroundStyle(Color(red: 0.31, green: 0.27, blue: 0.9))
                            )
                            .overlay(
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .foregroundStyle(Color(red: 0.31, green: 0.27, blue: 0.9))
                            )
                            .padding(.horizontal, 82)
                        Circle()
                            .frame(width: 28, height: 28)
                            .foregroundStyle(.white)
                            .background(
                                Circle()
                                    .frame(width: 32, height: 32)
                                    .foregroundStyle(Color(red: 0.82, green: 0.84, blue: 0.86))
                            )
                    }
                    else {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(Color(red: 0.31, green: 0.27, blue: 0.9))
                            .overlay(
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .foregroundStyle(.white)
                                    .frame(width: 14, height: 10)
                            )
                            .padding(.horizontal, 80)
                        Circle()
                            .frame(width: 28, height: 28)
                            .foregroundStyle(.white)
                            .background(
                                Circle()
                                    .frame(width: 32, height: 32)
                                    .foregroundStyle(Color(red: 0.31, green: 0.27, blue: 0.9))
                            )
                            .overlay(
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .foregroundStyle(Color(red: 0.31, green: 0.27, blue: 0.9))
                            )
                    }
                }
            }
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 40, trailing: 0))
            if isNameView {
                VStack(alignment: .leading) {
                    Text("안녕하세요!")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 30)
                                .weight(.bold)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                        .padding(.bottom, 18)
                    HStack(spacing: 0) {
                        Text("사용하실 닉네임")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 20)
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
                                Font.custom("Apple SD Gothic Neo", size: 20)
                                    .weight(.medium)
                            )
                            .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    }
                    Text("입력해주세요")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 20)
                                .weight(.medium)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                        .padding(.bottom, 55)
                    TextField("닉네임 입력", text: $nickName, onCommit: {
                        isNameAvailable()
                        print(nickName)
                    })
                    .font(Font.custom("Apple SD Gothic Neo", size: 16)
                        .weight(.medium))
                    .autocapitalization(.none)
                    .autocorrectionDisabled()                    .foregroundStyle(.black)
                    .padding(.horizontal, 11)
                    .padding(.vertical, 13)
                    .frame(width: 310, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 7)
                            .strokeBorder(alertColor, lineWidth: 1)
                    )
                    .overlay(
                        HStack {
                            if alertImage != "" {
                                Spacer()
                                Image(systemName: alertImage)
                                    .resizable()
                                    .foregroundStyle(alertColor)
                                    .frame(width: 22, height: 22)
                                    .padding(.trailing, 10)
                            }
                        }
                    )
                    Text("\(alertText)")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 14)
                                .weight(.medium)
                        )
                        .foregroundStyle(alertColor)
                        .frame(height: 24)
                        .padding(.bottom, 14)
                    HStack(spacing: 0) {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                            .padding(.trailing, 5)
                        Text("닉네임은 ")
                            .font(Font.custom("Apple SD Gothic Neo", size: 14)
                                .weight(.medium))
                            .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        Text("10자 이하")
                            .font(Font.custom("Apple SD Gothic Neo", size: 14)
                                .weight(.bold))
                            .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        Text("로 입력해주세요.")
                            .font(Font.custom("Apple SD Gothic Neo", size: 14)
                                .weight(.medium))
                            .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                    }
                    Spacer()
                    Button(action: {
                        if(isAvailable) {
                            isNameView = false
                            withAnimation {
                                lineLength = 268
                            }
                        }
                    })
                    {
                        RoundedRectangle(cornerRadius: 7)
                            .frame(width: 312, height: 44)
                            .foregroundStyle(.clear)
                            .background(
                                RoundedRectangle(cornerRadius: 7)
                                    .frame(width: 320, height: 44)
                                    .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                            )
                            .overlay(
                                Text("다음으로")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 16)
                                            .weight(.medium)
                                    )
                                    .foregroundStyle(.white)
                            )
                            .padding(.bottom, 150)
                    }
                }
                .frame(width: 312)
            }
            else {
                VStack(alignment: .leading) {
                    Text("거의 다 왔어요!")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 30)
                                .weight(.bold)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                        .padding(.bottom, 18)
                    HStack(spacing: 0) {
                        Text("나를 잘 나타내는 사진")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 20)
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
                                Font.custom("Apple SD Gothic Neo", size: 20)
                                    .weight(.medium)
                            )
                            .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    }
                    Text("설정해주세요")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 20)
                                .weight(.medium)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    
                }
                .frame(width: 312, alignment: .leading)
                .padding(.bottom, 36)
                if profileImage == nil {
                    PhotosPicker(
                        selection: $profileItem,
                        matching: .images,
                        photoLibrary: .shared()) {
                            RoundedRectangle(cornerRadius: 7)
                                .foregroundStyle(Color(red: 0.91, green: 0.92, blue: 0.93))
                                .frame(width:154, height:154)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 7)
                                        .inset(by: 1)
                                        .stroke(Color(red: 0.45, green: 0.47, blue: 0.5), style: StrokeStyle(lineWidth: 2, dash: [2, 2]))
                                        .overlay(
                                            Image(systemName: "plus.circle")
                                                .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                        )
                                )
                                .padding(.bottom, 26)
                        }
                        .onChange(of: profileItem) {
                            Task {
                                if let image = try? await profileItem?.loadTransferable(type: Image.self) {
                                    profileImage = image
                                    profileItem = nil
                                }
                            }
                        }
                }
                else {
                    profileImage?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 154, height: 154)
                        .cornerRadius(7)
                        .padding(.bottom, 26)
                }
                VStack(spacing: 5){
                    HStack(spacing: 0) {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                            .padding(.trailing, 5)
                        Text("사진을 입력하지 않으면 ")
                            .font(Font.custom("Apple SD Gothic Neo", size: 14)
                                .weight(.medium))
                            .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        Text("기본이미지")
                            .font(Font.custom("Apple SD Gothic Neo", size: 14)
                                .weight(.bold))
                            .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        Text("로 설정됩니다.")
                            .font(Font.custom("Apple SD Gothic Neo", size: 14)
                                .weight(.medium))
                            .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                    }
                    HStack(spacing: 0) {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                            .padding(.trailing, 5)
                        Text("프로필 사진은 추후 ")
                            .font(Font.custom("Apple SD Gothic Neo", size: 14)
                                .weight(.medium))
                            .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        Text("설정에서 변경")
                            .font(Font.custom("Apple SD Gothic Neo", size: 14)
                                .weight(.bold))
                            .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        Text("이 가능합니다.")
                            .font(Font.custom("Apple SD Gothic Neo", size: 14)
                                .weight(.medium))
                            .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                    }
                }
                Spacer()
                Button(action: {
                    isNameView = true
                })
                {
                    RoundedRectangle(cornerRadius: 7)
                        .frame(width: 312, height: 44)
                        .foregroundStyle(.clear)
                        .background(
                            RoundedRectangle(cornerRadius: 7)
                                .frame(width: 320, height: 44)
                                .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                        )
                        .overlay(
                            Text("시작하기")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                        .weight(.medium)
                                )
                                .foregroundStyle(.white)
                        )
                        .padding(.bottom, 150)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading ) {
                Button(action: {
                    if isNameView {
                        if loginPath.count > 0 {
                            loginPath.removeLast()
                        }
                    } else {
                        isNameView = true
                        withAnimation {
                            lineLength = 156
                        }
                    }
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .bold()
                    }
                    .foregroundStyle(Color(red: 0.39, green: 0.37, blue: 0.6))
                }
            }
        }
        
    }
    
    func isNameAvailable() {
        isAvailable = loginModel.checkNameAvailability(name: nickName)
        
        if(isAvailable) {
            alertText = "사용가능한 닉네임입니다."
            alertColor = Color.blue
            alertImage = "checkmark.circle"
        } else {
            alertText = "이미 사용중인 닉네임입니다."
            alertColor = Color.red
            alertImage = "exclamationmark.circle"
        }
    }
}

#Preview {
    NewUserView(loginPath: .constant([]))
}

