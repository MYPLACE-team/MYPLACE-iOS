//
//  PopupView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/19/24.
//

import SwiftUI

struct PopupView: View {
    var body: some View {
        SearchPopup(path: .constant([]), isPopupPresented: .constant(true), popupViewModel: PopupViewModel())
    }
}

struct SearchPopup: View {
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
                    if let selectedPlace = popupViewModel.selectedPlace {
                        HStack {
                            Text(selectedPlace.placeName)
                                .foregroundStyle(Color.white)
                                .fontWeight(.medium)
                                .padding(.leading, 50)
                            Spacer()
                        }
                        HStack {
                            Image("Map")
                                .resizable()
                                .frame(width: 12, height: 15)
                                .padding(.leading, 30)
                            Text(selectedPlace.address)
                                .foregroundStyle(Color.white)
                                .fontWeight(.medium)
                            Spacer()
                        }
                    }
                    else {
                        HStack {
                            Text("장소")
                                .foregroundStyle(Color.white)
                                .fontWeight(.medium)
                                .padding(.leading, 50)
                            Spacer()
                        }
                        HStack {
                            Image("Map")
                                .resizable()
                                .frame(width: 12, height: 15)
                                .padding(.leading, 30)
                            Text("주소")
                                .foregroundStyle(Color.white)
                                .fontWeight(.medium)
                            Spacer()
                        }
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
                        path.append(.placeInformationEditView)
                    }) {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 70, height: 30)
                            .overlay(
                                Text("️선택완료")
                                    .font(Font.custom("Apple SD Gothic Neo", size: 12))
                                    .foregroundStyle(.white)
                            )
                    }
                    .padding(.top, 15)
                    .disabled(selectedTypeIndex == nil)
                    Spacer()
                }
            )
    }
}

#Preview {
    PopupView()
}
