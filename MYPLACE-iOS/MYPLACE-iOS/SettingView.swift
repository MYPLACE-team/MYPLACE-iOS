//
//  SettingView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/28/23.
//

import SwiftUI

struct SettingView: View {
    @Binding var path: [PathModel]
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 40){
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 15, bottomTrailing: 15))
                    .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                    .frame(height: 304)
                    .ignoresSafeArea(.all)
                    .overlay(
                        VStack(spacing: 18){
                            HStack(spacing: 10){
                                Image("profile")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 81, height: 81)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(
                                        Circle()
                                            .frame(width: 20, height: 20)
                                            .foregroundStyle(.white)
                                            .padding(.trailing, 1)
                                            .padding(.bottom, 1)
                                            .overlay(
                                                Image("edit")
                                                    .resizable()
                                                    .frame(width: 10, height: 10)
                                            )
                                            .onTapGesture {
                                                path.append(.profileEditView)
                                            }
                                        , alignment: .bottomTrailing)
                                VStack(alignment: .leading, spacing: 2){
                                    HStack(alignment: .bottom, spacing: 5){
                                        Text("라일락")
                                            .font(
                                                Font.custom("Apple SD Gothic Neo", size: 20)
                                                    .weight(.semibold)
                                            )
                                            .foregroundStyle(.white)
                                        
                                        Text("Lv.0")
                                            .font(Font.custom("Apple SD Gothic Neo", size: 9))
                                            .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                            .padding(.vertical, 2.8)
                                            .padding(.horizontal, 9)
                                            .background(Color(red: 0.68, green: 0.65, blue: 1))
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                            .padding(.bottom, 2)
                                    }
                                    .padding(.top, 27)
                                    Text(verbatim: "jcjtysnsj@naver.com ")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 16)
                                                .weight(.medium)
                                        )
                                        .foregroundStyle(.white)
                                }
                                Spacer()
                            }
                            HStack {
                                VStack(spacing: 6){
                                    Text("✔️관심장소")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 15)
                                                .weight(.semibold)
                                        )
                                        .foregroundStyle(.white)
                                    Text("86 건")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 17)
                                                .weight(.bold)
                                        )
                                        .foregroundStyle(Color(red: 0.79, green: 0.8, blue: 0.82))
                                        .padding(.leading, 18)
                                }
                                Spacer()
                                VStack(spacing: 6){
                                    Text("✔️아카이빙")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 15)
                                                .weight(.semibold)
                                        )
                                        .foregroundStyle(.white)
                                    Text("43 건")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 17)
                                                .weight(.bold)
                                        )
                                        .foregroundStyle(Color(red: 0.79, green: 0.8, blue: 0.82))
                                        .padding(.leading, 18)
                                }
                                Spacer()
                                VStack(spacing: 6){
                                    Text("✔️스크랩")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 15)
                                                .weight(.semibold)
                                        )
                                        .foregroundStyle(.white)
                                    Text("12 건")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 17)
                                                .weight(.bold)
                                        )
                                        .foregroundStyle(Color(red: 0.79, green: 0.8, blue: 0.82))
                                        .padding(.leading, 14)
                                }
                            }
                            Spacer()
                        }
                            .frame(width: 310)
                            .padding(.top, 100)
                    )
                HStack(alignment: .top, spacing: 14){
                    RoundedRectangle(cornerRadius: 1)
                      .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                      .frame(width: 5, height: 16)
                      .padding(.top, 1)
                    VStack(alignment: .leading, spacing: 6) {
                        Text("알림")
                          .font(
                            Font.custom("Apple SD Gothic Neo", size: 17)
                              .weight(.semibold)
                          )
                          .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                        Button(action: {
                            path.append(.notificationSettingView)
                        })
                        {
                            Text("알림 설정")
                                .font(Font.custom("Apple SD Gothic Neo", size: 16))
                                .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        }
                    }
                }
                .padding(.leading, 33)
                .padding(.top, 30)
                HStack(alignment: .top, spacing: 14){
                    RoundedRectangle(cornerRadius: 1)
                      .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                      .frame(width: 5, height: 16)
                      .padding(.top, 1)
                    VStack(alignment: .leading, spacing: 6) {
                        Text("약관 및 정책")
                          .font(
                            Font.custom("Apple SD Gothic Neo", size: 17)
                              .weight(.semibold)
                          )
                          .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                        Text("서비스 이용 약관")
                          .font(Font.custom("Apple SD Gothic Neo", size: 16))
                          .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        Text("개인정보 처리 방침")
                          .font(Font.custom("Apple SD Gothic Neo", size: 16))
                          .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        Text("위치기반 서비스 이용 약관")
                          .font(Font.custom("Apple SD Gothic Neo", size: 16))
                          .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                    }
                }
                .padding(.leading, 33)
                HStack(alignment: .top, spacing: 14){
                    RoundedRectangle(cornerRadius: 1)
                      .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                      .frame(width: 5, height: 16)
                      .padding(.top, 1)
                    VStack(alignment: .leading, spacing: 6) {
                        Text("개인정보")
                          .font(
                            Font.custom("Apple SD Gothic Neo", size: 17)
                              .weight(.semibold)
                          )
                          .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                        Button(action: {
                            path.append(.privacyView)
                        })
                        {Text("개인정보 관리")
                                .font(Font.custom("Apple SD Gothic Neo", size: 16))
                                .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        }
                    }
                }
                .padding(.leading, 33)
                Spacer()
                HStack(alignment: .center){
                    Text("최신버전: 1.0")
                      .font(Font.custom("Apple SD Gothic Neo", size: 13))
                      .foregroundStyle(.black.opacity(0.4))
                }.frame(maxWidth: .infinity)
            }
            .ignoresSafeArea(.all)
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .frame(width: 310, height: 78)
                    .overlay(
                        HStack(spacing: 0){
                            VStack(spacing: 4){
                                Text("마플 머니")
                                  .font(
                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                      .weight(.semibold)
                                  )
                                  .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                Text("2,700 MP")
                                  .font(
                                    Font.custom("Apple SD Gothic Neo", size: 14)
                                      .weight(.bold)
                                  )
                                  .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                            }
                            .frame(width: 138)
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color(red: 0.79, green: 0.8, blue: 0.82))
                                .frame(width: 2, height: 18)
                            VStack(spacing: 4){
                                Text("별점")
                                  .font(
                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                      .weight(.semibold)
                                  )
                                  .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                HStack(spacing: 2) {
                                    ForEach(0..<4, id: \.self)
                                    {star in
                                        Image("StarFill")
                                            .resizable()
                                            .frame(width: 18, height: 18)
                                    }
                                    ForEach(0..<5 - 4, id: \.self) {star in
                                        Image("StarEmpty")
                                            .resizable()
                                            .frame(width: 18, height: 18)
                                    }
                                }
                            }
                            .frame(width: 138)
                        }
                    )
                    .shadow(color: .black.opacity(0.1), radius: 2.5, x: 0, y: 2)
                    .shadow(color: .black.opacity(0.09), radius: 4.5, x: 0, y: 9)
                    .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 20)
                    .shadow(color: .black.opacity(0.01), radius: 7, x: 0, y: 36)
                    .shadow(color: .black.opacity(0), radius: 8, x: 0, y: 56)
                    .padding(.top, 260)
                Spacer()
            }
            .ignoresSafeArea(.all)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BasicBackButton(path: $path)
            }
            
            ToolbarItem(placement: .principal) {
                Text("마이 페이지")
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
    SettingView(path: .constant([]))
}
