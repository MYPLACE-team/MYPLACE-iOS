//
//  KakaoSearchManager.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 2/2/24.
//

import Foundation
import Moya

struct KakaoSearchManager {
    static let shared = KakaoSearchManager()
    let kakaoProvider = MoyaProvider<KakaoAPI>(plugins: [NetworkLoggerPlugin()])
    
    func searchPlaces(query: String, completion: @escaping (Result<SearchResponse, Error>) -> Void) {
        kakaoProvider.request(.searchPlaces(query: query)) { result in
            switch result {
            case let .success(response):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(SearchResponse.self, from: response.data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
