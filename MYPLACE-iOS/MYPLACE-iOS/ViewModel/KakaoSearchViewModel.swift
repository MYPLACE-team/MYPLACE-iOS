//
//  KakaoSearchModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/16/24.
//

import Foundation
import Moya
import CoreLocation

class KakaoSearchViewModel: ObservableObject {
    let kakaoProvider = MoyaProvider<KakaoAPI>(plugins: [NetworkLoggerPlugin()])
    @Published var places: [Place] = []
    @Published var meta: Meta = Meta(sameName: SameName(region: [], keyword: "", selectedRegion: ""), pageableCount: 0, totalCount: 0, isEnd: false)
    private var locationManager = CLLocationManager()
    
    func searchPlaces(query: String) {
        locationManager.requestWhenInUseAuthorization()
        var latitude = 37.514322572335935
        var longitude = 127.06283102249932
        
        if let userLocation = locationManager.location?.coordinate {
            latitude = userLocation.latitude
            longitude = userLocation.longitude
        }
        
        kakaoProvider.request(.searchPlaces(query: query, y: latitude, x: longitude, radius: 2000)) { result in
            switch result {
            case let .success(response):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(SearchResponse.self, from: response.data)
                    DispatchQueue.main.async {
                        self.places = result.documents
                        self.meta = result.meta
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            case let .failure(error):
                print("Network request failed: \(error.localizedDescription)")
            }
        }
    }
}
