//
//  LoginAPI.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/15/24.
//

import Foundation
import Moya

// 고쳐야될거 많음 ^^
enum LoginAPI {
    case googleLogin(accessToken: String)
    case kakaoLogin
    case getUserInfo(userId: Int)
    case setUserInfo(userId: Int, info: UserEditViewModel)
}

extension LoginAPI: TargetType {
    var baseURL: URL {
        guard let path = Bundle.main.path(forResource: "secret", ofType: "plist") else {
            fatalError("secret.plist 파일을 찾을 수 없습니다.")
        }
        guard let data = FileManager.default.contents(atPath: path) else {
            fatalError("secret.plist 파일을 읽어올 수 없습니다.")
        }
        guard let plistDictionary = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] else {
            fatalError("secret.plist를 NSDictionary로 변환할 수 없습니다.")
        }
        if let baseURLString = plistDictionary["BaseURL"] as? String,
           let url = URL(string: baseURLString) {
            return url
        } else {
            fatalError("BaseURL을 찾을 수 없거나 유효하지 않습니다.")
        }
    }
    
    var path: String { // 얘는 파라미터 필요
        switch self {
        case .googleLogin:
            return "/auth/login"
        case .kakaoLogin:
            return "/auth/login"
        case .getUserInfo(let userId):
            return "/user/\(userId)"
        case .setUserInfo(let userId, let info):
            return "/user/\(userId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .googleLogin:
            return .post
        case .kakaoLogin:
            return .post
        case .getUserInfo:
            return .get
        case .setUserInfo:
            return .post
        }
    }
    
    var task: Task { // 파라미터 필요
        switch self {
        case .googleLogin(let accessToken):
            return .requestParameters(parameters: ["access_token": accessToken, "provider": "1"], encoding: URLEncoding.default)
        case .kakaoLogin:
            return .requestPlain
        case .getUserInfo:
            return .requestPlain
        case .setUserInfo(let userId, let info):
            let jsonData = try! JSONEncoder().encode(info)
            return .requestData(jsonData)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .googleLogin(let accessToken):
            return ["Content-type": "application/x-www-form-urlencoded;charset=utf-8", "Authorization": "Bearer \(accessToken)"]
        case .kakaoLogin:
            return["Content-type": "application/x-www-form-urlencoded;charset=utf-8", ]
        case .getUserInfo:
            return ["Content-type": "application/json"]
        case .setUserInfo:
            return ["Content-type": "application/json"]
        }
    }
    
    var sampleData: Data {
        return Data()
    }
}
