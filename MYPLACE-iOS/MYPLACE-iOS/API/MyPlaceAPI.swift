//
//  MyPlaceAPI.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 2/1/24.
//

import Foundation
import Moya

enum MyPlaceAPI {
    case getHomeViewInformation
    case registerMyPlace(place: MyPlaceInformationEditViewModel)
    case registerFavoritePlace(placeId: Int)
    case deleteFavoritePlace(placeId: Int)
    case searchFavoritePlaceList(body: FavoritePostBodyViewModel)
    case patchFavoritePlaceIsVisited(placeId: Int)
    case getMyPlaceInformation(placeId: Int)
    case getMyPlaceList(keyword: String, page: Int)
}

extension MyPlaceAPI: TargetType {
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
    
    
    var path: String {
        switch self {
        case .getHomeViewInformation:
            return "/place"
        case .registerMyPlace:
            return "/place"
        case .registerFavoritePlace(let placeId):
            return "/place/like/\(placeId)"
        case .deleteFavoritePlace(let placeId):
            return "/place/like/\(placeId)"
        case .searchFavoritePlaceList(let body):
            return "/place/like"
        case .patchFavoritePlaceIsVisited(let placeId):
            return "/place/visit/\(placeId)"
        case .getMyPlaceInformation(let placeId):
            return "/place/\(placeId)"
        case .getMyPlaceList:
            return "/place/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getHomeViewInformation:
            return .get
        case .registerMyPlace:
            return .post
        case .registerFavoritePlace:
            return .post
        case .deleteFavoritePlace:
            return .delete
        case .searchFavoritePlaceList:
            return .post
        case .patchFavoritePlaceIsVisited:
            return .patch
        case .getMyPlaceInformation:
            return .get
        case .getMyPlaceList:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getHomeViewInformation:
            return .requestPlain
        case .registerMyPlace(let place):
            let jsonData = try! JSONEncoder().encode(place)
            return .requestData(jsonData)
        case .registerFavoritePlace:
            return .requestPlain
        case .deleteFavoritePlace:
            return .requestPlain
        case .searchFavoritePlaceList(let body):
            let jsonData = try! JSONEncoder().encode(body)
            return .requestData(jsonData)
        case .patchFavoritePlaceIsVisited:
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
