//
//  ArchiveView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/28/23.
//

import SwiftUI

struct ArchiveView: View {
    @State var searchItem: String = ""
    @State var searchItemList: [String] = []
    @Binding var path: [PathModel]
    var body: some View {
        ZStack {
            Color("MPLightPurple")
                .ignoresSafeArea(.all)
                .padding(.top, 50)
            VStack {
                UnevenRoundedRectangle(bottomLeadingRadius: 20, bottomTrailingRadius: 20)
                    .fill(.white)
                    .frame(height: 300)
                    .overlay(
                        VStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundStyle(.gray)
                                .overlay(
                                    Image("profile")
                                )
                                .padding(.top, 20)
                            HStack {
                                Text("라일락")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 25)
                                            .weight(.semibold)
                                    )
                                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 30, height: 14)
                                    .foregroundStyle(Color(red: 0.68, green: 0.65, blue: 1))
                                    .overlay(
                                        Text("Lv.0")
                                            .font(Font.custom("Apple SD Gothic Neo", size: 9))
                                            .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
                                            .bold()
                                            .padding([.top, .leading], 1)
                                    )
                            }
                            .frame(height: 25)
                            .padding(.top, 12)
                            HStack(spacing: 0) {
                                Text("이번 달 ")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 23)
                                            .weight(.medium)
                                    )
                                    .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                Text("10곳 달성 ")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 23)
                                            .weight(.medium)
                                    )
                                    .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                                    .background(
                                        VStack{
                                            Spacer()
                                            Rectangle()
                                                .frame(height: 10)
                                                .foregroundStyle(Color(red: 0.76, green: 0.74, blue: 1).opacity(0.6))
                                        }
                                    )
                            }
                            .frame(height: 25)
                            Button(action: {
                                
                            }){
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 96, height: 28, alignment: .center)
                                    .foregroundStyle(Color(red: 0, green: 0.48, blue: 1))
                                    .overlay(
                                        HStack(spacing: 6) {
                                            Text("새 아카이브")
                                                .font(Font.custom("Apple SD Gothic Neo", size: 14)
                                                    .weight(.medium))
                                                .foregroundStyle(.white)
                                                .padding(.top, 2)
                                            Image(systemName: "chevron.right")
                                                .resizable()
                                                .frame(width: 4, height: 8)
                                                .bold()
                                                .foregroundStyle(.white)
                                        }
                                    )
                            }
                            .padding(.top, 20)
                            Spacer()
                            HStack(spacing: 30){
                                VStack(spacing: 10){
                                    Text("전체 보기")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 16)
                                                .weight(.bold)
                                        )
                                        .foregroundStyle(Color(red: 0.45, green: 0.42, blue: 0.82))
                                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, topTrailing: 10))
                                        .frame(width: 156, height: 4)
                                        .foregroundStyle(Color(red: 0.32, green: 0.28, blue: 0.77).opacity(0.8))
                                }
                                VStack(spacing: 10){
                                    Text("폴더 보기")
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 16)
                                                .weight(.semibold)
                                        )
                                        .foregroundStyle(Color(red: 0.79, green: 0.8, blue: 0.82))
                                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, topTrailing: 10))
                                        .frame(width: 156, height: 4)
                                        .foregroundStyle(.clear)
                                }
                            }
                            .padding(.top, 10)
                        }
                    )
                HStack(spacing: 8){
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 53, height: 20, alignment: .center)
                        .foregroundStyle(Color(red: 0.03, green: 0.25, blue: 0.83))
                        .overlay(
                            Text("태그명")
                                .font(Font.custom("Apple SD Gothic Neo", size: 14)
                                    .weight(.medium))
                                .foregroundStyle(.white)
                        )
                    if searchItemList.count > 0 {
                        ForEach(searchItemList.indices, id: \.self) { index in
                            HStack(spacing: 3){
                                Text(searchItemList[index])
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 14)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(Color(red: 0.43, green: 0.25, blue: 0.89))
                                    .padding(.top, 2)
                                Button(action: {
                                    searchItemList.remove(at: index)
                                }) {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                        .foregroundStyle(.gray)
                                        .bold()
                                }
                            }
                            .padding(.horizontal, 5.0)
                            .frame(height: 20)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                            .shadow(color: .gray.opacity(0.3),radius: 4)
                        }
                    }
                    if searchItemList.count < 3 {
                        TextField("검색하기", text: $searchItem)
                        .submitLabel(.done)
                        .onSubmit {
                            searchItemList.append(searchItem)
                            searchItem = ""
                        }
                        .autocapitalization(.none)
                        .foregroundStyle(.clear)
                    }
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(.gray)
                }
                .frame(width: 344, height: 32)
                .padding(.horizontal, 8)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .padding(.top, 16)
                HStack(spacing: 6){
                    Spacer()
                    Text("총")
                        .font(Font.custom("Apple SD Gothic Neo", size: 14))
                    Text("30")
                        .font(Font.custom("Apple SD Gothic Neo", size: 18).weight(.semibold))
                    Text("건")
                        .font(Font.custom("Apple SD Gothic Neo", size: 14))
                        .padding(.trailing, 36)
                }
                .foregroundStyle(Color(red: 0.27, green: 0.3, blue: 0.33))
                .padding(.top, 6)
                ScrollView {
                    VStack{
                        
                    }
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BasicBackButton(path: $path)
            }
            
            ToolbarItem(placement: .principal) {
                HStack {
                    Image("ArchiveBook")
                    Text("아카이브")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 30)
                            .weight(.semibold)
                        )
                }
                .foregroundStyle(.black)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                ToolBarView(path: $path)
            }
        }
        
    }
}



#Preview {
    ArchiveView(path: .constant([]))
}

