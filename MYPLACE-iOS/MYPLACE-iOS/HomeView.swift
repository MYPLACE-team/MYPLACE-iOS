//
//  HomeView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/27/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(.white)
                .frame(height: 100)
                .overlay(
                    HStack {
                        VStack {
                            HStack {
                                //MARK: - UserName 필요, 세부적인 디자인 필요
                                Text("라일락")
                                    .font(
                                        .custom("Apple SD Gothic Neo", size: 30)
                                        .weight(.bold)
                                    )
                                    .foregroundStyle(Color(red: 0.39, green: 0.37, blue: 0.6))
                                Text("님,")
                                    .font(
                                        .custom("Apple SD Gothic Neo", size: 20)
                                    )
                                Spacer()
                            }
                            .padding(.leading, 20)
                            HStack {
                                Text("오늘도 잘 다녀오셨나요?")
                                    .font(
                                        .custom("Apple SD Gothic Neo", size: 20)
                                    )
                                    .padding(.leading, 20)
                                Spacer()
                            }
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            HStack {
                                Button(action: {
                                    print("Button Tapped")
                                }) {
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(.black)
                                }
                                .padding(.trailing, 5)
                                
                                Button(action: {
                                    print("Button Tapped")
                                }) {
                                    Image(systemName: "bell")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(.black)
                                }
                            }
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 20))
                    }
                )
        }
        VStack {
            
            //MARK: - mapSdk
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 0.97, green: 0.97, blue: 0.98))
                    .frame(height: 40)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    .overlay(
                        HStack {
                            Image("Map")
                                .resizable()
                                .frame(width: 16, height: 19)
                                .padding(.leading, 15)
                            TextField("장소명 검색하기", text: .constant(""))
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 15)
                                    .weight(.semibold)
                                )
                                .foregroundColor(.gray)
                                .padding(.leading, 5)
                            Spacer()
                        }
                    )
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
            }
            HStack {
                ViewChangeButton(imageName: "Vector", buttonText: "관심장소", buttonColor: Color(red: 0.96, green: 0.26, blue: 0.21), imageSize: CGSize(width: 11, height: 14))
                    .padding(.leading, 20)
                
                Spacer()
                
                ViewChangeButton(imageName: "GreenPlus", buttonText: "아카이브", buttonColor: Color(red: 0.3, green: 0.69, blue: 0.31), imageSize: CGSize(width: 14, height: 14))
                
                Spacer()
                
                ViewChangeButton(imageName: "Community", buttonText: "커뮤니티", buttonColor: Color(red: 1, green: 0.72, blue: 0.3), imageSize: CGSize(width: 15, height: 15))
                    .padding(.trailing, 20)
            }
            .padding(.top, 10)
            
            //MARK: - 맵 화살표 디자이너님 수정 들어오면 바꾸기
            HStack {
                VStack {
                    Button(action: {
                        print("Button Tapped")
                    }) {
                        Circle()
                            .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
                            .frame(width: 48, height: 48)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            .overlay(
                                Image("MapLocation")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                            )
                    }
                }
                .padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 0))
                Spacer()
            }
            Spacer()
            
            //MARK: - 팝업 메시지 디자이너 수정 필요
            ZStack {
                RoundedRectangle(cornerRadius: 60)
                    .fill(Color.white)
                    .frame(width: 300, height: 100)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    .overlay(
                        ZStack {
                            VStack(spacing: 0) {
                                HStack(spacing: 0) {
                                    Text("오늘")
                                    Text(" ☕️ 도틀 ")
                                    Text("방문하면")
                                }
                                .font(.custom("Apple SD Gothic Neo", size: 20))
                                
                                HStack(spacing: 0) {
                                    Text("스콘 1개 무료")
                                        .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                    Text(" 증정!")
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .frame(width: 5, height: 8)
                                        .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                        .bold()
                                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 3, trailing: 0))
                                }
                                .font(.custom("Apple SD Gothic Neo", size: 20))
                                HStack(spacing: 0) {
                                    Text("500m 이내")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Color(red: 0.54, green: 0.51, blue: 0.81))
                                    Text("에 위치합니다.")
                                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                }
                                .font(.custom("Apple SD Gothic Neo", size: 10))
                            }
                            Button(action: {
                                print("Button Tapped")
                            }) {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                            }
                            .padding(EdgeInsets(top: 0, leading: 220, bottom: 50, trailing: 0))
                        }
                    )
            }
        }
        .background(Color.gray)
    }
}

// MARK: - ViewChangeButton
struct ViewChangeButton: View {
    let imageName: String
    let buttonText: String
    let buttonColor: Color
    let imageSize: CGSize
    
    var body: some View {
        Button(action: {
            print("Button Tapped")
        }) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
                .frame(width: 110, height: 28)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                .overlay(
                    HStack {
                        Image(imageName)
                            .resizable()
                            .frame(width: imageSize.width, height: imageSize.height)
                        Text(buttonText)
                            .font(
                                .custom("Apple SD Gothic Neo", size: 14)
                                .weight(.bold)
                            )
                            .foregroundStyle(buttonColor)
                    }
                )
        }
    }
}

#Preview {
    HomeView()
}
