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
    //MARK: - 토스트 메시지 뷰 두개에 띄워지는거 해결해야함
    @StateObject private var toastViewModel = ToastViewModel()
    @StateObject var myPlaceInformationViewModel = MyPlaceInformationViewModel.shared
    
//    @Binding var selectedDayOffIndices: [Holiday]
//    @Binding var selectedServiceIndices: [ProvidedService]
    
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
                    .frame(height: 460)
                    //MARK: - pageControl 일단 보류 시간 오래걸림
//                    HStack {
//                        ForEach(0..<3, id: \.self) { index in
//                            Circle()
//                                .foregroundStyle(index == currentPage ? Color.black : Color.gray)
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
                                .frame(height: 70)
                                .overlay(
                                    VStack {
                                        HStack {
                                            Text("hello")
                                                .padding(.leading, 10)
                                                .font(.system(size: 25))
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
                                        HStack {
                                            Text("hello")
                                                .padding(.leading, 10)
                                            Spacer()
                                        }
                                    }
                                        .foregroundStyle(.white)
                                        .font(
                                            .custom("Apple SD Gothic Neo", size: 20)
                                            .weight(.semibold)
                                        )
                                )
                        }
                        
                    }
                    .frame(height: 460)
                }
                HStack(spacing: 10) {
                    //MARK: - 백 데이터 오면 업데이트 필요
                    Text("#돈까스")
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
                        
                    Text("# 서촌")
                        .font(Font.custom("Apple SD Gothic Neo", size: 15))
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundStyle(.blue)
                                .padding(EdgeInsets(top: -5, leading: -10, bottom: -5, trailing: -10))
                        )
                        .padding([.leading, .trailing], 10)
                    Text("# 서촌")
                        .font(Font.custom("Apple SD Gothic Neo", size: 15))
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundStyle(.blue)
                                .padding(EdgeInsets(top: -5, leading: -10, bottom: -5, trailing: -10))
                        )
                        .padding([.leading, .trailing], 10)
                    Spacer()
                }
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 0))
                HStack {
                    VStack(alignment: .leading) {
                        HStack(spacing: 0) {
                            Image("Fork")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .padding(.top, 13)
                            Text("추천 메뉴")
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 18)
                                    .weight(.semibold)
                                )
                                .padding(.top, 15)
                                .padding(.leading, 4)
                        }
                        HStack(spacing: 0) {
                            Image("MoneyBag")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .padding(.top, 13)
                            Text("제공서비스")
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 18)
                                    .weight(.semibold)
                                )
                                .padding(.top, 15)
                                .padding(.leading, 4)
                        }
                        HStack(spacing: 0) {
                            Image("Clock")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .padding(.top, 13)
                            //MARK: - 휴무일 길면 가로 스크롤
                            Text("휴무일")
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 18)
                                    .weight(.semibold)
                                )
                                .padding(.top, 15)
                                .padding(.leading, 4)
                        }
                        HStack(spacing: 0) {
                            Image("CheckMark")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .padding(.top, 13)
                            Text("인스타그램")
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 18)
                                    .weight(.semibold)
                                )
                                .padding(.top, 15)
                                .padding(.leading, 4)
                        }
                        
                    }
                    .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                    .padding(.leading, 50)
                    
                    VStack(alignment: .leading) {
                        Text("흑임자라떼")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 18)
                                    .weight(.thin)
                            )
                            .foregroundStyle(.black)
                            .padding(.top, 15)
                        //MARK: - 백 데이터 구조 나오면 업데이트 예정
                        HStack {
                            BlueChip(text: "가나다라마바사", isSelected: false)
                                .padding(.top, 10)
                        }
                        HStack {
                            RedChip(text: "공휴일 휴무")
                                .padding(.top, 15)
                        }
                        Button(action: {
                            //MARK: - 백에서 준 값으로 업데이트 필요
                            myPlaceInformationViewModel.openInstagram(username: "user")
                        }, label: {
                            Image(systemName: "globe")
                                .padding(.top, 15)
                                .foregroundStyle(.black)
                        })
                    }
                    .padding(.leading, 60)
                    Spacer()
                }
                HStack(spacing: 0) {
                    Image("Pencil")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.top, 13)
                        .padding(.leading, 50)
                    Text("장소정보 수정 문의")
                        .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        .font(
                            .custom("Apple SD Gothic Neo", size: 18)
                            .weight(.semibold)
                        )
                        .padding(.top, 15)
                        .padding(.leading, 4)
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("보내기")
                            .font(
                                .custom("Apple SD Gothic Neo", size: 12)
                            )
                    }
                    .padding(.top, 15)
                    .padding(.trailing, 60)
                }
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
        .KeyboardAwarePadding()
        .toolbar(.hidden)
        .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
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
    PlaceInformationView(path: .constant([]), isHeartFilled: .constant(true))
}
