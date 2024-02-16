//
//  HomeView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/27/23.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @StateObject var favoritePlaceViewModel = FavoritePlaceViewModel.shared
    @StateObject var homeViewModel = HomeViewModel.shared
    @State var searchText = ""
    @State var path: [PathModel] = []
    @State var isHeartFilled = false
    @State var draw: Bool = false
    @State var placeId: Int = 0
    @State private var isPopupHidden = false
    @State var selectedDayOffIndices: [Holiday] = []
    @State var selectedServiceIndices: [ProvidedService] = []
    
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                VStack {
                    UnevenRoundedRectangle(bottomLeadingRadius: 25, bottomTrailingRadius: 25)
                        .foregroundStyle(.white)
                        .frame(height: 280)
                        .overlay(
                            VStack {
                                UnevenRoundedRectangle(bottomLeadingRadius: 25, bottomTrailingRadius: 25)
                                    .foregroundStyle(Color.accentColor)
                                    .frame(height: 200)
                                    .overlay(
                                        VStack {
                                            HStack {
                                                VStack {
                                                    HStack {
                                                        Text("\(homeViewModel.result.username)")
                                                            .font(
                                                                .custom("Apple SD Gothic Neo", size: 30)
                                                                .weight(.bold)
                                                            )
                                                            .foregroundStyle(Color.white)
                                                        Text("님,")
                                                            .font(
                                                                .custom("Apple SD Gothic Neo", size: 20)
                                                                .weight(.semibold)
                                                            )
                                                            .foregroundStyle(Color.white)
                                                        Spacer()
                                                    }
                                                    HStack {
                                                        Text("오늘도 잘 다녀오셨나요?")
                                                            .font(
                                                                .custom("Apple SD Gothic Neo", size: 20)
                                                                .weight(.semibold)
                                                            )
                                                            .foregroundStyle(Color.white)
                                                        Spacer()
                                                    }
                                                }
                                                .padding(.leading, 30)
                                                .padding(.top, 60)
                                                Spacer()
                                                ToolBarView(path: $path)
                                                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 10, trailing: 20))
                                            }
                                            
                                            
                                            KakaoSearchView(kakaoSearchViewModel: KakaoSearchViewModel(), path: $path, searchText: $searchText)
                                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                        }
                                    )
                                HStack(spacing: 40) {
                                    ViewChangeButton(
                                        path: $path,
                                        destinationView: .favoritePlacesView,
                                        imageName: "FavoriteHeart",
                                        buttonText: "관심장소",
                                        buttonColor: Color(red: 0.96, green: 0.26, blue: 0.21)
                                    )
                                    
                                    ViewChangeButton(
                                        path: $path,
                                        destinationView: .arciveView,
                                        imageName: "ArchiveFlag",
                                        buttonText: "아카이브",
                                        buttonColor: Color(red: 0.4, green: 0.37, blue: 0.70)
                                    )
                                    
                                    ViewChangeButton(
                                        path: $path,
                                        destinationView: .communityView,
                                        imageName: "CommunityArrow",
                                        buttonText: "커뮤니티",
                                        buttonColor: Color(red: 1, green: 0.72, blue: 0.3)
                                    )
                                }
                                .padding(.bottom, 20)
                            }
                        )
                        .zIndex(1)
                        .edgesIgnoringSafeArea(.top)
                        .onAppear {
                            favoritePlaceViewModel.searchMyPlaceList()
                            homeViewModel.getHomeViewInformation()
                        }
                    //MARK: - KakaoMapView
                    KakaoMapView(draw: $draw)
                        .onAppear(perform: {
                            self.draw = true
                        })
                        .onDisappear(perform: {
                            self.draw = false
                        })
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.top, -20)
                }
                VStack {
                    HStack {
                       EmptyView()
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
                            SearchView(kakaoSearchViewModel: KakaoSearchViewModel(), searchText: $searchText, path: $path, isHeartFilled: $isHeartFilled, placeId: $placeId)
                        case .favoritePlacesView:
                            FavoritePlacesView(path: $path, placeId: $placeId, isHeartFilled: $isHeartFilled)
                        case .arciveView:
                            ArchiveView(path: $path)
                        case .newArchiveView:
                            NewArchiveView(path: $path)
                        case .archiveDetailView:
                            ArchiveDetailView(path: $path)
                        case .communityView:
                            CommunityView(path: $path)
                        case .placeInformationEditView:
                            PlaceInformationEditView(path: $path, isHeartFilled: $isHeartFilled, selectedDayOffIndices: $selectedDayOffIndices, selectedServiceIndices: $selectedServiceIndices)
                        case .placeInformationView:
                            PlaceInformationView(myPlaceInformationViewModel: MyPlaceInformationViewModel(), path: $path, isHeartFilled: $isHeartFilled, placeId: $placeId)
                        case .privacyView:
                            PrivacyView(path: $path)
                        case .profileEditView:
                            ProfileEditView(path: $path)
                        }
                    }
                    HStack {
                        VStack {
                            Button(action: {
                                locationManager.fetchUserLocation { location in
                                    if let userLocation = location {
                                        KakaoMapCoordinator.shared.animateCamera(lon: userLocation.coordinate.longitude, lat: userLocation.coordinate.latitude)
                                    }
                                }
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
                        .padding(EdgeInsets(top: 300, leading: 20, bottom: 0, trailing: 0))
                        Spacer()
                    }
                    Spacer()
                    
                    //MARK: - 팝업 메시지 디자이너 수정 필요
                    ZStack {
                        if !isPopupHidden {
                            RoundedRectangle(cornerRadius: 60)
                                .foregroundStyle(Color.white)
                                .frame(width: 300, height: 100)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .overlay(
                                    ZStack {
                                        VStack(spacing: 0) {
                                            HStack(spacing: 0) {
                                                Text("고즈넉한 분위기에서\n서촌을 즐기는 법☕️")
                                                    .font(
                                                        .custom("Apple SD Gothic Neo", size: 18)
                                                    )
                                                Image(systemName: "chevron.right")
                                                    .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 12, height: 12)
                                                    .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                                    .bold()
                                                    .padding(EdgeInsets(top: 21, leading: 5, bottom: 3, trailing: 0))
                                            }
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
    let buttonText: String
    let buttonColor: Color
    
    var body: some View {
        Button(action: {
            path.append(destinationView)
        }) {
            Circle()
                .fill(Color(red: 0.93, green: 0.93, blue: 1))
                .frame(width: 70, height: 70)
                .shadow(color: Color(red: 0.68, green: 0.65, blue: 0.65).opacity(0.1), radius: 2, x: 0, y: 7)
                .shadow(color: Color(red: 0.68, green: 0.65, blue: 0.65).opacity(0.1), radius: 1.5, x: 0, y: 3)
                .overlay(
                    VStack {
                        Image(imageName)
                            .frame(width: 20, height: 20)
                        Text(buttonText)
                            .font(
                                .custom("Apple SD Gothic Neo", size: 12)
                            )
                            .foregroundStyle(buttonColor)
                    }
                )
        }
    }
}
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var userLocation: CLLocation?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func fetchUserLocation(completion: @escaping (CLLocation?) -> Void) {
        if let location = self.userLocation {
            completion(location)
        } else {
            // 위치를 가져올 수 없을 때 처리
            completion(nil)
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.userLocation = location
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error fetching user location: \(error.localizedDescription)")
    }
}


#Preview {
    HomeView()
}
