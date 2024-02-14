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
    
    func registerMyPlace(query: MyPlaceInformationEditViewModel, completion: @escaping (Error?) -> Void) {
        print("Registering place with query@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@: \(query) hi!!!!!!!!!")
        
        myPlaceProvider.request(.registerMyPlace(place: query)) { result in
            switch result {
            case .success:
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }
    
    func registerFavoritePlace(placeId: Int, completion: @escaping (Error?) -> Void) {
        myPlaceProvider.request(.registerFavoritePlace(placeId: placeId)) { result in
            switch result {
            case .success:
                completion(nil)
            case let .failure(error):
                completion(error)
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
    
    //MARK: - path Variable 적용 안된듯?
    func getMyPlaceInformation(placeId: Int, completion: @escaping (Result<MyPlaceInformationResponse, Error>) -> Void) {
        myPlaceProvider.request(.getMyPlaceInformation(placeId: placeId)) { result in
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
    
    func getMyPlaceList(keyword: String, page: Int, completion: @escaping (Result<MyPlaceListResponse, Error>) -> Void) {
        myPlaceProvider.request(.getMyPlaceList(keyword: keyword, page: page)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode(MyPlaceListResponse.self, from: response.data)
                    completion(.success(responseData))
                } catch let error {
                    print("error11111111")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("error222222222")
                completion(.failure(error))
            }
        }
    }



}

