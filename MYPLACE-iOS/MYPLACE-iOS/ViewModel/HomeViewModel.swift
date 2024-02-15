//
//  HomeViewModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 2/15/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    static let shared = HomeViewModel()
    let myPlaceManager = MyPlaceManager()
    
    @Published var isSuccess: Bool = false
    @Published var code: String = ""
    @Published var message: String = ""
    @Published var result: HomeData = HomeData(username: "", placeList: [])
    
    func getHomeViewInformation()  {
        myPlaceManager.getHoemViewInformation() { result in
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

