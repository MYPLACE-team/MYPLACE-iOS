//
//  ArchiveModel.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2024/01/12.
//

import SwiftUI


struct ArchiveModel:Hashable, Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let address: String
    let type: String
    let tag: [String]
    let rating: Int
}

let archivePlaces: [ArchiveModel] = [
    ArchiveModel(imageName: "DummyImage1", name: "도틀", address: "서울시 종로구", type: "카페", tag: ["카페", "스콘"], rating: 4),
    ArchiveModel(imageName: "DummyImage2", name: "진더미엔", address: "서울시 중구", type: "중식", tag: ["중식", "우육면"], rating: 3),
    ArchiveModel(imageName: "DummyImage2", name: "크림시크", address: "서울시 중구", type: "카페", tag: ["커피", "명동"], rating: 4),
    ArchiveModel(imageName: "DummyImage2", name: "맛차", address: "서울시 중구", type: "카페", tag: ["녹차", "디저트"], rating: 4),
    ArchiveModel(imageName: "DummyImage2", name: "진더미엔", address: "서울시 중구", type: "카페", tag: ["카페", "스콘"], rating: 4)
]
