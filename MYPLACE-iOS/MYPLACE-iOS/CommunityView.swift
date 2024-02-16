//
//  CommunityView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/28/23.
//

import SwiftUI

struct CommunityView: View {
    @Binding var path: [PathModel]
    @State private var searchText: String = ""
    @State private var isLatestSelected: String = "인기순"
    @State private var isScrapSelected: Bool = false
    @State private var isTextClicked: Bool = false
    var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color(red: 0.97, green: 0.97, blue: 0.98))
                .frame(height: 40)
                .overlay(
                    HStack {
                        TextField("지역, 장소명 입력하기", text: $searchText)
                            .font(
                                .custom("Apple SD Gothic Neo", size: 15)
                                .weight(.semibold)
                            )
                            .foregroundStyle(.gray)
                            .padding(.leading, 15)
                        Button(action: {
                            
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                )
                .padding(.top, 10)
                .padding(.horizontal, 20)
        HStack {
            Button(action: {
                isLatestSelected = "인기순"
                //                favoritePostBodyViewModel.sort = 2000
                //                favoritePlaceViewModel.searchMyPlaceList()
            }) {
                Text("인기순")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 14)
                            .weight(.semibold)
                    )
                    .foregroundStyle(isLatestSelected == "인기순" ? Color.accentColor : Color(red: 0.62, green: 0.64, blue: 0.67))
            }
            .padding(.leading, 20)
            Button(action: {
                isLatestSelected = "최신순"
                //                favoritePostBodyViewModel.sort = 2001
                //                favoritePlaceViewModel.searchMyPlaceList()
            }) {
                Text("최신순")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 14)
                            .weight(.semibold)
                    )
                    .foregroundStyle(isLatestSelected == "최신순" ? Color.accentColor : Color(red: 0.62, green: 0.64, blue: 0.67))
            }
            Spacer()
            HStack(spacing: 25) {
                customTextRoundedRecClikable(text: "종로구", isClicked: isTextClicked)
                customTextRoundedRecClikable(text: "송파구", isClicked: isTextClicked)
                customTextRoundedRecClikable(text: "마포구", isClicked: isTextClicked)
                customTextRoundedRecClikable(text: "강남구", isClicked: isTextClicked)
            }
            .fontWeight(.bold)
            Spacer()
            Image(isScrapSelected ? "CommunityScrap2" : "CommunityScrap")
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 20, height: 20)
                   .onTapGesture {
                       withAnimation {
                           isScrapSelected.toggle()
                       }
                   }
                   .padding(.trailing, 20)
               
        }
        .padding(.top, 5)
        ScrollView {
            communityContent(userProfileImage: "MyPlaceLogo", username: "minjae", date: "2023.10.21", location: "강남구", image: "DummyImage2", imageTag: "🍷와인바", tags: ["#와인", "#양식", "수서역"], scrapCount: "122")
                .padding(.top, 10)
            EmptyView()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        BasicBackButton(path: $path)
                    }
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("커뮤니티")
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 20)
                                    .weight(.semibold)
                                )
                        }
                        .foregroundStyle(.black)
                        .padding(.top, 5)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        ToolBarView(path: $path)
                    }
                }
        }
    }
    
    func customTextRoundedRec(text: String) -> some View {
        Text(text)
            .font(
                .custom("Apple SD Gothic Neo", size: 13)
                .weight(.regular)
            )
            .foregroundStyle(Color.accentColor)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .foregroundStyle(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color.white)
                            .stroke(Color.accentColor, lineWidth: 1.3)
                            .padding(EdgeInsets(top: -5, leading: -10, bottom: -4, trailing: -10))
                    )
            )
    }
    
    func customTextRoundedRecClikable(text: String, isClicked: Bool) -> some View {
        Text(text)
            .font(
                .custom("Apple SD Gothic Neo", size: 13)
                .weight(.regular)
            )
            .foregroundStyle(isClicked ? .white : Color.accentColor)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .foregroundStyle(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(isClicked ? Color.accentColor: .white)
                            .stroke(Color.accentColor, lineWidth: 1.3)
                            .padding(EdgeInsets(top: -5, leading: -10, bottom: -4, trailing: -10))
                    )
            )
            .onTapGesture {
                withAnimation {
                    isTextClicked.toggle()
                }
            }
    }

    func communityContent(userProfileImage: String, username: String, date: String, location: String, image: String, imageTag: String, tags: [String], scrapCount: String) -> some View {
        RoundedRectangle(cornerRadius: 40)
            .foregroundStyle(Color(red: 0.91, green: 0.9, blue: 1.0))
            .frame(width: 370, height: 365)
            .overlay(
                VStack {
                    HStack {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.white)
                            .overlay(
                                Image(userProfileImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                            )
                            .padding(.leading, 10)
                        VStack(alignment: .leading) {
                            Text(username)
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 17)
                                        .weight(.bold)
                                )
                                .foregroundStyle(.black)
                            Text(date)
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 17)
                                        .weight(.semibold)
                                )
                                .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        }
                        Spacer()
                        customTextRoundedRec(text: location)
                            .padding(.trailing, 30)
                    }
                    .padding(.top, 10)
                    
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .overlay(
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text(imageTag)
                                        .font(
                                            .custom("Apple SD Gothic Neo", size: 13)
                                            .weight(.semibold)
                                        )
                                        .foregroundStyle(.white)
                                        .background(
                                            RoundedRectangle(cornerRadius: 40)
                                                .foregroundStyle(Color.accentColor)
                                                .padding(EdgeInsets(top: -7, leading: -10, bottom: -6, trailing: -10))
                                        )
                                        .padding(.trailing, 20)
                                }
                                HStack(alignment: .center, spacing: 0) {
                                    Image("CommunityScrap")
                                        .padding(.leading, 20)
                                    Text(scrapCount)
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 17)
                                                .weight(.bold)
                                        )
                                        .foregroundStyle(Color(red: 0.89, green: 0.89, blue: 0.89))
                                        .padding(.leading, 5)
                                    Spacer()
                                    Image(systemName: "paperplane.fill")
                                        .foregroundStyle(Color(red: 0.89, green: 0.89, blue: 0.89))
                                        .padding(.trailing, 20)
                                }
                                .frame(width: 350, height: 40)
                                .background(BackgroundBlurView())
                                .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 30, bottomTrailingRadius: 30))
                            }
                        )
                    
                    HStack(spacing: 30) {
                        ForEach(tags, id: \.self) { tag in
                            customTextRoundedRec(text: tag)
                        }
                        Spacer()
                    }
                    .padding(.top, 10)
                    .padding(.leading, 30)
                    
                    Spacer()
                }
            )
    }
}

#Preview {
    CommunityView(path: .constant([]))
}
