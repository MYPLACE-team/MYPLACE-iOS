//
//  MyPlaceInformationViewModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 2/1/24.
//

import SwiftUI
import Moya

class MyPlaceInformationViewModel: ObservableObject, Codable {
    static let shared = MyPlaceInformationViewModel()
    
    @Published var latitude: String
    @Published var longitude: String
    @Published var name: String
    @Published var address: String
    @Published var category: String
    @Published var recommendedMenu: String
    @Published var dayOff: [String]
    @Published var providedService: [String]
    @Published var url: String
    @Published var tags: [String]
    @Published var images: [String]
    
    private init() {
        self.latitude = ""
        self.longitude = ""
        self.name = ""
        self.address = ""
        self.category = ""
        self.recommendedMenu = ""
        self.dayOff = []
        self.providedService = []
        self.url = ""
        self.tags = ["", "", ""]
        self.images = []
    }
    
    // Decodable을 준수하기 위한 이니셜라이저
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try container.decode(String.self, forKey: .latitude)
        longitude = try container.decode(String.self, forKey: .longitude)
        name = try container.decode(String.self, forKey: .name)
        address = try container.decode(String.self, forKey: .address)
        category = try container.decode(String.self, forKey: .category)
        recommendedMenu = try container.decode(String.self, forKey: .recommendedMenu)
        dayOff = try container.decode([String].self, forKey: .dayOff)
        providedService = try container.decode([String].self, forKey: .providedService)
        url = try container.decode(String.self, forKey: .url)
        tags = try container.decode([String].self, forKey: .tags)
        images = try container.decode([String].self, forKey: .images)
    }

    // Encodable을 준수하기 위한 함수
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(name, forKey: .name)
        try container.encode(address, forKey: .address)
        try container.encode(category, forKey: .category)
        try container.encode(recommendedMenu, forKey: .recommendedMenu)
        try container.encode(dayOff, forKey: .dayOff)
        try container.encode(providedService, forKey: .providedService)
        try container.encode(url, forKey: .url)
        try container.encode(tags, forKey: .tags)
        try container.encode(images, forKey: .images)
    }
    
    private enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case name
        case address
        case category
        case recommendedMenu
        case dayOff
        case providedService
        case url
        case tags
        case images
    }
    
    func reset() {
        self.latitude = ""
        self.longitude = ""
        self.name = ""
        self.address = ""
        self.category = ""
        self.recommendedMenu = ""
        self.dayOff = []
        self.providedService = []
        self.url = ""
        self.tags = ["", "", ""]
        self.images = []
    }
    
    func openInstagram(username: String) {
        let instagramUrl = URL(string: "instagram://user?username=\(username)")!
        if UIApplication.shared.canOpenURL(instagramUrl) {
            UIApplication.shared.open(instagramUrl, options: [:], completionHandler: nil)
        } else {
            let webUrl = URL(string: "https://www.instagram.com/\(username)/")!
            UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
        }
    }
}

extension MyPlaceInformationViewModel: CustomStringConvertible {
    var description: String {
        return "Latitude: \(latitude), Longitude: \(longitude), Name: \(name), Address: \(address), Category: \(category), RecommendedMenu: \(recommendedMenu), DayOff: \(dayOff), ProvidedService: \(providedService), URL: \(url), Tags: \(tags), Images: \(images)"
    }
}
