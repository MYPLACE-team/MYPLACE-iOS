//
//  PopupModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/25/24.
//

import Foundation

enum PlaceType: Int, CaseIterable, RawRepresentable {
    case cafe
    case chinese
    case japanese
    case western
    case korean
    case bar
    case dessert
    case culturalSpace
    case asian
    case meat
    case popupStore
    case etc

    init?(rawValue: Int) {
        switch rawValue {
        case 1: self = .cafe
        case 2: self = .chinese
        case 3: self = .japanese
        case 4: self = .western
        case 5: self = .korean
        case 6: self = .bar
        case 7: self = .dessert
        case 8: self = .culturalSpace
        case 9: self = .asian
        case 10: self = .meat
        case 11: self = .popupStore
        case 0: self = .etc
        default: return nil
        }
    }

    var rawValue: Int {
        switch self {
        case .cafe: return 1
        case .chinese: return 2
        case .japanese: return 3
        case .western: return 4
        case .korean: return 5
        case .bar: return 6
        case .dessert: return 7
        case .culturalSpace: return 8
        case .asian: return 9
        case .meat: return 10
        case .popupStore: return 11
        case .etc: return 0
        }
    }
    
    var stringValue: String {
        switch self {
        case .cafe: return "카페"
        case .chinese: return "중식"
        case .japanese: return "일식"
        case .western: return "양식"
        case .korean: return "한식"
        case .bar: return "술집"
        case .dessert: return "디저트"
        case .culturalSpace: return "문화공간"
        case .asian: return "아시안"
        case .meat: return "고기"
        case .popupStore: return "팝업스토어"
        case .etc: return "기타"
        }
    }

    
    func emojiForCategory() -> String {
        switch self {
        case .cafe:
            return "☕️"
        case .chinese:
            return "🥟"
        case .japanese:
            return "🍣"
        case .western:
            return "🍕"
        case .korean:
            return "🍚"
        case .bar:
            return "🍻"
        case .dessert:
            return "🍰"
        case .culturalSpace:
            return "📒"
        case .asian:
            return "🧋"
        case .meat:
            return "🥩"
        case .popupStore:
            return "🛍️"
        case .etc:
            return "📂"
        }
    }
}

enum Holiday: String, CaseIterable {
    case monday = "월요일"
    case tuesday = "화요일"
    case wednesday = "수요일"
    case thursday = "목요일"
    case friday = "금요일"
    case saturday = "토요일"
    case sunday = "일요일"
    case holiday = "공휴일"
    case allYearRound = "연중무휴"
}

enum ProvidedService: String, CaseIterable {
    case cheapPrice = "💰 저렴한 가격"
    case friendlyService = "☺️ 친절한 서비스"
    case niceView = "⛰️ 좋은 뷰"
    case parkingAvailable = "🚗 주차 가능"
    case comfortableSeats = "💺 편안한 좌석"
    case bestTaste = "🤤 최고의 맛"
    case quietPlace = "🎧 집중하기 좋은 곳"
    case goodAtmosphere = "💐 좋은 분위기"
    case kidsZone = "👶🏻 키즈존"
    case petFriendly = "😻 반려동물 동반"
    case goodMusic = "🎶 좋은 음악 큐레이션"
}


extension PlaceType {
    static func emojiForCategory(from categoryID: Int) -> String {
        if let placeType = PlaceType(rawValue: categoryID) {
            return placeType.emojiForCategory()
        } else {
            return PlaceType.cafe.emojiForCategory()
        }
    }
}
