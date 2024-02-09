//
//  MyPlaceInformationViewModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 2/9/24.
//

import Foundation

class MyPlaceInformationViewModel: ObservableObject {
    let myPlaceManager = MyPlaceManager()
    
    @Published var isSuccess: Bool = false
    @Published var code: Int = 0
    @Published var message: String = ""
    @Published var result: MyPlaceInformation = MyPlaceInformation(id: 0, name: "name", address: "address", categoryID: 0, recDish: "", closedDay: ["공휴일", "공휴일", "연중무휴", "test"], service: [], insta: "", hashtag: ["#1", "#2", "#3"], images: [], writer: "", updatedAt: "")
    
    func getMyPlaceInformation() {
        myPlaceManager.getMyPlaceInformation { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.isSuccess = response.isSuccess
                    self.code = response.code
                    self.message = response.message
                    self.result = response.result
                }
            case .failure(let error):
                print("Search error: \(error.localizedDescription)")
            }
        }
    }
}
