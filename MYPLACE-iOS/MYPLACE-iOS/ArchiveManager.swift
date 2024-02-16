//
//  ArchiveManager.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/15/24.
//

import Foundation
import Moya

struct ArchiveManager {
    static let shared = ArchiveManager()
    let archiveProvider = MoyaProvider<ArchiveAPI>(plugins: [NetworkLoggerPlugin()])
    
    func getArchiveUserInfo (completion: @escaping (Result<ArchiveUserResponse, Error>) -> Void) {
        archiveProvider.request(.getArchiveUser) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode(ArchiveUserResponse.self, from: response.data)
                    print("success")
                    completion(.success(responseData))
                } catch let error {
                    print("error 1")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("error 2")
                completion(.failure(error))
            }
        }
    }
    
    func getArchivePlaceList (page: Int, completion: @escaping (Result<ArchivePlaceListResponse, Error>) -> Void) {
        archiveProvider.request(.getArchiveList(page: page)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode(ArchivePlaceListResponse.self, from: response.data)
                    print("success")
                    completion(.success(responseData))
                } catch let error {
                    print("error 1")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("error 2")
                completion(.failure(error))
            }
        }
    }
    
    func getArchivePlaceListWithTag (tag: [String], page: Int, completion: @escaping (Result<ArchivePlaceListResponse, Error>) -> Void) {
        archiveProvider.request(.getArchiveListWithTag(tag: tag, page: page)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode(ArchivePlaceListResponse.self, from: response.data)
                    print("success")
                    completion(.success(responseData))
                } catch let error {
                    print("error 1")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("error 2")
                completion(.failure(error))
            }
        }
    }
    
}
