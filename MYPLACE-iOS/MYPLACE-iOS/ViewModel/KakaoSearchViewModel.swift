//
//  KakaoSearchModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/16/24.
//

import Foundation

class KakaoSearchViewModel: ObservableObject {
    let searchManager = KakaoSearchManager()
    
    @Published var places: [KakaoPlace] = []
    @Published var meta: Meta = Meta(sameName: SameName(region: [], keyword: "", selectedRegion: ""), pageableCount: 0, totalCount: 0, isEnd: false)
    
    func search(query: String) {
        searchManager.searchPlaces(query: query) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.places = response.documents
                    self.meta = response.meta
                }
            case .failure(let error):
                print("Search error: \(error.localizedDescription)")
            }
        }
    }
    
}
