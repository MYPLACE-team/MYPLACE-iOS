//
//  PlaceInformationView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/5/24.
//

import SwiftUI

struct PlaceInformationView: View {
    @Binding var path: [PathModel]
    @State private var currentPage = 0
    @Binding var isHeartFilled: Bool
    @State private var userInput: String = ""
    @Binding var placeId: Int
    //MARK: - 토스트 메시지 뷰 두개에 띄워지는거 해결해야함
    @StateObject private var toastViewModel = ToastViewModel()
    @ObservedObject var myPlaceInformationViewModel: MyPlaceInformationViewModel
    
    
    let imageHeight = CGFloat(440)
    let hstackWidth = CGFloat(320)
    @State var emoji: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    //MARK: - 이미지 이동하려는 순간 살짝 아래로 내려와서 위에 여백 생김
                    TabView(selection: $currentPage) {
                        Image("DummyImage2")
                            .resizable()
                            .ignoresSafeArea(.all)
                        Image("DummyImage")
                            .resizable()
                            .ignoresSafeArea(.all)
                        Image("DummyImage2")
                            .resizable()
                            .ignoresSafeArea(.all)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(height: imageHeight)
                    //MARK: - pageControl 일단 보류 시간 오래걸림
//                    HStack {
//                        ForEach(0..<3, id: \.self) { index in
//                            Circle()
//                               .foregroundStyle(index == currentPage ? Color.black : Color.gray)
//                                .frame(width: 8, height: 8)
//                        }
//                    }
//                    .padding(.top, 290)
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
                                                    isHeartFilled.toggle()
                                                    let toastMessage = isHeartFilled ? "관심 장소로 저장되었습니다." : "관심 장소 저장이 해제되었습니다."
                                                    toastViewModel.showToastWithString(text: toastMessage)
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
                    HStack(spacing: 10) {
                        ForEach(myPlaceInformationViewModel.result.hashtag, id: \.self) { hashtag in
                            Text(hashtag)
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 15)
                                    .weight(.bold)
                                )
                                .foregroundStyle(Color.accentColor)
                                .background(
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundStyle(.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 40)
                                                .stroke(Color.accentColor, lineWidth: 1.3)
                                                .padding(EdgeInsets(top: -5, leading: -10, bottom: -4, trailing: -10))
                                        )
                                )
                                .padding([.leading, .trailing], 10)
                        }
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 0))   
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 15) {
                        HStack(spacing: 0) {
                            HStack {
                                Text("🍴추천 메뉴")
                                    .font(
                                        .custom("Apple SD Gothic Neo", size: 18)
                                        .weight(.semibold)
                                    )
                                Spacer()
                            }
                            .frame(width: 110)
                            .padding(.trailing, 40)
                            Text(myPlaceInformationViewModel.result.recDish.isEmpty ? "추천 메뉴가 입력되지 않았어요" : myPlaceInformationViewModel.result.recDish)
                                .font(
                                    myPlaceInformationViewModel.result.recDish.isEmpty ?
                                    Font.custom("Apple SD Gothic Neo", size: 12).weight(.thin) :
                                        Font.custom("Apple SD Gothic Neo", size: 18).weight(.thin)
                                )
                                .foregroundStyle(.black)
                            Spacer()
                        }
                        .padding(.top, 13)
                        HStack(spacing: 0) {
                            HStack {
                                Text("💰제공서비스")
                                    .font(
                                        .custom("Apple SD Gothic Neo", size: 18)
                                        .weight(.semibold)
                                    )
                                Spacer()
                            }
                            .frame(width: 110)
                            .padding(.trailing, 40)
                            HStack(spacing: 5) {
                                ForEach(myPlaceInformationViewModel.result.service.isEmpty ? ["제공서비스가 입력되지 않았어요"] : myPlaceInformationViewModel.result.service.prefix(1), id: \.self) { service in
                                    BlueChip(text: self.emojiForService(service) + service, isSelected: false)
                                }
                                .font(
                                    myPlaceInformationViewModel.result.service.isEmpty ?
                                    Font.custom("Apple SD Gothic Neo", size: 12).weight(.thin) :
                                        Font.custom("Apple SD Gothic Neo", size: 18).weight(.thin)
                                )
                            }
                            Spacer()
                        }
                        
                        if myPlaceInformationViewModel.result.service.count > 1 {
                            HStack(spacing: 0) {
                                HStack {
                                    EmptyView()
                                }
                                .frame(width: 150)
                                HStack(spacing: 5) {
                                    ForEach(myPlaceInformationViewModel.result.service.dropFirst(), id: \.self) { service in
                                        BlueChip(text: self.emojiForService(service) + service, isSelected: false)
                                    }
                                }
                                Spacer()
                            }
                            .padding(.top, -10)
                        }
                            
                        
                        HStack(spacing: 0) {
                            HStack {
                                Text("⏰휴무일")
                                    .font(
                                        .custom("Apple SD Gothic Neo", size: 18)
                                        .weight(.semibold)
                                    )
                                Spacer()
                            }
                            .frame(width: 110)
                            .padding(.trailing, 40)
                            VStack {
                                HStack(spacing: 5) {
                                    ForEach(myPlaceInformationViewModel.result.closedDay.prefix(3), id: \.self) { closedDayIndex in
                                        RedChip(text: closedDayIndex)
                                    }
                                }
                            }
                        }
                        //MARK: - 간격 확인 후 수정 필요
                        if myPlaceInformationViewModel.result.closedDay.count > 3 {
                            HStack(spacing: 0) {
                                HStack {
                                    EmptyView()
                                }
                                .frame(width: 150)
                                HStack(spacing: 5) {
                                    ForEach(myPlaceInformationViewModel.result.closedDay.dropFirst(3), id: \.self) { closedDayIndex in
                                        RedChip(text: closedDayIndex)
                                    }
                                }
                            }
                            .padding(.top, -10)
                        }
                        HStack(spacing: 0) {
                            HStack {
                                Text("✅인스타그램")
                                    .font(
                                        .custom("Apple SD Gothic Neo", size: 18)
                                        .weight(.semibold)
                                    )
                                Spacer()
                            }
                            .frame(width: 110)
                            .padding(.trailing, 40)
                            if !myPlaceInformationViewModel.result.insta.isEmpty {
                                Button(action: {
                                    openInstagram(username: myPlaceInformationViewModel.result.insta)
                                }, label: {
                                    Image(systemName: "globe")
                                        .foregroundStyle(.black)
                                })
                            }
                            else {
                                Text("인스타그램 몰라!")
                                    .font(
                                        .custom("Apple SD Gothic Neo", size: 12)
                                        .weight(.semibold)
                                    )
                            }
                        }
                        
                    }
                    .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                    .frame(width: hstackWidth)
                }
                HStack(spacing: 0) {
                    Image("Pencil")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.top, 8)
                    Text("장소정보 수정 문의")
                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        .font(
                            .custom("Apple SD Gothic Neo", size: 18)
                            .weight(.semibold)
                        )
                        .padding(.top, 5)
                        .padding(.leading, 4)
                    Spacer()
                    //MARK: - toast창이라도 띄우면 좋을듯?
                    Button(action: {
                        
                    }) {
                        Text("보내기")
                            .font(
                                .custom("Apple SD Gothic Neo", size: 12)
                            )
                    }
                    .padding(.top, 10)
                }
                .frame(width: hstackWidth)
                ZStack {
                    TextEditor(text: $userInput)
                        .font(
                            .custom("Apple SD Gothic Neo", size: 14)
                        )
                        .frame(width: 250, height: 50)
                        .background(
                            Rectangle()
                                .foregroundStyle(.white)
                                .frame(width: 270, height: 60)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        )
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    if userInput.isEmpty {
                        Text("수정이 필요한 정보가 무엇인가요?\n자유롭게 남겨주세요!")
                            .foregroundStyle(.gray)
                            .font(
                                .custom("Apple SD Gothic Neo", size: 13)
                            )
                            .frame(width: 250, height: 50)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    Spacer()
                }
                
                Spacer()
                HStack {
                    Text("최초 작성자: " + "\(myPlaceInformationViewModel.result.writer)")
                        .font(Font.custom("Apple SD Gothic Neo", size: 12))
                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        .padding(.leading, 40)
                    Spacer()
                    Text("최근 수정일: \(formatDateString(myPlaceInformationViewModel.result.updatedAt))")
                        .font(Font.custom("Apple SD Gothic Neo", size: 12))
                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        .padding(.trailing, 40)
                }
                .padding(.bottom, 10)
            }
            .ignoresSafeArea(.all)
            VStack {
                HStack{
                    Button(action: {
                        path.removeLast()
                    }) {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.white)
                            .overlay(
                                Image(systemName: "chevron.backward")
                                    .foregroundStyle(.black)
                                    .bold()
                            )
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
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
    PlaceInformationView(path: .constant([]), isHeartFilled: .constant(true), placeId: .constant(52), myPlaceInformationViewModel: MyPlaceInformationViewModel())
}
