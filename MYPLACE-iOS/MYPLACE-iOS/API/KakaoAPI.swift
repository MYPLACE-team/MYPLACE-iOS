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
        return ["Authorization": "KakaoAK b6650aaa90b6bd0106949403f59b04c5"]
    }
}

