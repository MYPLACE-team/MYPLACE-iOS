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

struct PlaceType: Identifiable {
    let id = UUID()
    var name: String
}

let places: [PlaceModel] = [
    PlaceModel(imageName: "DummyImage1", name: "장소1", address: "주소1"),
    PlaceModel(imageName: "DummyImage2", name: "장소2", address: "주소2")
]

let placeTypes: [PlaceType] = [
    PlaceType(name: "카페"),
    PlaceType(name: "중식"),
    PlaceType(name: "일식"),
    PlaceType(name: "양식"),
    PlaceType(name: "한식"),
    PlaceType(name: "술집"),
    PlaceType(name: "디저트"),
    PlaceType(name: "문화공간"),
    PlaceType(name: "아시안"),
    PlaceType(name: "고기"),
    PlaceType(name: "팝업스토어"),
    PlaceType(name: "기타")
]

struct SelectedPlace {
    var name: String
    var address: String
}

class PopupViewModel: ObservableObject {
    @Published var selectedPlace: SelectedPlace?
    
    func setSelectedPlace(placeModel: PlaceModel) {
        selectedPlace = SelectedPlace(name: placeModel.name, address: placeModel.address)
    }
}
