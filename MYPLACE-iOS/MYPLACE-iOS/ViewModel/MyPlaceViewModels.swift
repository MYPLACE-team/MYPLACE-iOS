//
//  MyPlaceViewModels.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 2/1/24.
//

import SwiftUI
import Moya

class MyPlaceListViewModel: ObservableObject {
    let myPlaceManager = MyPlaceManager()
    
    @Published var isSuccess: Bool = false
    @Published var code: Int = 0
    @Published var message: String = ""
    //MARK: - isLike 바꾸기
    @Published var result: MyPlaceListInfo = MyPlaceListInfo(totalNum: 0, hasNext: false, place: [MyPlaceList(id: 24, name: "test", address: "test", category_id: 24, thumbnail_url: JSONNull(), isLike: 1)])
    
    var description: String {
            return "isSuccess: \(isSuccess), code: \(code), message: \(message), result: \(result)"
        }
    
    
    func getMyPlaceList(keyword: String) {
        //MARK: - 사용자 입력 값으로 업데이트 필요
        myPlaceManager.getMyPlaceList(keyword: keyword, page: 1) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.isSuccess = response.isSuccess
                    self.code = response.code
                    self.message = response.message
                    self.result = response.result
                }
            case .failure(let error):
                print("Search errorWhat!!!!!!!!!!!!: \(error.localizedDescription)")
            }
        }
    }
}

//MARK: - MyPlaceInformationViewModel (PlaceInformationView)
class MyPlaceInformationViewModel: ObservableObject {
    static let shared = MyPlaceInformationViewModel()
    let myPlaceManager = MyPlaceManager()
    
    @Published var isSuccess: Bool = false
    @Published var code: Int = 0
    @Published var message: String = ""
    @Published var result: MyPlaceInformation = MyPlaceInformation(id: 0, name: "name", address: "address", categoryID: 0, recDish: "", closedDay: ["공휴일", "일요일", "연중무휴", "test"], service: [], insta: "", hashtag: ["#1", "#2", "#3"], images: [], writer: "", updatedAt: "")
    
    //MARK: - test용 23
    func getMyPlaceInformation(placeId: Int) {
        myPlaceManager.getMyPlaceInformation(placeId: placeId) { result in
            switch result {
            case .success(let response):
                print("getMyInformation success!!!!!!!!!!!!!!!!")
                DispatchQueue.main.async {
                    self.isSuccess = response.isSuccess
                    self.code = response.code
                    self.message = response.message
                    self.result = response.result
                }
            case .failure(let error):
                print("getMyInformation error: \(error.localizedDescription)")
            }
        }
    }
}

//MARK: - MyPlaceInformationEditViewModel (PlaceInformationEditView)
class MyPlaceInformationEditViewModel: ObservableObject, Codable {
    static let shared = MyPlaceInformationEditViewModel()
    
    @Published var lat: String
    @Published var lon: String
    @Published var name: String
    @Published var address: String
    @Published var categoryId: Int
    @Published var recDish: String
    @Published var closedDay: [String]
    @Published var service: [String]
    @Published var link: String
    @Published var hashtag: [String]
    @Published var images: [String]
    
    private init() {
        self.lat = ""
        self.lon = ""
        self.name = ""
        self.address = ""
        self.categoryId = 0
        self.recDish = ""
        self.closedDay = []
        self.service = []
        self.link = ""
        self.hashtag = ["", "", ""]
        self.images = []
    }
    
    // Decodable을 준수하기 위한 이니셜라이저
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lat = try container.decode(String.self, forKey: .lat)
        lon = try container.decode(String.self, forKey: .lon)
        name = try container.decode(String.self, forKey: .name)
        address = try container.decode(String.self, forKey: .address)
        categoryId = try container.decode(Int.self, forKey: .categoryId)
        recDish = try container.decode(String.self, forKey: .recDish)
        closedDay = try container.decode([String].self, forKey: .closedDay)
        service = try container.decode([String].self, forKey: .service)
        link = try container.decode(String.self, forKey: .link)
        hashtag = try container.decode([String].self, forKey: .hashtag)
        images = try container.decode([String].self, forKey: .images)
    }

    // Encodable을 준수하기 위한 함수
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lat, forKey: .lat)
        try container.encode(lon, forKey: .lon)
        try container.encode(name, forKey: .name)
        try container.encode(address, forKey: .address)
        try container.encode(categoryId, forKey: .categoryId)
        try container.encode(recDish, forKey: .recDish)
        try container.encode(closedDay, forKey: .closedDay)
        try container.encode(service, forKey: .service)
        try container.encode(link, forKey: .link)
        try container.encode(hashtag, forKey: .hashtag)
        try container.encode(images, forKey: .images)
    }
    
    private enum CodingKeys: String, CodingKey {
        case lat
        case lon
        case name
        case address
        case categoryId
        case recDish
        case closedDay
        case service
        case link
        case hashtag
        case images
    }
    
    func reset() {
        self.lat = ""
        self.lon = ""
        self.name = ""
        self.address = ""
        self.categoryId = 0
        self.recDish = ""
        self.closedDay = []
        self.service = []
        self.link = ""
        self.hashtag = ["", "", ""]
        self.images = []
    }
}

extension MyPlaceInformationEditViewModel: CustomStringConvertible {
    var description: String {
        return "Latitude: \(lat), Longitude: \(lon), Name: \(name), Address: \(address), Category: \(categoryId), RecommendedMenu: \(recDish), DayOff: \(closedDay), ProvidedService: \(service), URL: \(link), Tags: \(hashtag), Images: \(images)"
    }
}
