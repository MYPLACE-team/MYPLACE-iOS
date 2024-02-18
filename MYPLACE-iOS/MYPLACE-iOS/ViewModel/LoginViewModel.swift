//
//  LoginViewModel.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/16/24.
//

import Foundation


class UserInfoViewModel: ObservableObject, Codable {
    static let shared = UserInfoViewModel()
    let loginManager = LoginManager()
    
    var userId = 1
    var provider = ""
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
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decode(String.self, forKey: .email)
        username = try container.decode(String.self, forKey: .username)
        profileImg = try container.decode(String.self, forKey: .profileImg)
        profile = try container.decode(String.self, forKey: .profile)
        level = try container.decode(Int.self, forKey: .level)
        point = try container.decode(Int.self, forKey: .point)
        placeCount = try container.decode(Int.self, forKey: .placeCount)
        archiveCount = try container.decode(Int.self, forKey: .archiveCount)
        avgRate = try container.decode(Int.self, forKey: .avgRate)
        provider = try container.decode(String.self, forKey: .provider)
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
        case email, username, profileImg, profile, level, point, placeCount, archiveCount, avgRate, provider
    }
    
    func getUserInfo(userId: String) {
        loginManager.getUserInfo(userId: "\(userId)") { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
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
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func setUserInfo(userId: String, info: UserInfoViewModel, completion: @escaping (Bool) -> Void) {
        loginManager.setUserInfo(userId: userId, info: UserInfoViewModel.shared) { error in
            if(error != nil) {
                print("error")
                completion(false)
            } else {
                print("success")
                DispatchQueue.main.async {
                    completion(true)
                }
            }
        }
    }
}
