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
    
    func getUserInfo (userId: Int, completion: @escaping (Result<UserInfoResponse, Error>) -> Void) {
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
    
    func setUserInfo (userId: Int, info: UserEditViewModel, completion: @escaping (Result<UserInfoResponse, Error>) -> Void) {
        print("Registering Archive with \(info)")
        loginProvider.request(.setUserInfo(userId: userId, info: info)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode(UserInfoResponse.self, from: response.data)
                    completion(.success(responseData))
                } catch let error {
                    print("error 1")
                    print(String(describing: error))
                    completion(.failure(error))
                }
            case let .failure(error):
                print(String(describing: error))
                completion(.failure(error))
            }
        }
    }
}
