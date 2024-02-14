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
    case registerFavoritePlace(placeId: Int)
    case searchFavoritePlaceList
    case getMyPlaceInformation(placeId: Int)
    case getMyPlaceList(keyword: String, page: Int)
}

extension MyPlaceAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://3.35.214.215")!
    }
    
    var path: String {
        switch self {
        case .registerMyPlace:
            return "/place"
        case .registerFavoritePlace(let placeId):
            return "/place/like/\(placeId)"
        case .searchFavoritePlaceList:
            return "/place/like"
        case .getMyPlaceInformation(let placeId):
            return "/place/\(placeId)"
        case .getMyPlaceList:
            return "/place/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .registerMyPlace:
            return .post
        case .registerFavoritePlace:
            return .post
        case .searchFavoritePlaceList:
            return .post
        case .getMyPlaceInformation:
            return .get
        case .getMyPlaceList:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .registerMyPlace(let place):
            let jsonData = try! JSONEncoder().encode(place)
            return .requestData(jsonData)
        case .registerFavoritePlace:
            return .requestPlain
        case .searchFavoritePlaceList:
            return .requestPlain
        case .getMyPlaceInformation:
            return .requestPlain
        case .getMyPlaceList(let keyword, let page):
            return .requestParameters(parameters: ["keyword": keyword, "page": page], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}
