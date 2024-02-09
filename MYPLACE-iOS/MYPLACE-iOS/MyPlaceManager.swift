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
    let myPlaceProvider = MoyaProvider<MyPlaceAPI>(plugins: [NetworkLoggerPlugin()])
    
    func registerMyPlace(query: MyPlaceInformationEditViewModel, completion: @escaping (Result<Response, Error>) -> Void) {
        print("Registering place with query@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@: \(query) hi!!!!!!!!!")
        
        myPlaceProvider.request(.registerMyPlace(place: query)) { result in
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
    
    func searchFavoritePlaceList(completion: @escaping (Result<FavoritePlaceResponse, Error>) -> Void) {
        myPlaceProvider.request(.searchFavoritePlaceList) { result in
            switch result {
            case let .success(response):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(FavoritePlaceResponse.self, from: response.data)
                    completion(.success(result))
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(.failure(error))
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
                completion(.failure(error))
            }
        }
    }
    
    func getMyPlaceInformation(completion: @escaping (Result<MyPlaceInformationResponse, Error>) -> Void) {
        myPlaceProvider.request(.getMyPlaceInformation) { result in
            switch result {
            case let .success(response):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(MyPlaceInformationResponse.self, from: response.data)
                    completion(.success(result))
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(.failure(error))
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
                completion(.failure(error))
            }
        }
        
    }

}

