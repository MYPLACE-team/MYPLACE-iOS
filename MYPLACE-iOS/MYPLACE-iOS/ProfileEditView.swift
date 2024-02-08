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
    @State private var introduction: String = ""
    private let nameHolder: String = "라일락"
    
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
                            Button(action: {
                                
                            })
                            {
                                Image(systemName: "camera")
                                    .resizable()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(width: 13, height: 13)
                                    .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                            }
                        )
                    , alignment: .bottomTrailing)
                .padding(.top, 25)
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
                    TextField(nameHolder,text: $name)
                        .onChange(of: name) {
                            if name.count > 10 {
                                name = String(name.prefix(10))
                            }
                        }
                        .font(Font.custom("Apple SD Gothic Neo", size: 16))
                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
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
                    TextField("커뮤니티에 보여져요.",text: $introduction, axis: .vertical)
                        .frame(width: 260)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .onChange(of: introduction) {
                            if introduction.count > 30 {
                                introduction = String(introduction.prefix(30))
                            }
                        }
                        .font(Font.custom("Apple SD Gothic Neo", size: 16))
                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                    Spacer()
                    Text("\(introduction.count)/30")
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
                    path.append(.privacyView)
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
                    .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
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
    ProfileEditView(path: .constant([]))
}
