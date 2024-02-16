//
//  Response.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/16/24.
//

import Foundation

//MARK: - HomeViewResponse
struct HomeViewResponse: Codable {
    let isSuccess: Bool
    let code, message: String
    let result: HomeData
}

// MARK: - MyPlaceListResponse
struct MyPlaceListResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: MyPlaceListInfo
    
    enum CodingKeys: String, CodingKey {
        case isSuccess, code, message
        case result = "result"
    }
}

// MARK: - MyPlaceListInfo
struct MyPlaceListInfo: Codable {
    let totalNum: Int
    let hasNext: Bool
    let place: [MyPlaceList]
}

// MARK: - MyPlaceList
struct MyPlaceList: Codable {
    let id: Int
    let name, address: String
    let categoryId: Int
    let thumbnailUrl: JSONNull
    let isLike: Bool

    enum CodingKeys: String, CodingKey {
        case id, name, address
        case categoryId = "categoryId"
        case thumbnailUrl = "thumbnailUrl"
        case isLike
    }
}

// MARK: - MyPlaceInformationResponse
struct MyPlaceInformationResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: MyPlaceInformation
}

// MARK: - MyPlaceInformation (PlaceInformationView)
struct MyPlaceInformation: Codable {
    let id: Int
    let name, address: String
    let categoryID: Int
    let recDish: String
    let closedDay, service: [String]
    let insta: String
    let hashtag, images: [String]
    let writer, updatedAt: String
    let isLike: Bool

    enum CodingKeys: String, CodingKey {
        case id, name, address
        case categoryID = "categoryId"
        case recDish, closedDay, service, insta, hashtag, images, writer, updatedAt
        case isLike
    }
}

//MARK: - FavoritePlaceResponse
struct FavoritePlaceResponse: Codable {
    let isSuccess: Bool
    let code, message: String
    let result: [FavoritePlace]
}

//MARK: - FavoritePlace
struct FavoritePlace: Codable {
    let id: Int
    let name, address: String
    let categoryID: Int
    let lat, lon: String

    enum CodingKeys: String, CodingKey {
        case id, name, address
        case categoryID = "categoryId"
        case lat, lon
    }
}

// MARK: - SearchResponse
struct SearchResponse: Codable {
    let meta: Meta
    let documents: [KakaoPlace]
}

// MARK: - KakaoPlace
struct KakaoPlace: Codable, Identifiable {
    let id: String
    let placeName, distance: String
    let placeURL: String
    let categoryName, addressName, roadAddressName: String
    let phone, categoryGroupCode, categoryGroupName: String
    let x, y: String

    enum CodingKeys: String, CodingKey {
        case placeName = "place_name"
        case distance
        case placeURL = "place_url"
        case categoryName = "category_name"
        case addressName = "address_name"
        case roadAddressName = "road_address_name"
        case id, phone
        case categoryGroupCode = "category_group_code"
        case categoryGroupName = "category_group_name"
        case x = "x"
        case y = "y"
    }
}

// MARK: - GoogleloginResponse
struct GoogleLoginResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: LoginUserInformation
}

// MARK: - LoginUserInformation (login에서 쓸 정보)
struct LoginUserInformation: Codable, Identifiable {
    let id: Int
    let userId: Int
    let username, email, profile_img, accessToken: String
}

// MARK: - ArchiveUserResponse
struct ArchiveUserResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ArchiveUserResult
}

// MARK: - ArchiveUserResult
struct ArchiveUserResult: Codable {
    let user: ArchiveUser
    let folder: [ArchiveFolder]
}

// MARK: - ArchiveUser
struct ArchiveUser: Codable, Identifiable {
    let id: Int
    let username: String
    let profileImg: String?
    let monthPlaceCount: Int
    let level: Int
    let archiveCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "userId"
        case username, profileImg, monthPlaceCount, level, archiveCount
    }
}

// MARK: - ArchiveFolder
struct ArchiveFolder: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let dateStart: String
    let dateEnd: String
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "folderId"
        case title, dateStart, dateEnd, image
    }
}

// MARK: - ArchiveListResponse
struct ArchivePlaceListResponse: Codable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: [ArchivePlace]
}

// MARK: - ArchivePlace
struct ArchivePlace: Codable, Identifiable, Hashable {
    let id: Int
    let score: Int
    let userId: Int
    let name, address: String
    let thumbnailUrl: String?
    let categoryId: Int
    let hashtag: [String]
}

// MARK: - Archive
struct Archive: Codable, Identifiable {
    let id: Int
    let hashtag: [String]
    let score: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "archiveId"
        case hashtag, score
    }
}

// MARK: - UserInfoResponse
struct UserInfoResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: UserInformation
}

// MARK: - UserInformation
struct UserInformation: Codable, Identifiable {
    let id: Int
    let email, username: String
    let profileImg: String?
    let profile: String
    let level, point, placeCount, archiveCount, avgRate: Int
    let provider: String
    
    enum CodingKeys: String, CodingKey {
        case id = "userId"
        case email, username, profileImg, profile, level, point, placeCount, archiveCount, avgRate, provider
    }
}

// MARK: - ArchiveDetailResponse
struct ArchiveDetailResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ArchiveDetailResult
}

struct ArchiveDetailResult: Codable {
    let place: ArchivePlace
    let archive: ArchiveDetail
}

struct ArchiveDetail: Codable, Identifiable {
    let id: Int
    let title: String
    let createdAt: String
    let count: Int
    let cost: Int
    let menu: String
    let hashtag: [String]
    let score: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "archiveId"
        case title,createdAt,count,cost,menu,hashtag, score
    }
}

// MARK: - Meta
struct Meta: Codable {
    let sameName: SameName
    let pageableCount, totalCount: Int
    let isEnd: Bool

    enum CodingKeys: String, CodingKey {
        case sameName = "same_name"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
        case isEnd = "is_end"
    }
}

// MARK: - SameName
struct SameName: Codable {
    let region: [JSONAny]
    let keyword, selectedRegion: String

    enum CodingKeys: String, CodingKey {
        case region, keyword
        case selectedRegion = "selected_region"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
