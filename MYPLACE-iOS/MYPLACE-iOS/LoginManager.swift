//
//  LoginManger.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/15/24.
//

import Foundation
import Moya

struct LoginManager {
    static let shared = LoginManager()
    let loginProvider = MoyaProvider<LoginAPI>(plugins: [NetworkLoggerPlugin()])
    
    func googleLogin(accessToken: String, completion: @escaping (Result<GoogleLoginResponse, Error>) -> Void) {
        loginProvider.request(.googleLogin(accessToken: accessToken)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode(GoogleLoginResponse.self, from: response.data)
                    print(responseData)
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
    
    // MARK: - 성공
    func getUserInfo (userId: String, completion: @escaping (Result<UserInfoResponse, Error>) -> Void) {
        loginProvider.request(.getUserInfo(userId: userId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode(UserInfoResponse.self, from: response.data)
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
    
    // MARK: - 검사해야함
    func setUserInfo (userId: String, info: UserInfoViewModel, completion: @escaping (Error?) -> Void) {
        loginProvider.request(.setUserInfo(userId: userId, info: info)) { result in
            switch result {
            case .success:
                print(result)
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }
}
