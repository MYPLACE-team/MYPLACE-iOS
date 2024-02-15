//
//  FavoritePlaceViewModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 2/8/24.
//

import Foundation

/*
 "category": [0, 1, 2, 3], // 조회하려는 카테고리 목록, 전체 조회는 [] 입력
     "sort": 2000, // default: 2000 등록 순, 2001 : 이름 순
     "visit": 3000 // default: 3000 (전체), 3001: 다녀온 장소, 3002: 다녀올 장소
 */
class FavoritePostBodyViewModel: ObservableObject, Codable {
    static let shared = FavoritePostBodyViewModel()
    
    @Published var category: [Int] = []
    @Published var sort: Int = 2000
    @Published var visit: Int = 3000
    
    private init() {
        self.category = []
        self.sort = 2000
        self.visit = 3000
    }
    
    enum CodingKeys: String, CodingKey {
        case category
        case sort
        case visit
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        category = try container.decode([Int].self, forKey: .category)
        sort = try container.decode(Int.self, forKey: .sort)
        visit = try container.decode(Int.self, forKey: .visit)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(category, forKey: .category)
        try container.encode(sort, forKey: .sort)
        try container.encode(visit, forKey: .visit)
    }
}

class FavoritePlaceViewModel: ObservableObject {
    static let shared = FavoritePlaceViewModel()
    let myPlaceManager = MyPlaceManager()
    
    @Published var isSuccess: Bool = false
    @Published var code: String = ""
    @Published var message: String = ""
    @Published var result: [FavoritePlace] = []
    
    func searchMyPlaceList()  {
        myPlaceManager.searchFavoritePlaceList(body: FavoritePostBodyViewModel.shared) { result in
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

extension FavoritePostBodyViewModel: CustomStringConvertible {
    var description: String {
        return "category: \(category), sort: \(sort), visit: \(visit)"
    }
}
