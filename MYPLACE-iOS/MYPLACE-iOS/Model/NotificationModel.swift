//
//  NotificationModel.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/9/24.
//

import SwiftUI

struct NotificationCell: Identifiable, Hashable {
    let id = UUID()
    let icon: String
    let title: String
    let content: [String]
    var read: Bool
}

var notifications: [NotificationCell] = [
    NotificationCell(icon: "check", title: "오늘의 추천", content: ["오늘 카페는 ", "도틀", " 어떠세요?"], read: false),
    NotificationCell(icon: "bookmark",title:"오늘의 제안",content: ["(광고) 이번주 주말은 ","안주마을"," 어떠세요?"], read: true),
    NotificationCell(icon: "star", title: "리마인드", content: ["","러쉬 팝업스토어","가 3일 남았어요!"], read: false),
    NotificationCell(icon: "bookmark", title: "오늘의 제안", content: ["(광고) 점심은 ","돈까스"," 어때요?"], read: true),
    NotificationCell(icon: "star", title: "리마인드", content: ["45일전에 ","유용육 바베큐","를 등록했어요!"], read: true),
    NotificationCell(icon: "check", title: "오늘의 추천", content: ["오늘 카페는 ", "카페모히", " 어떠세요?"], read: false),
    NotificationCell(icon: "star", title: "리마인드", content: ["", "코카콜라 팝업스토어", "가 1일 남았어요!"], read: false)
]

var coupon: [NotificationCell] = [
    NotificationCell(icon:"coupon", title: "쿠폰", content: ["","도틀", " 2,000원 할인 쿠폰이 발급되었어요!"], read: false),
    NotificationCell(icon:"coupon", title: "쿠폰", content: ["","모히", " 3,000원 할인 쿠폰이 발급되었어요!"], read: false)
]
