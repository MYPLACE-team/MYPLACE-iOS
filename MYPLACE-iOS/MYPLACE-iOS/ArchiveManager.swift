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
    
    func getArchivePlaceListWithTag (tag: String, page: Int, completion: @escaping (Result<ArchivePlaceListResponse, Error>) -> Void) {
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
    
    func getArchiveDetail(archiveId: Int, completion: @escaping (Result<ArchiveDetailResponse, Error>) -> Void) {
        archiveProvider.request(.getArchiveDetail(archiveId: archiveId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode(ArchiveDetailResponse.self, from: response.data)
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
    
    func registerArchive(query: ArchiveInformationViewModel, completion: @escaping (Int?) -> Void) {
        print("Registering Archive with \(query)")
        archiveProvider.request(.registerArchive(archive: query)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode(ArchiveInformationResponse.self, from: response.data)
                    print(responseData)
                    completion(responseData.result.archiveId)
                } catch let error {
                    print("error 1")
                    print(String(describing: error))
                    completion(nil)
                }
            case let .failure(error):
                print(String(describing: error))
                completion(nil)
            }
        }
    }
    
    func editArchive(archiveId: Int, query: ArchiveInformationViewModel, completion: @escaping (Int?) -> Void) {
        print("Editing Archive with \(query)")
        archiveProvider.request(.editArchive(archiveId: archiveId,archive: query)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode(ArchiveInformationResponse.self, from: response.data)
                    completion(responseData.result.archiveId)
                } catch let error {
                    print("error 1")
                    print(String(describing: error))
                    completion(nil)
                }
            case let .failure(error):
                print(String(describing: error))
                completion(nil)
            }
        }
    }
    
    func deleteArchive(archiveId: Int, completion: @escaping (Error?) -> Void) {
        archiveProvider.request(.deleteArchive(archiveId: archiveId)) { result in
            switch result {
            case .success:
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }
    
    func registFolder(query: ArchiveFolderViewModel, completion: @escaping (Error?) -> Void) {
        print("Registering ArchiveFolder with \(query)")
        archiveProvider.request(.registerFolder(folder: query)) { result in
            switch result {
            case .success:
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }
    
    func editFolder(folderId: Int, query: ArchiveFolderViewModel, completion: @escaping (Error?) -> Void) {
        print("Editing ArchiveFolder with \(query)")
        archiveProvider.request(.editFolder(folderId: folderId, folder: query)) { result in
            switch result {
            case .success:
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }
    
    func deleteFolder(folderId: Int, completion: @escaping (Error?) -> Void) {
        print("Deleting ArchiveFolder")
        archiveProvider.request(.deleteFolder(folderId: folderId)) { result in
            switch result {
            case .success:
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }
}
