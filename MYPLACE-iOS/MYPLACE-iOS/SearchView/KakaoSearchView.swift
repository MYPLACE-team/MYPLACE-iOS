//
//  KakaoSearchView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/18/24.
//

import SwiftUI

struct KakaoSearchView: View {
    @ObservedObject var kakaoSearchViewModel: KakaoSearchViewModel
    @Binding var path: [PathModel]
    @Binding var searchText: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color(red: 0.97, green: 0.97, blue: 0.98))
            .frame(height: 40)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            .overlay(
                HStack {
                    Image("Map")
                        .resizable()
                        .frame(width: 16, height: 19)
                        .padding(.leading, 15)
                    TextField("장소명 검색하기", text: $searchText)
                        .font(
                            .custom("Apple SD Gothic Neo", size: 15)
                            .weight(.semibold)
                        )
                        .foregroundStyle(.gray)
                        .padding(.leading, 5)
                    Button(action: {
                        kakaoSearchViewModel.search(query: searchText)
                        path.append(.searchView)
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                }
            )
    }
}

#Preview {
    KakaoSearchView(kakaoSearchViewModel: KakaoSearchViewModel(), path: .constant([]), searchText: .constant(""))
}
