//
//  KakaoAPI.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/16/24.
//

import SwiftUI
import Moya

enum KakaoAPI {
    case searchPlaces(query: String)
}

extension KakaoAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://dapi.kakao.com/v2/local")!
    }

    var path: String {
        switch self {
        case .searchPlaces:
            return "/search/keyword.json"
        }
    }

    var method: Moya.Method {
        switch self {
        case .searchPlaces:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case let .searchPlaces(query):
            return .requestParameters(parameters: ["query": query], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        guard let path = Bundle.main.path(forResource: "secret", ofType: "plist") else {
            fatalError("secret.plist 파일을 찾을 수 없습니다.")
        }
        guard let data = FileManager.default.contents(atPath: path) else {
            fatalError("secret.plist 파일을 읽어올 수 없습니다.")
        }
        guard let plistDictionary = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] else {
            fatalError("secret.plist를 NSDictionary로 변환할 수 없습니다.")
        }
        if let kakaoAK = plistDictionary["KakaoAK"] as? String {
            return ["Authorization": "KakaoAK \(kakaoAK)"]
        } else {
            fatalError("KakaoAK을 찾을 수 없거나 유효하지 않습니다.")
        }
    }
}

