//
//  PlaceModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/30/23.
//

import SwiftUI

struct Place: Hashable, Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let address: String
}
