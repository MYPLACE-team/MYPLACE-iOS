//
//  MyPlaceManager.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 2/2/24.
//

import Foundation
import Moya

struct MyPlaceManager {
    static let shared = MyPlaceManager()
    let placeInformationProvider = MoyaProvider<MyPlaceAPI>(plugins: [NetworkLoggerPlugin()])
    
    func registerPlace(query: MyPlaceInformationViewModel, completion: @escaping (Result<Response, Error>) -> Void) {
        print("Registering place with query@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@: \(query) hi!!!!!!!!!")
        
        placeInformationProvider.request(.registerMyPlace(place: query)) { result in
            switch result {
            case let .success(response):
                print("Status code: \(response.statusCode)")
                completion(.success(response))
            case let .failure(error):
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}

