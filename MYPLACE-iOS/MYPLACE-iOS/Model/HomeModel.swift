//
//  HomeModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 2/15/24.
//

import Foundation

// MARK: - HomeData
struct HomeData: Codable {
    let username: String
    let placeList: [HomeFavPlaceList]
}

// MARK: - PlaceList
struct HomeFavPlaceList: Codable {
    let id: Int
    let name, address: String
}
