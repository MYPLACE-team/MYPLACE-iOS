//
//  FavoritePlaceViewModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 2/8/24.
//

import Foundation

class FavoritePlaceViewModel: ObservableObject {
    let myPlaceManager = MyPlaceManager()
    
    @Published var isSuccess: Bool
    @Published var code: String
    @Published var message: String
    @Published var result: [FavoritePlace]
    
    // 초기화 메서드
    init(isSuccess: Bool, code: String, message: String, place: [FavoritePlace]) {
        self.isSuccess = isSuccess
        self.code = code
        self.message = message
        self.result = place
    }
    
    private enum CodingKeys: String, CodingKey {
        case isSuccess
        case code
        case message
        case result
    }
    
    func searchMyPlaceList()  {
        myPlaceManager.searchFavoritePlaceList { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    self.isSuccess = response.isSuccess
                    self.code = response.code
                    self.message = response.message
                    self.result = response.result
                }
                   
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}
