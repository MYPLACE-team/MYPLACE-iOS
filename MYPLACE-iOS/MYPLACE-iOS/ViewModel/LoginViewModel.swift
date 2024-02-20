//
//  LoginViewModel.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/16/24.
//

import Foundation


class UserInfoViewModel: ObservableObject {
    static let shared = UserInfoViewModel()
    let loginManager = LoginManager()
    
    var provider = ""
    @Published var userId: Int
    @Published var email: String
    @Published var username: String
    @Published var profileImg: String
    @Published var profile: String
    @Published var level: Int
    @Published var point: Int
    @Published var placeCount: Int
    @Published var archiveCount: Int
    @Published var avgRate: Int
    
    private init() {
        self.userId = 1
        self.email = "test@naver.com"
        self.username  = "test"
        self.profileImg = "test"
        self.profile = "test"
        self.level = 1
        self.point = 1
        self.placeCount = 1
        self.archiveCount = 1
        self.avgRate = 1
    }
    
    func getUserInfo(userId: Int) {
        loginManager.getUserInfo(userId: userId) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.userId = response.result.id
                    self.email = response.result.email
                    self.username  = response.result.username
                    self.profileImg = response.result.profileImg ?? "profile"
                    self.profile = response.result.profile
                    self.level = response.result.level
                    self.point = response.result.point
                    self.placeCount = response.result.placeCount
                    self.archiveCount = response.result.archiveCount
                    self.avgRate = response.result.avgRate
                    self.provider = response.result.provider
                    print(self.profile)
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}


class UserEditViewModel: ObservableObject, Codable {
    static let shared = UserEditViewModel()
    
    @Published var userId: Int
    @Published var username: String
    @Published var profileImg: String
    @Published var profile: String
    
    private init() {
        self.userId = 1
        self.username  = ""
        self.profileImg = ""
        self.profile = ""
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userId = try container.decode(Int.self, forKey: .userId)
        username = try container.decode(String.self, forKey: .username)
        profileImg = try container.decode(String.self, forKey: .profileImg)
        profile = try container.decode(String.self, forKey: .profile)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userId, forKey: .userId)
        try container.encode(username, forKey: .username)
        try container.encode(profileImg, forKey: .profileImg)
        try container.encode(profile, forKey: .profile)
    }
    
    private enum CodingKeys: String, CodingKey {
        case userId
        case username, profileImg, profile
    }
}
