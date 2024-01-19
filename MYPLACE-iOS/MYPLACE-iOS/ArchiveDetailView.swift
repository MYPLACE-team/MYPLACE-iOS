//
//  ArchiveDetailView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 1/19/24.
//

import SwiftUI
struct ArchiveDetailView: View {
    @State var archiveData = archiveDetail
    @State var isLocationView: Bool = false
    
    @Binding var path: [PathModel]
    
    var body: some View {
        ZStack{
            Color(red: 0.86, green: 0.87, blue: 0.94)
                .ignoresSafeArea(.all)
            VStack{
                RoundedRectangle(cornerRadius: 60)
                    .foregroundColor(.white)
                    .overlay(
                        VStack{
                            HStack(spacing: 90){
                                VStack(spacing: 8){
                                    Text("0")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 15)
                                                .weight(.bold)
                                        )
                                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                    Text("레벨")
                                        .font(Font.custom("Apple SD Gothic Neo", size: 13))
                                        .foregroundColor(Color(red: 0.45, green: 0.47, blue: 0.5))
                                }.frame(width: 120, height: 50)
                                VStack(spacing: 8){
                                    Text("14")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 15)
                                                .weight(.bold)
                                        )
                                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                    Text("아카이브")
                                        .font(Font.custom("Apple SD Gothic Neo", size: 13))
                                        .foregroundColor(Color(red: 0.45, green: 0.47, blue: 0.5))
                                }.frame(width: 120, height: 50)
                            }
                            .padding(.top, 15)
                            Text("라일락")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 16)
                                        .weight(.bold)
                                )
                                .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
                                .padding(.top, 10)
                            Text("종로구에 살고 있으며, 커피를 좋아해 \n카페 탐방이 취미입니다.")
                                .font(Font.custom("Apple SD Gothic Neo", size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.45, green: 0.47, blue: 0.5))
                                .padding(.top, 10)
                            HStack{
                                if isLocationView {
                                    Button(action: {
                                    })
                                    {
                                        VStack(spacing: 4){
                                            Text("location")
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 13)
                                                        .weight(.semibold)
                                                )
                                                .foregroundColor(Color(red: 0.4, green: 0.35, blue: 0.96))
                                                .frame(height: 18)
                                            RoundedRectangle(cornerRadius: 2)
                                                .foregroundColor(Color(red: 0.4, green: 0.35, blue: 0.96))
                                                .frame(width: 30, height: 3)
                                        }
                                        .frame(width: 70)
                                        .padding(.trailing, 30)
                                    }
                                    Button(action: {
                                        isLocationView = false
                                    })
                                    {
                                        VStack(spacing: 4){
                                            Text("My Archive")
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 13)
                                                        .weight(.semibold)
                                                )
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(Color(red: 0.39, green: 0.45, blue: 0.55))
                                                .frame(height: 18)
                                            RoundedRectangle(cornerRadius: 2)
                                                .foregroundColor(.clear)
                                                .frame(width: 30, height: 3)
                                        }
                                        .frame(width: 70)
                                    }
                                }
                                else {
                                    Button(action: {
                                        isLocationView = true
                                    })
                                    {
                                        VStack(spacing: 4){
                                            Text("location")
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 13)
                                                        .weight(.semibold)
                                                )
                                                .foregroundColor(Color(red: 0.39, green: 0.45, blue: 0.55))
                                                .frame(height: 18)
                                            RoundedRectangle(cornerRadius: 2)
                                                .foregroundColor(.clear)
                                                .frame(width: 30, height: 3)
                                        }
                                        .frame(width: 70)
                                        .padding(.trailing, 30)
                                    }
                                    Button(action: {
                                    })
                                    {
                                        VStack(spacing: 4){
                                            Text("My Archive")
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 13)
                                                        .weight(.semibold)
                                                )
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(Color(red: 0.4, green: 0.35, blue: 0.96))
                                                .frame(height: 18)
                                            RoundedRectangle(cornerRadius: 2)
                                                .foregroundColor(Color(red: 0.4, green: 0.35, blue: 0.96))
                                                .frame(width: 30, height: 3)
                                        }
                                        .frame(width: 70)
                                    }
                                }
                            }
                            .padding(.top, 10)
                            ScrollView {
                                if isLocationView {
                                    VStack {
                                        HStack{
                                            Image(archiveData.imageName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 76, height: 76)
                                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                                .padding(.leading, 7)
                                            VStack(alignment:.leading){
                                                HStack(spacing: 6){
                                                    Image("CafeIcon")
                                                        .resizable()
                                                        .frame(width: 24, height: 24)
                                                    Text(archiveData.name)
                                                        .font(
                                                            Font.custom("Apple SD Gothic Neo", size: 20)
                                                                .weight(.bold)
                                                        )
                                                        .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                                }
                                                .padding(.bottom, 2)
                                                HStack(spacing: 6){
                                                    Image("map")
                                                        .resizable()
                                                        .frame(width:14, height:18)
                                                        .padding(.horizontal,4)
                                                    Text(archiveData.address)
                                                        .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                                }
                                            }
                                            .padding(.leading, 6)
                                            Spacer()
                                        }
                                        .frame(width: 343, height: 88)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                                        .padding(.top, 12)
                                        Image("DummyImage")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 356, height: 356)
                                            .padding(.vertical, 40)
                                    }
                                }
                                else {
                                    VStack {
                                        Text("카페수달🍯💯")
                                            .font(
                                                Font.custom("Apple SD Gothic Neo", size: 22)
                                                    .weight(.semibold)
                                            )
                                            .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.17))
                                            .padding(.top, 20)
                                            .padding(.bottom, 2)
                                        Text("2023.10.21")
                                            .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                            .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                        Divider()
                                            .background(
                                                GeometryReader { geometry in
                                                    Path { path in
                                                        path.addLines([
                                                            .init(x: 0, y: 0),
                                                            .init(x: geometry.size.width, y: 0)
                                                        ])
                                                    }
                                                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                                    .foregroundColor(Color(red: 0.76, green: 0.76, blue: 0.77))
                                                }
                                            )
                                            .padding(.top, 12)
                                        HStack {
                                            Image(systemName: "arrowtriangle.forward.fill")
                                                .foregroundStyle(.white)
                                            Spacer()
                                            Image(systemName: "arrowtriangle.backward.fill")
                                                .foregroundStyle(.white)
                                        }
                                        .padding(.top, 0.5)
                                        .padding(.horizontal, -2)
                                        Spacer()
                                    }
                                    .frame(width: 330, height: 577)
                                    .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .padding(.top, 12)
                                    .padding(.bottom, 40)
                                }
                            }
                            .padding(.top, 24)
                        }
                    )
            }
            .ignoresSafeArea(.all)
            .padding(.top, 106)
            VStack{
                Circle()
                    .frame(width: 106, height: 106)
                    .foregroundStyle(.white)
                    .overlay(
                        Image("profile")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    )
                    .padding(.top, 61)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BasicBackButton(path: $path)
            }
            ToolbarItem(placement: .topBarTrailing) {
                ToolBarView(path: $path)
            }
        }
    }
}
#Preview {
    ArchiveDetailView(path: .constant([]))
}

