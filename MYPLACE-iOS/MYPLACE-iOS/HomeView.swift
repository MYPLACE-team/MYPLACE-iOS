//
//  HomeView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/27/23.
//

import SwiftUI
import KakaoMapsSDK
import KakaoMapsSDK_SPM

struct HomeView: View {
    @StateObject var kakaoSearchViewModel = KakaoSearchViewModel()
    @State var searchText = ""
    @State var path: [PathModel] = []
    @State var isHeartFilled = false
    @State var draw: Bool = false
    @State private var isPopupHidden = false
    @State var selectedDayOffIndices: [Holiday] = []
    @State var selectedServiceIndices: [ProvidedService] = []

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                HStack {
                    //MARK: - UserName 필요, 세부적인 디자인 필요
                    Text("라일락")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 30)
                            .weight(.bold)
                        )
                        .foregroundStyle(Color(red: 0.39, green: 0.37, blue: 0.6))
                        .padding(.leading, 20)
                    Text("님,")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 20)
                        )
                        .padding(.top, 10)
                    Spacer()
                    VStack {
                        ToolBarView(path: $path)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                    }
                }
                HStack {
                    Text("오늘도 잘 다녀오셨나요?")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 20)
                        )
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    Spacer()
                }
            }
            ZStack {
                //MARK: - KakaoMapView
                KakaoMapView(draw: $draw).onAppear(perform: {
                    self.draw = true
                }).onDisappear(perform: {
                    self.draw = false
                }).frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {
                    //MARK: - kakaoSearchView
                    KakaoSearchView(kakaoSearchViewModel: KakaoSearchViewModel(), path: $path, searchText: $searchText)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                    
                    HStack {
                        ViewChangeButton(
                            path: $path,
                            destinationView: .favoritePlacesView,
                            imageName: "Vector",
                            imageSize: CGSize(width: 11, height: 14),
                            buttonText: "관심장소",
                            buttonColor: Color(red: 0.96, green: 0.26, blue: 0.21)
                        )
                        .padding(.leading, 20)
                        
                        Spacer()
                        
                        ViewChangeButton(
                            path: $path,
                            destinationView: .arciveView,
                            imageName: "GreenPlus",
                            imageSize: CGSize(width: 14, height: 14),
                            buttonText: "아카이브",
                            buttonColor: Color(red: 0.3, green: 0.69, blue: 0.31))
                        
                        Spacer()
                        
                        ViewChangeButton(
                            path: $path,
                            destinationView: .communityView,
                            imageName: "Community",
                            imageSize: CGSize(width: 15, height: 15),
                            buttonText: "커뮤니티",
                            buttonColor: Color(red: 1, green: 0.72, blue: 0.3)
                        )
                        .padding(.trailing, 20)
                    }
                    .navigationDestination(for: PathModel.self) { pathModel in
                        switch pathModel {
                        case .settingView:
                            SettingView(path: $path)
                        case .notificationView:
                            NotificationView(path: $path)
                        case .notificationSettingView:
                            NotificationSettingView(path: $path)
                        case .searchView:
                            SearchView(kakaoSearchViewModel: KakaoSearchViewModel(), searchText: $searchText, path: $path, isHeartFilled: $isHeartFilled)
                        case .favoritePlacesView:
                            FavoritePlacesView(path: $path)
                        case .arciveView:
                            ArchiveView(path: $path)
                        case .newArchiveView:
                            NewArchiveView(path: $path)
                        case .archiveDetailView:
                            ArchiveDetailView(path: $path)
                        case .communityView:
                            CommunityView()
                        case .placeInformationEditView:
                            PlaceInformationEditView(path: $path, isHeartFilled: $isHeartFilled, selectedDayOffIndices: $selectedDayOffIndices, selectedServiceIndices: $selectedServiceIndices)
                        case .placeInformationView:
                            PlaceInformationView(path: $path, isHeartFilled: $isHeartFilled)
                        case .privacyView:
                            PrivacyView(path: $path)
                        case .profileEditView:
                            ProfileEditView(path: $path)
                        }
                    }
                    .padding(.top, 10)
                    
                    HStack {
                        VStack {
                            Button(action: {
                                //MARK: - 카카오맵 기능 추가 필요
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
                        if !isPopupHidden {
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
                                                    .font(
                                                        .custom("Apple SD Gothic Neo", size: 22)
                                                        .weight(.semibold)
                                                    )
                                                Text(" 증정!")
                                                    .font(.system(size: 20))
                                                Image(systemName: "chevron.right")
                                                    .resizable()
                                                    .frame(width: 5, height: 8)
                                                    .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                                    .bold()
                                                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 3, trailing: 0))
                                            }
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
                                            isPopupHidden = true
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
                                .padding(.bottom, 20)
                        }
                    }
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}

// MARK: - ViewChangeButton
struct ViewChangeButton<ViewModel: Hashable>: View {
    @Binding var path: [ViewModel]
    let destinationView: ViewModel
    let imageName: String
    let imageSize: CGSize
    let buttonText: String
    let buttonColor: Color
    
    var body: some View {
        Button(action: {
            path.append(destinationView)
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
