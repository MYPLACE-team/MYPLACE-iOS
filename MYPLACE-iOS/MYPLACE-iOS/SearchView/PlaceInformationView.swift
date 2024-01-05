//
//  PlaceInformationView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/5/24.
//

import SwiftUI

struct PlaceInformationView: View {
    @Binding var path: [PathModel]
    private let images = ["DummyImage1", "DummyImage2"]
    var body: some View {
        ZStack {
            TabView {
                ForEach(images, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .frame(height: 460)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            VStack {
                Image("DummyImage1")
                    .resizable()
                    .frame(height: 460)
                    .tag(1)
            }
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
        .toolbar(.hidden)
    }
}

#Preview {
    PlaceInformationView(path: .constant([]))
}
