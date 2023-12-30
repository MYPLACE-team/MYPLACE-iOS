//
//  SearchView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/30/23.
//

import SwiftUI

struct SearchView: View {
    @Binding var path: [PathModel]
    @State private var searchNumber: Int = 2
    @State private var isPopupPresented = false
    //MARK: - places 구조체 api 생각
    @State private var places: [Place] = [
        Place(imageName: "DummyImage", name: "장소1", address: "주소1"),
        Place(imageName: "DummyImage", name: "장소2", address: "주소2")
    ]
    var body: some View {
        ZStack {
            VStack {
                HStack {
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
                        ForEach(places, id: \.self) { place in
                            Button(action: {
                                isPopupPresented.toggle()
                            }) {
                                SearchItemView(path: $path, place: place)
                                    .padding(.top, 5)
                            }
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                }
                Spacer()
            }
            .blur(radius: isPopupPresented ? 5 : 0)
            .disabled(isPopupPresented)
            if isPopupPresented {
                SearchItemPopup(path: $path, isPopupPresented: $isPopupPresented)
            }
            
        }
    }
}

struct SearchItemView: View {
    @State private var isHeartFilled = false
    @Binding var path: [PathModel]
    let place: Place
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.white)
            .frame(width: 340, height: 80)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
            .overlay(
                HStack {
                    Image(place.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                    
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text(place.name)
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 17)
                                    .weight(.semibold)
                                )
                                .foregroundStyle(.black)
                            Spacer()
                            Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                                .foregroundStyle(isHeartFilled ? .red : .gray)
                                .onTapGesture {
                                    isHeartFilled.toggle()
                                }
                                .padding(.trailing, 10)
                                .padding(.bottom, 5)
                        }
                        HStack {
                            Image("Map")
                                .resizable()
                                .frame(width: 12, height: 15)
                            Text(place.address)
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 15)
                                    .weight(.thin)
                                )
                                .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                        }
                    }
                    .padding(.leading, 20)
                    Spacer()
                }
            )
    }
}

struct SearchItemPopup: View {
    @Binding var path: [PathModel]
    @Binding var isPopupPresented: Bool
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
                    Text("123")
                    Text("123")
                    DottedDivider()
                        .padding(.top, 10)
                    Text("이 장소의 유형을 한 가지 선택해주세요!")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 18)
                            .weight(.bold)
                        )
                        .foregroundStyle(.white)
                        .padding(.top, 10)
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(Color(red: 0.97, green: 0.95, blue: 1))
                        .frame(width: 58, height: 24)
                        .overlay(
                            //MARK: - 16개 리스트 3x4 구현
                            Text("️text")
                                .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 1)
                        )
                    Button(action: {
                        isPopupPresented.toggle()
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
