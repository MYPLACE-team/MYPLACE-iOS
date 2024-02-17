//
//  ArchiveAPI.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/15/24.
//

import Foundation
import Moya

enum ArchiveAPI {
    case getArchiveUser
    case getArchiveList(page: Int)
    case getArchiveListWithTag(tag: String, page: Int)
    case getArchiveDetail(archiveId: Int)
}

extension ArchiveAPI: TargetType {
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
        case .getArchiveUser:
            return "/archive"
        case .getArchiveList:
            return "/archive/search"
        case .getArchiveListWithTag:
            return "/archive/search"
        case .getArchiveDetail(let archiveId):
            return "/archive/\(archiveId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getArchiveUser:
            return .get
        case .getArchiveList:
            return .get
        case .getArchiveListWithTag:
            return .get
        case .getArchiveDetail:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getArchiveUser:
            return .requestPlain
        case .getArchiveList(let page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)
        case .getArchiveListWithTag(let tag, let page):
            return .requestParameters(parameters: ["tag": tag, "page": page], encoding: URLEncoding.queryString)
        case .getArchiveDetail:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getArchiveUser:
            return ["Content-type": "application/json"]
        case .getArchiveList:
            return ["Content-type": "application/json"]
        case .getArchiveListWithTag:
            return ["Content-type": "application/json"]
        case .getArchiveDetail:
            return ["Content-type": "application/json"]
        }
    }
    
    var sampleData: Data {
        return Data()
    }
}
