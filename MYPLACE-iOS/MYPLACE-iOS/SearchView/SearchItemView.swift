//
//  SearchItemView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/5/24.
//

import SwiftUI


struct SearchItemView_Registered: View {
    @Binding var isHeartFilled: Bool
    @Binding var path: [PathModel]
    var place: PlaceModel
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
                                    let toastMessage = isHeartFilled ? "관심 장소로 저장되었습니다." : "관심 장소 저장이 해제되었습니다."
                                    ToastViewModel.shared.showToastWithString(text: toastMessage)
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

struct SearchItemView_UnRegistered: View {
    @Binding var path: [PathModel]
    var place: PlaceModel
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
                            Text("등록하기")
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 11)
                                )
                                .foregroundStyle(Color(red: 0.4, green: 0.35, blue: 0.96))
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(red: 0.89, green: 0.89, blue: 0.95).opacity(0.42))
                                        .foregroundColor(.clear)
                                        .frame(width: 55, height: 18)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color(red: 0.4, green: 0.35, blue: 0.96), lineWidth: 0.5)
                                        )
                                )
                                .padding(.leading, 10)
                            Spacer()
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

struct FavoriteItemView: View {
    @Binding var path: [PathModel]
    var place: PlaceModel
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(width: 340, height: 80)
//            .foregroundStyle(Color(red: 0.97, green: 0.95, blue: 1))
            .foregroundStyle(.blue)
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
                            Image("CafeIcon")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text(place.name)
                                .font(
                                    .custom("Apple SD Gothic Neo", size: 17)
                                    .weight(.semibold)
                                )
                                .foregroundStyle(.black)
                            Spacer()
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

struct SearchItemView: View {
    var body: some View {
        SearchItemView_Registered(isHeartFilled: .constant(false), path: .constant([]), place: places[1])
        SearchItemView_UnRegistered(path: .constant([]), place: places[1])
        FavoriteItemView(path: .constant([]), place: places[1])
    }
}


#Preview {
    SearchItemView()
}
