//
//  PlaceModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/30/23.
//

import SwiftUI

struct PlaceModel: Hashable, Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let address: String
}

let dummyPlaces: [PlaceModel] = [
    PlaceModel(imageName: "DummyImage1", name: "장소1", address: "주소1"),
    PlaceModel(imageName: "DummyImage2", name: "장소2", address: "주소2")
]

struct SelectedPlace {
    var x: String = "0"
    var y: String = "0"
    var placeName: String = "1"
    var address: String = "2"
}
