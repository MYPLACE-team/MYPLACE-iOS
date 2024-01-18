//
//  ContentView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/27/23.
//

import SwiftUI
import KakaoMapsSDK_SPM
import Moya

struct ContentView: View {
    @StateObject private var kakaoSearchViewModel = KakaoSearchViewModel()
    var body: some View {
        VStack {
            Button("Search Places") {
                kakaoSearchViewModel.searchPlaces(query: "카카오프렌즈")
            }
            List(kakaoSearchViewModel.places, id: \.id) { place in
                VStack(alignment: .leading) {
                    Text("Place Name: \(place.placeName)")
                    Text("Distance: \(place.distance)")
                    Text("Address: \(place.addressName)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
