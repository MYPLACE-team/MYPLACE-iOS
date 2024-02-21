//
//  HomeView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/27/23.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @ObservedObject var myPlaceInformationViewModel = MyPlaceInformationViewModel.shared
    @StateObject var myPlaceListViewModel = MyPlaceListViewModel.shared
    @StateObject var favoritePlaceViewModel = FavoritePlaceViewModel.shared
    @StateObject var homeViewModel = HomeViewModel.shared
    @StateObject private var toastViewModel = ToastViewModel()
    
    @State var searchText = ""
    @State var path: [PathModel] = []
    @State var isHeartFilled = false
    @State var draw: Bool = false
    @State var placeId: Int = 0
    
    @State private var isShowBottomSheet = false
    @State private var isPopuptoggle = true
    @State private var isCouponIssued = false
    
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
                                    .foregroundStyle(Color.mpPurple)
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
                                            
                                            KakaoSearchView(path: $path, searchText: $searchText)
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
                            SearchView(searchText: $searchText, path: $path, isHeartFilled: $isHeartFilled, placeId: $placeId)
                        case .favoritePlacesView:
                            FavoritePlacesView(path: $path, placeId: $placeId, isHeartFilled: $isHeartFilled)
                        case .arciveView:
                            ArchiveView(path: $path)
                        case .archivePlaceSearchView:
                            ArchivePlaceSearchView(path: $path)
                        case .newArchiveView:
                            NewArchiveView(path: $path)
                        case .archiveEditView:
                            ArchiveEditView(path: $path)
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
                        case .servicePolicyView:
                            ServicePolicyView(path: $path)
                        case .privacyPolicyView:
                            PrivacyPolicyView(path: $path)
                        case .locationPolicyView:
                            LocationPolicyView(path: $path)
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
                    
                    //MARK: - BottomSheet
                    ZStack {
                        if isPopuptoggle {
                            Button(action: {
                                isShowBottomSheet.toggle()
                            }) {
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
                                                        .foregroundStyle(.black)
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
                                                isPopuptoggle.toggle()
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
                                    .sheet(isPresented: $isShowBottomSheet) {
                                        ScrollView {
                                            Image("HomePopupImage")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 360, height: 300)
                                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                                .overlay(
                                                    VStack {
                                                        HStack {
                                                            Spacer()
                                                            Text("고즈넉한 분위기에서\n서촌 즐기는 법")
                                                                .font(
                                                                    Font.custom("Apple SD Gothic Neo", size: 20)
                                                                        .weight(.heavy)
                                                                )
                                                                .foregroundStyle(Color(red: 0.2, green: 0.2, blue: 0.2))
                                                                .lineSpacing(1)
                                                                .multilineTextAlignment(.leading)
                                                                .padding(.trailing, 15)
                                                        }
                                                        .padding(.top, 10)
                                                        Spacer()
                                                        ZStack {
                                                            Rectangle()
                                                                .foregroundStyle(.clear)
                                                                .background(BackgroundBlurView())
                                                                .frame(height: 60)
                                                                .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 30, bottomTrailingRadius: 30))
                                                                .overlay(
                                                                    VStack(spacing: 4) {
                                                                        HStack {
                                                                            Text("☕️ 도틀")
                                                                                .font(
                                                                                    .custom("Apple SD Gothic Neo", size: 20)
                                                                                    .weight(.semibold)
                                                                                )
                                                                                .padding(.leading, 10)
                                                                            Spacer()
                                                                            
                                                                            Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                                                                                .foregroundStyle(isHeartFilled ? .red : .white)
                                                                                .onTapGesture {
                                                                                    if isHeartFilled {
                                                                                        MyPlaceManager.shared.deleteFavoritePlace(placeId: placeId) { error in
                                                                                            if error != nil {
                                                                                                print("error in deleteFavoritePlace")
                                                                                            }
                                                                                            else {
                                                                                                withAnimation {
                                                                                                    isHeartFilled.toggle()
                                                                                                }
                                                                                                print("success in deleteFavoritePlace")
                                                                                            }
                                                                                        }
                                                                                        let toastMessage = "관심 장소 저장이 해제되었습니다."
                                                                                        toastViewModel.showToastWithString(text: toastMessage)
                                                                                    }
                                                                                    else {
                                                                                        MyPlaceManager.shared.registerFavoritePlace(placeId: placeId) { error in
                                                                                            if error != nil {
                                                                                                print("error in registerFavoritePlace")
                                                                                            } else {
                                                                                                withAnimation {
                                                                                                    isHeartFilled.toggle()
                                                                                                }
                                                                                                print("success in registerFavoritePlace")
                                                                                            }
                                                                                        }
                                                                                        let toastMessage = "관심 장소로 저장되었습니다."
                                                                                        toastViewModel.showToastWithString(text: toastMessage)
                                                                                    }
                                                                                    myPlaceListViewModel.getMyPlaceList(keyword: myPlaceInformationViewModel.result.name)
                                                                                }
                                                                                .padding(.trailing, 10)
                                                                        }
                                                                        HStack(spacing: 0) {
                                                                            Image("Map2")
                                                                            Text(" 서울시 종로구 필운대로 25-2 1층")
                                                                                .font(
                                                                                    .custom("Apple SD Gothic Neo", size: 16)
                                                                                    .weight(.regular)
                                                                                )
                                                                            Spacer()
                                                                        }
                                                                        .padding(.leading, 13)
                                                                    }
                                                                        .foregroundStyle(.white)
                                                                        .font(
                                                                            .custom("Apple SD Gothic Neo", size: 20)
                                                                            .weight(.semibold)
                                                                        )
                                                                        .padding(.leading, 10)
                                                                )
                                                        }
                                                    }
                                                        .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
                                                )
                                                .padding(.top, 15)
                                            HStack(spacing: 25) {
                                                customTextRoundedRec(text: "#한옥")
                                                    .padding(.leading, 40)
                                                customTextRoundedRec(text: "#카페")
                                                customTextRoundedRec(text: "#흑임자라떼")
                                                Spacer()
                                            }
                                            .padding(.top, 10)
                                            HStack {
                                                Text("구수한 맛의 \n흑임자 라떼가 예술!")
                                                    .font(
                                                        Font.custom("Apple SD Gothic Neo", size: 20)
                                                            .weight(.bold)
                                                    )
                                                    .multilineTextAlignment(.leading)
                                                    .foregroundStyle(Color(red: 0.55, green: 0.42, blue: 0.26))
                                                    .padding(.top, 10)
                                                    .padding(.leading, 30)
                                                Spacer()
                                            }
                                            
                                            Text("고향의 오랜 시골집에 초대를 받은 느낌입니다. 이 곳의 \n뒷편에는 커다란 도토리 나무가 있을 것만 같은데요. \n이 공간의 이름은 ‘도틀’입니다. 도틀은 전라도에서 도토리를 부르는 방언인데요. 어감이 참 귀엽습니다. 그래서 그런지 공간을 채우는 오브제들도 도토리를 닮았습니다. \n\n커피를 먹을까 하다가 흑임자 라떼를 주문했습니다. 음료 위에 뿌려진 흑임자 가루가 아주 향긋했습니다. 어디서도 맡아 보지 못한 진한 참기름 짠 향이 났습니다. 이렇게 \n고소하고 찐한 흑임자라떼는 처음이었습니다. 음료와 함께 내어주시는 사장님의 다람쥐 - 도토리 스토리를 읽고 \n있으니 아주 고즈넉한 기분이 절로 납니다. \n")
                                                .font(
                                                    Font.custom("Apple SD Gothic Neo", size: 15)
                                                        .weight(.thin)
                                                )
                                                .multilineTextAlignment(.leading)
                                                .foregroundStyle(.black)
                                                .frame(width: 337, height: 287)
                                                .padding(.top, -10)
                                            
                                            HStack(spacing: 0) {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(isCouponIssued ? Color(red: 0.77, green: 0.77, blue: 0.77) : Color(red: 0.89, green: 0.89, blue: 0.99))
                                                    .frame(width: 240, height: 40)
                                                    .overlay(
                                                        HStack {
                                                            Image(systemName: "ticket.fill")
                                                                .foregroundStyle(Color.accentColor)
                                                                .frame(width: 20, height: 20)
                                                            VStack(spacing: 0) {
                                                                Text(isCouponIssued ? "쿠폰 발급이 완료되었어요." : "2,000원 할인 쿠폰 받기")
                                                                    .font(
                                                                        Font.custom("Apple SD Gothic Neo", size: 14)
                                                                            .weight(.bold)
                                                                    )
                                                                    .multilineTextAlignment(.center)
                                                                    .foregroundStyle(Color.accentColor)
                                                                Text("2024.02.20-2024.02.24")
                                                                    .font(
                                                                        Font.custom("Apple SD Gothic Neo", size: 11)
                                                                            .weight(.medium)
                                                                    )
                                                                    .multilineTextAlignment(.center)
                                                                    .foregroundStyle(Color.accentColor)
                                                            }
                                                            
                                                        }
                                                    )
                                                VerticalDottedDivider()
                                                    .frame(height: 25)
                                                Button(action: {
                                                    isCouponIssued = true
                                                }) {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .foregroundStyle(isCouponIssued ? Color(red: 0.77, green: 0.77, blue: 0.77) : Color(red: 0.89, green: 0.89, blue: 0.99))
                                                        .frame(width: 60, height: 40)
                                                        .overlay(
                                                            Image(systemName: isCouponIssued ? "checkmark.circle.fill" : "arrowshape.down.circle.fill")
                                                                .resizable()
                                                                .frame(width: 22, height: 22)
                                                                .foregroundStyle(Color.accentColor)
                                                        )
                                                }
                                            }
                                            .disabled(isCouponIssued)
                                            .padding(.top, -30)
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(Color(red: 0.89, green: 0.87, blue: 0.92))
                                                .frame(height: 240)
                                                .overlay(
                                                    VStack(spacing: 30) {
                                                        HStack {
                                                            HStack {
                                                                Text("추천메뉴")
                                                                    .font(
                                                                        Font.custom("Apple SD Gothic Neo", size: 16)
                                                                            .weight(.medium)
                                                                    )
                                                                    .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                                                    Spacer()
                                                            }
                                                            .frame(width: 80)
                                                            VStack(alignment: .leading, spacing: 0) {
                                                                Text("· 흑임자 크림 커피 (6,500원)")
                                                                Text("· 누하과 (3,900원)")
                                                            }
                                                            .font(
                                                                Font.custom("Apple SD Gothic Neo", size: 12)
                                                                    .weight(.thin)
                                                            )
                                                            .foregroundStyle(.black)
                                                            .padding(.leading, 20)
                                                            Spacer()
                                                        }
                                                        HStack {
                                                            HStack {
                                                                Text("제공서비스")
                                                                    .font(
                                                                        Font.custom("Apple SD Gothic Neo", size: 16)
                                                                            .weight(.medium)
                                                                    )
                                                                    .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                                                Spacer()
                                                            }
                                                                .frame(width: 80)
                                                            HStack(spacing: 25) {
                                                                customTextRoundedRec(text: "☺️ 친절한 서비스")
                                                                customTextRoundedRec(text: "💐 좋은 분위기")
                                                            }
                                                            .padding(.leading, 30)
                                                            Spacer()
                                                        }
                                                        HStack {
                                                            HStack {
                                                                Text("영업시간")
                                                                    .font(
                                                                        Font.custom("Apple SD Gothic Neo", size: 16)
                                                                            .weight(.medium)
                                                                    )
                                                                    .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                                                Spacer()
                                                            }
                                                                .frame(width: 80)
                                                            VStack(alignment: .leading, spacing: 0) {
                                                                Text("· 화~금 10:00 - 20:00")
                                                                Text("· 토,일 11:00 - 20:00")
                                                            }
                                                            .font(
                                                                Font.custom("Apple SD Gothic Neo", size: 12)
                                                                    .weight(.thin)
                                                            )
                                                            .foregroundStyle(.black)
                                                            .padding(.leading, 20)
                                                            Spacer()
                                                        }
                                                        HStack {
                                                            HStack {
                                                                Text("인스타그램")
                                                                    .font(
                                                                        Font.custom("Apple SD Gothic Neo", size: 16)
                                                                            .weight(.medium)
                                                                    )
                                                                    .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                                                                Spacer()
                                                            }
                                                                .frame(width: 80)
                                                            VStack(spacing: 0) {
                                                                HStack {
                                                                    Button(action: {
                                                                        openInstagram(username: myPlaceInformationViewModel.result.insta)
                                                                    }, label: {
                                                                        Image("Earth")
                                                                            .resizable()
                                                                            .frame(width: 20, height: 20)
                                                                    })
                                                                    Spacer()
                                                                }
//
                                                            }
                                                            .font(
                                                                Font.custom("Apple SD Gothic Neo", size: 12)
                                                                    .weight(.thin)
                                                            )
                                                            .foregroundStyle(.black)
                                                            .padding(.leading, 20)
                                                            Spacer()
                                                        }
                                                    }
                                                        .padding(.leading, 20)
                                                )
                                                .presentationDetents([.medium, .large])
                                        }
                                        .background(Color(red: 0.97, green: 0.95, blue: 1))
                                        .padding(.bottom, 20)
                                    }
                                    .padding(.bottom, 20)
                            }
                        }
                        
                    }
                }
            }
            .ignoresSafeArea(.all)
        }
    }
    
    func openInstagram(username: String) {
        let instagramUrl = URL(string: "instagram://user?username=\(username)")!
        if UIApplication.shared.canOpenURL(instagramUrl) {
            UIApplication.shared.open(instagramUrl, options: [:], completionHandler: nil)
        } else {
            let webUrl = URL(string: "https://www.instagram.com/\(username)/")!
            UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
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

struct VerticalDottedDivider: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 0, y: geometry.size.height))
            }
            .stroke(style: StrokeStyle(lineWidth: 0.7, dash: [2, 2]))
            .foregroundStyle(.black)
        }
        .frame(width: 1)
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
