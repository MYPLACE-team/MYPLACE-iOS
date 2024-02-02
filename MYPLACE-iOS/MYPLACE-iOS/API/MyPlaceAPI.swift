//
//  MyPlaceAPI.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 2/1/24.
//

import Foundation
import Moya

enum MyPlaceAPI {
    case registerMyPlace(place: MyPlaceInformationViewModel)
}

extension MyPlaceAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://3.35.214.215")!
    }
    
    var path: String {
        switch self {
        case .registerMyPlace:
            return "/place"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .registerMyPlace:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .registerMyPlace(let place):
            let jsonData = try! JSONEncoder().encode(place)
            return .requestData(jsonData)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}
