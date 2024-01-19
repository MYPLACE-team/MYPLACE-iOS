//
//  PopupViewModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/19/24.
//

import Foundation

class PopupViewModel: ObservableObject {
    @Published var selectedPlace: SelectedPlace?
    
    func setSelectedPlace(placeName: String, address: String) {
        selectedPlace = SelectedPlace(placeName: placeName, address: address)
        print("Selected Place Set: \(selectedPlace)")
    }
}
