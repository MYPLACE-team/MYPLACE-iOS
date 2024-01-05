//
//  SearchView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/30/23.
//

import SwiftUI

struct SearchView: View {
    @Binding var path: [PathModel]
    @State var searchNumber: Int = 2
    @State private var isPopupPresented = false
    @StateObject var popupViewModel = PopupViewModel()
    @StateObject var toastViewModel = ToastViewModel.shared
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    //MARK: - 검색 안됨, 홈화면 정보값 넘겨받기
                    TextField("장소명 검색하기", text: .constant(""))
                        .font(
                            .custom("Apple SD Gothic Neo", size: 15)
                            .weight(.semibold)
                        )
                        .foregroundStyle(.gray)
                        .padding(.leading, 40)
                    Button(action: {
                        //MARK: - Search update
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                    }
                    Spacer()
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
                Divider()
                    .background(.black)
                    .padding(.top, 10)
                HStack(spacing: 0) {
                    Spacer()
                    Text("총 ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 15)
                            .weight(.thin)
                        )
                    //MARK: - API 값
                    Text("\(searchNumber)") // API로 받은 숫자로 업데이트
                        .font(
                            .custom("Apple SD Gothic Neo", size: 15)
                        )
                    Text("개")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 15)
                            .weight(.thin)
                        )
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                    
                }
                .padding(.top, 5)
                
                ScrollView {
                    VStack {
//                        ForEach(places, id: \.self) { place in
//                            Button(action: {
//                                popupViewModel.setSelectedPlace(placeModel: place)
//                                isPopupPresented.toggle()
//                            }) {
//                                SearchItemView(path: $path)
//                                    .padding(.top, 5)
//                            }
//                        }
                        ForEach(0..<min(searchNumber, places.count), id: \.self) { index in
                            let place = places[index]
                            Button(action: {
                                popupViewModel.setSelectedPlace(placeModel: place)
                                isPopupPresented.toggle()
                            }) {
                                SearchItemView_UnRegistered(path: $path, place: place)
                                    .padding(.top, 5)
                            }
                        }
                        Button(action: {
                            path.append(.settingView)
                        }) {
                            SearchItemView_Registered(path: $path, place: places[0])
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                Spacer()
            }
            .blur(radius: isPopupPresented ? 10 : 0)
            .disabled(isPopupPresented)
            if isPopupPresented {
                SearchItemPopup(path: $path, isPopupPresented: $isPopupPresented, popupViewModel: popupViewModel)
            }
        }
        .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
    }
}

struct SearchItemPopup: View {
    @Binding var path: [PathModel]
    @Binding var isPopupPresented: Bool
    @ObservedObject var popupViewModel: PopupViewModel
    @State private var selectedTypeIndex: Int?
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.6))
            .frame(width: 330, height: 380)
            .overlay(
                VStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            isPopupPresented.toggle()
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 17, height: 17)
                                .foregroundStyle(.white)
                                .padding(.trailing, 20)
                                .padding(.top, 20)
                        }
                    }
                    //MARK: - 값 전달 구현
                    if let selectedPlace = popupViewModel.selectedPlace {
                        Text(selectedPlace.name)
                            .foregroundStyle(Color.white)
                            .fontWeight(.medium)
                        Text(selectedPlace.address)
                            .foregroundStyle(Color.white)
                            .fontWeight(.medium)
                    }
                    DottedDivider()
                        .padding(.top, 10)
                    Text("이 장소의 유형을 한 가지 선택해주세요!")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 18)
                            .weight(.bold)
                        )
                        .foregroundStyle(.white)
                        .padding(.top, 10)
                    VStack(spacing: 10) {
                        ForEach(0..<3) { row in
                            HStack {
                                ForEach(0..<4) { column in
                                    let index = row * 4 + column
                                    if index < placeTypes.count {
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(selectedTypeIndex == index ? Color("MPPurple") : Color(red: 0.97, green: 0.95, blue: 1))
                                            .frame(width: 58, height: 24)
                                            .overlay(
                                                Text(placeTypes[index].name)
                                                    .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                                    .foregroundStyle(selectedTypeIndex == index ? Color.white : Color(red: 0.4, green: 0.35, blue: 0.96))
                                                    .padding(.top, 2)
                                            )
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                                            )
                                            .onTapGesture {
                                                selectedTypeIndex = index
                                            }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 15)
                    Button(action: {
                        isPopupPresented.toggle()
                        path.append(.searchDetailView)
                    }) {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.blue)
                            .frame(width: 70, height: 30)
                            .overlay(
                                Text("️선택완료")
                                    .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                    .foregroundStyle(.white)
                            )
                    }
                    .padding(.top, 15)
                    Spacer()
                }
            )
    }
}

struct DottedDivider: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [3]))
            .foregroundStyle(.white)
        }
        .frame(height: 1)
    }
}

#Preview {
    SearchView(path: .constant([]))
}
