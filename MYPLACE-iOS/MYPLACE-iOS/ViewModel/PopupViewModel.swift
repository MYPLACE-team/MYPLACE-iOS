//
//  PopupViewModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/19/24.
//

import Foundation

class PopupViewModel: ObservableObject {
    static let shared = PopupViewModel()
    @Published var selectedPlace: SelectedPlace?
    
    func setSelectedPlace(x: String, y: String, placeName: String, address: String) {
        self.selectedPlace = SelectedPlace(x: x, y: y, placeName: placeName, address: address)
    }
}
