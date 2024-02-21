//
//  ProfileEditView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/2/24.
//

import SwiftUI
import PhotosUI

struct ProfileEditView: View {
    @State private var name: String = ""
    @State private var profile: String = ""
    @State private var profileImage: Image = Image("profile")
    @State private var profileItem: PhotosPickerItem? = nil
    
    @StateObject var toastViewModel = ToastViewModel.shared
    @StateObject var userEditViewModel = UserEditViewModel.shared

    @Binding var path: [PathModel]
    
    var body: some View {
        VStack(spacing: 0){
            //MARK: - AsyncImage 대공사라서 그냥 시연은 이걸로 하는걸로
            profileImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 126, height: 126)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(
                    PhotosPicker(
                        selection: $profileItem,
                        matching: .images,
                        photoLibrary: .shared()) {
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundStyle(.white)
                                .padding(.trailing, 1)
                                .padding(.bottom, 1)
                                .shadow(color: .black.opacity(0.25), radius: 3.9, x: 1, y: 4)
                                .overlay(
                                    Image(systemName: "camera")
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .frame(width: 13, height: 13)
                                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                )
                        }
                        .onChange(of: profileItem) {
                            Task {
                                if let image = try? await profileItem?.loadTransferable(type: Image.self) {
                                    profileImage = image
                                    profileItem = nil
                                }
                            }
                        }
                    , alignment: .bottomTrailing)
            VStack(spacing: 0) {
                HStack(alignment: .top, spacing: 0){
                    Text("닉네임")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 16)
                                .weight(.semibold)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    Text("*")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 16)
                                .weight(.semibold)
                        )
                        .foregroundStyle(Color(red: 0.76, green: 0.09, blue: 0.09))
                    Spacer()
                }
                HStack(spacing: 0) {
                    TextField(UserInfoViewModel.shared.username, text: $name)
                        .onChange(of: name) {
                            if name.count > 10 {
                                name = String(name.prefix(10))
                            }
                        }
                        .font(Font.custom("Apple SD Gothic Neo", size: 16))
                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    Spacer()
                    Text("\(name.count)/10")
                        .font(Font.custom("Apple SD Gothic Neo", size: 12))
                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                }
                .padding(.top, 20)
                .padding(.bottom, 4)
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(Color(red: 0.79, green: 0.8, blue: 0.82))
                    .padding(.bottom, 36)
                HStack(spacing: 0) {
                    Text("소개글")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 16)
                                .weight(.semibold)
                        )
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    Spacer()
                }
                HStack(alignment: .bottom,spacing: 0) {
                    TextField("커뮤니티에 보여져요.",text: $profile, axis: .vertical)
                        .frame(width: 260)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .onChange(of: profile) {
                            if profile.count > 30 {
                                profile = String(profile.prefix(30))
                            }
                        }
                        .font(Font.custom("Apple SD Gothic Neo", size: 16))
                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    Spacer()
                    Text("\(profile.count)/30")
                        .font(Font.custom("Apple SD Gothic Neo", size: 12))
                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                }
                .padding(.top, 10)
                .padding(.bottom, 4)
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(Color(red: 0.79, green: 0.8, blue: 0.82))
                    .padding(.bottom, 52)
                Button(action: {
                    if(name == "") {
                        toastViewModel.showToastWithString(text: "새로운 닉네임을 입력해주세요.")
                    } else {
                        userEditViewModel.username = name
                        userEditViewModel.profile = profile
                        userEditViewModel.setUserInfo (userId: userEditViewModel.userId, info: userEditViewModel) { result in
                            switch result {
                            case .success(let result):
                                if(result) {
                                    path.removeLast()
                                } else {
                                    toastViewModel.showToastWithString(text: "이미 존재하는 닉네임입니다.")
                                }
                            case .failure(let error):
                                print(String(describing: error))
                                toastViewModel.showToastWithString(text: "프로필 수정에 실패했습니다.")
                            }
                        }
                    }
                })
                {
                    RoundedRectangle(cornerRadius: 7)
                        .frame(width: 300, height: 44)
                        .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                        .overlay(
                            Text("수정 완료")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                        .weight(.medium)
                                )
                                .foregroundStyle(.white)
                        )
                }
                Spacer()
            }
            .frame(width: 300, alignment: .leading)
            .padding(.top, 56)
        }
        .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BasicBackButton(path: $path)
            }
            
            ToolbarItem(placement: .principal) {
                Text("프로필 수정")
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
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
            UIGraphicsBeginImageContext(targetSize)
            image.draw(in: CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return newImage!
        }
}

#Preview {
    ProfileEditView(path: .constant([]))
}




