//
//  PopupModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/25/24.
//

import Foundation

enum PlaceType: String, CaseIterable {
    case cafe = "카페"
    case chinese = "중식"
    case japanese = "일식"
    case western = "양식"
    case korean = "한식"
    case bar = "술집"
    case dessert = "디저트"
    case culturalSpace = "문화공간"
    case asian = "아시안"
    case meat = "고기"
    case popupStore = "팝업스토어"
    case etc = "기타"
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
