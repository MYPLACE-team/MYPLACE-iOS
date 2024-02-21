//
//  PlaceInformationView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/5/24.
//

import SwiftUI

struct PlaceInformationView: View {
    @ObservedObject var myPlaceInformationViewModel: MyPlaceInformationViewModel
    @StateObject var myPlaceListViewModel = MyPlaceListViewModel.shared
    @Binding var path: [PathModel]
    @State private var currentPage = 0
    @Binding var isHeartFilled: Bool
    @State private var userInputHeader: String = ""
    @State private var userInputContent: String = ""
    @Binding var placeId: Int
    @State private var selectedTab: String = "상세정보"
    
    @StateObject private var toastViewModel = ToastViewModel()
    
    let imageHeight = CGFloat(440)
    @State var emoji: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    //MARK: - 이미지 이동하려는 순간 살짝 아래로 내려와서 위에 여백 생김
                    TabView(selection: $currentPage) {
                        ForEach(myPlaceInformationViewModel.result.images, id: \.self) { urlString in
                            AsyncImage(url: URL(string: urlString)) { phase in
                                  switch phase {
                                  case .success(let image):
                                      image
                                          .resizable()
                                          .aspectRatio(contentMode: .fit)
                                          // 원하는 다른 작업 수행
                                  case .failure(_):
                                      Image("DummyImage2")
                                          .resizable()
                                          .aspectRatio(contentMode: .fit)
                                          // 실패 시 처리
                                  case .empty:
                                      ProgressView()
                                          .progressViewStyle(CircularProgressViewStyle())
                                  @unknown default:
                                      fatalError()
                                  }
                              }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(height: imageHeight)
                    VStack {
                        Spacer()
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .background(BackgroundBlurView())
                                .frame(height: 80)
                                .overlay(
                                    VStack(spacing: 4) {
                                        HStack {
                                            Text(PlaceType.emojiForCategory(from: myPlaceInformationViewModel.result.categoryID) + " " + myPlaceInformationViewModel.result.name)
                                                .font(
                                                    .custom("Apple SD Gothic Neo", size: 25)
                                                    .weight(.semibold)
                                                )
                                            Spacer()
                                            
                                            Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                                                .foregroundStyle(isHeartFilled ? .red : .gray)
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
                                                    print("!!\(myPlaceInformationViewModel.result.name)")
                                                    myPlaceListViewModel.getMyPlaceList(keyword: myPlaceInformationViewModel.result.name)
                                                }
                                                .padding(.trailing, 10)
                                        }
                                        
                                        HStack(spacing: 0) {
                                            Image("Map2")
                                            Text(myPlaceInformationViewModel.result.address)
                                                .font(
                                                    .custom("Apple SD Gothic Neo", size: 18)
                                                    .weight(.semibold)
                                                )
                                                .padding(.leading, 5)
                                            Spacer()
                                        }
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
                    .frame(height: imageHeight)
                }
                
                if !myPlaceInformationViewModel.result.hashtag.isEmpty {
                    HStack(alignment: .center, spacing: 10) {
                        ForEach(myPlaceInformationViewModel.result.hashtag, id: \.self) { hashtag in
                            Text(hashtag)
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 15)
                                    .weight(.semibold)
                                )
                                .foregroundStyle(Color(red: 0.49, green: 0.47, blue: 0.75))
                                .background(
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundStyle(.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 40)
                                                .stroke(Color.accentColor, lineWidth: 1)
                                                .padding(EdgeInsets(top: -5, leading: -10, bottom: -4, trailing: -10))
                                        )
                                )
                                .padding([.leading, .trailing], 10)
                        }
                        Spacer()
                    }
                    .frame(height: 35)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    VStack(spacing: 0) {
                        Rectangle()
                            .foregroundStyle(.clear)
                            .frame(height: 1)
                            .background(Color(red: 0.81, green: 0.81, blue: 0.81).opacity(0.8))
                            .shadow(color: Color(red: 0.55, green: 0.54, blue: 0.54).opacity(0.1), radius: 0.5, x: 0, y: 1)
                            .shadow(color: Color(red: 0.55, green: 0.54, blue: 0.54).opacity(0.09), radius: 1.5, x: 0, y: 3)
                            .shadow(color: Color(red: 0.55, green: 0.54, blue: 0.54).opacity(0.05), radius: 1.5, x: 0, y: 6)
                            .shadow(color: Color(red: 0.55, green: 0.54, blue: 0.54).opacity(0.01), radius: 2, x: 0, y: 10)
                            .shadow(color: Color(red: 0.55, green: 0.54, blue: 0.54).opacity(0), radius: 2.5, x: 0, y: 16)
                        Rectangle()
                            .foregroundStyle(Color(red: 0.93, green: 0.93, blue: 0.93))
                            .frame(height: 8)
                    }
                }
                
