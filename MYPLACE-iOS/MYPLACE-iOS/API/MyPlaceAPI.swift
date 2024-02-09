//
//  MyPlaceAPI.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 2/1/24.
//

import Foundation
import Moya

enum MyPlaceAPI {
    case registerMyPlace(place: MyPlaceInformationEditViewModel)
    case searchFavoritePlaceList
    case getMyPlaceInformation
}

extension MyPlaceAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://3.35.214.215")!
    }
    
    var path: String {
        switch self {
        case .registerMyPlace:
            return "/place"
        case .searchFavoritePlaceList:
            return "/place/like"
        case .getMyPlaceInformation:
            return "/place/:placeId"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .registerMyPlace:
            return .post
        case .searchFavoritePlaceList:
            return .post
        case .getMyPlaceInformation:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .registerMyPlace(let place):
            let jsonData = try! JSONEncoder().encode(place)
            return .requestData(jsonData)
        case .searchFavoritePlaceList:
            return .requestPlain
        case .getMyPlaceInformation:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}