                HStack {
                    VStack(spacing: 10){
                        Spacer()
                        Text("상세정보")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 14)
                                    .weight(.semibold)
                            )
                            .foregroundStyle(selectedTab == "상세정보" ? Color.accentColor : Color(red: 0.39, green: 0.45, blue: 0.55))
                        
                        UnevenRoundedRectangle(topLeadingRadius: 10, topTrailingRadius: 10)
                            .frame(width: 120, height: 3)
                            .foregroundStyle(selectedTab == "상세정보" ? Color.accentColor : .clear)
                    }
                    .onTapGesture {
                        withAnimation {
                            selectedTab = "상세정보"
                        }
                    }
                    VStack(spacing: 10){
                        Spacer()
                        HStack(spacing: 5) {
                            Text("정보수정")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 14)
                                        .weight(.semibold)
                                )
                                .foregroundStyle(selectedTab == "정보수정" ? Color.accentColor : Color(red: 0.39, green: 0.45, blue: 0.55))
                        }
                        UnevenRoundedRectangle(topLeadingRadius: 10, topTrailingRadius: 10)
                            .frame(width: 120, height: 3)
                            .foregroundStyle(selectedTab == "정보수정" ? Color.accentColor : .clear)
                    }
                    .onTapGesture {
                        withAnimation {
                            selectedTab = "정보수정"
                        }
                    }
                }
                .frame(height: 30)
                Divider()
                
                if selectedTab == "상세정보" {
                    VStack(spacing: 20) {
                        VStack(spacing: 5) {
                            HStack {
                                Text("추천메뉴")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 16)
                                            .weight(.bold)
                                    )
                                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                Spacer()
                            }
                            HStack {
                                Text("흑임자라떼")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 13)
                                            .weight(.medium)
                                    )
                                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                Spacer()
                            }
                        }
                        .padding(.top, 10)
                        VStack(spacing: 5) {
                            HStack {
                                Text("제공서비스")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 16)
                                            .weight(.bold)
                                    )
                                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                Spacer()
                            }
                            HStack(spacing: 10) {
                                ForEach(myPlaceInformationViewModel.result.service.isEmpty ? [""] : myPlaceInformationViewModel.result.service, id: \.self) { service in
                                    BlueChip(text: self.emojiForService(service) + service, isSelected: false)
                                }
                                .font(
                                    myPlaceInformationViewModel.result.service.isEmpty ?
                                    Font.custom("Apple SD Gothic Neo", size: 12).weight(.regular) :
                                        Font.custom("Apple SD Gothic Neo", size: 18).weight(.regular)
                                )
                                Spacer()
                            }
                        }
                        VStack(spacing: 5) {
                            HStack {
                                Text("휴무일")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 16)
                                            .weight(.bold)
                                    )
                                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                                Spacer()
                            }
                            VStack {
                                HStack(spacing: 10) {
                                    ForEach(myPlaceInformationViewModel.result.closedDay.prefix(6), id: \.self) { closedDayIndex in
                                        RedChip(text: closedDayIndex)
                                    }
                                    if myPlaceInformationViewModel.result.closedDay.count > 6 {
                                        ForEach(myPlaceInformationViewModel.result.closedDay.dropFirst(6), id: \.self) { closedDayIndex in
                                            RedChip(text: closedDayIndex)
                                        }
                                    }
                                    Spacer()
                                }
                            }
                        }
                        VStack(spacing: 5) {
                            HStack(alignment: .center, spacing: 0) {
                                Text("인스타그램")
                                    .font(
                                        .custom("Apple SD Gothic Neo", size: 16)
                                        .weight(.semibold)
                                    )
                                Spacer()
                            }
                            if !myPlaceInformationViewModel.result.insta.isEmpty {
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
                            }
                            else {
                                HStack {
                                    Text("인스타그램 계정이 입력되지 않았어요")
                                        .font(
                                            .custom("Apple SD Gothic Neo", size: 12)
                                            .weight(.regular)
                                        )
                                    Spacer()
                                }
                            }
                        }
                    }
                    .frame(height: 260)
                    .padding(.leading, 30)
                }
                else if selectedTab == "정보수정" {
                    VStack(spacing: 10) {
                        ZStack {
                            TextEditor(text: $userInputHeader)
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 14)
                                )
                                .scrollContentBackground(.hidden)
                                .frame(width: 320, height: 40)
                                .background(
                                    Rectangle()
                                        .stroke(Color(red: 0.62, green: 0.64, blue: 0.67), lineWidth: 1)
                                        .frame(width: 320, height: 40)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                )
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            if userInputHeader.isEmpty {
                                HStack {
                                    Text("제목 (10자 이내)")
                                        .foregroundStyle(.gray)
                                        .font(
                                            .custom("Apple SD Gothic Neo", size: 13)
                                        )
                                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                                    Spacer()
                                }
                                .frame(width: 320, height: 40)
                            }
                            Spacer()
                        }
                        .padding(.top, 10)
                        ZStack {
                            TextEditor(text: $userInputContent)
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 14)
                                )
                                .scrollContentBackground(.hidden)
                                .frame(width: 320, height: 120)
                                .background(
                                    Rectangle()
                                        .stroke(Color(red: 0.62, green: 0.64, blue: 0.67), lineWidth: 1)
                                        .frame(width: 320, height: 120)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                )
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            if userInputContent.isEmpty {
                                VStack {
                                    HStack {
                                        Text("내용 (300자 이내)")
                                            .foregroundStyle(.gray)
                                            .font(
                                                .custom("Apple SD Gothic Neo", size: 13)
                                            )
                                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                                        Spacer()
                                    }
                                    Spacer()
                                }
                                .frame(width: 320, height: 120)
                            }
                            Spacer()
                        }
                        //MARK: - toast창이라도 띄우면 좋을듯?
                        Button(action: {
                            
                        }) {
                            RoundedRectangle(cornerRadius: 7)
                                .frame(width: 260, height: 40)
                                .overlay(
                                    Text("보내기")
                                        .font(
                                            .custom("Apple SD Gothic Neo", size: 14)
                                            .weight(.semibold)
                                        )
                                        .foregroundStyle(.white)
                                )
                        }
                        .padding(.top, 10)
                    }
                    .frame(height: 260)
                }
                HStack {
                    Text("최초 작성자: " + "\(myPlaceInformationViewModel.result.writer)")
                        .font(Font.custom("Apple SD Gothic Neo", size: 12))
                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        .padding(.leading, 30)
                    Spacer()
                    Text("최근 수정일: \(formatDateString(myPlaceInformationViewModel.result.updatedAt))")
                        .font(Font.custom("Apple SD Gothic Neo", size: 12))
                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        .padding(.trailing, 30)
                }
            }
            .ignoresSafeArea(.all)
            VStack {
                HStack{
                    Button(action: {
                        path.removeLast()
                    }) {
                        Circle()
                            .frame(width: 50, height: 50)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            .foregroundStyle(.white)
                            .overlay(
                                Image(systemName: "chevron.backward")
                                    .foregroundStyle(.black)
                                    .bold()
                            )
                    }
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 0))
                    Spacer()
                }
                Spacer()
            }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .onAppear {
            myPlaceInformationViewModel.getMyPlaceInformation(placeId: placeId)
        }
        .KeyboardAwarePadding()
        .toolbar(.hidden)
        .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
    }
    
    func formatDateString(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "yyyy.MM.dd"
            return dateFormatter.string(from: date)
        } else {
            return "날짜 없음"
        }
    }

    //MARK: - 이모지 떼면서 앞에 공백 생겨서 넣어줘야함.
    func emojiForService(_ service: String) -> String {
        switch service {
        case " 저렴한 가격":
            return "💰"
        case " 친절한 서비스":
            return "☺️"
        case " 좋은 뷰":
            return "⛰️"
        case " 주차 가능":
            return "🚗"
        case " 편안한 좌석":
            return "💺"
        case " 최고의 맛":
            return "🤤"
        case " 집중하기 좋은 곳":
            return "🎧"
        case " 좋은 분위기":
            return "💐"
        case " 키즈존":
            return "👶🏻"
        case " 반려동물 동반":
            return "😻"
        case " 좋은 음악 큐레이션":
            return "🎶"
        default:
            return "\(service)"
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
}

import Combine

struct KeyboardAwareModifier: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0

    private var keyboardHeightPublisher: AnyPublisher<CGFloat, Never> {
        Publishers.Merge(
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillShowNotification)
                .compactMap { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue }
                .map { $0.cgRectValue.height },
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in CGFloat(0) }
       ).eraseToAnyPublisher()
    }

    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardHeight)
            .onReceive(keyboardHeightPublisher) { self.keyboardHeight = $0 }
    }
}

extension View {
    func KeyboardAwarePadding() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAwareModifier())
    }
}

#Preview {
    PlaceInformationView(myPlaceInformationViewModel: MyPlaceInformationViewModel(), myPlaceListViewModel: MyPlaceListViewModel(), path: .constant([]), isHeartFilled: .constant(true), placeId: .constant(101))
}
