//
//  LoginModel.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2024/01/05.
//

import SwiftUI
import KakaoSDKUser
import GoogleSignIn

class LoginModel: ObservableObject {
    
    func googleLogin(completion: @escaping (Bool) -> Void) {
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
            guard let result = signInResult else {return}
            
            guard let profile = result.user.profile else {return }
            
            guard let image = profile.imageURL(withDimension: 180) else {return}
            let name = profile.name
            guard let idToken = result.user.idToken?.tokenString else {return}
            
            LoginManager.shared.googleLogin(accessToken: idToken) { result in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        print(response.isSuccess)
                        print(response.code)
                        print(response.message)
                        print(response.result)
                    }
                case .failure(let error):
                    print("Search errorWhat!!!!!!!!!!!!: \(error.localizedDescription)")
                }
            }
            
            completion(true)
            
            print(image, name, idToken)
        }
    }
    
    func kakaoLogin(completion: @escaping (Bool) -> Void) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            //카톡 설치되어있으면 -> 카톡으로 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오톡으로 로그인 성공")
                    UserApi.shared.me { user, error in
                        if let error = error {
                            print(error)
                        } else {
                            guard let token = oauthToken?.accessToken, let profile = user?.kakaoAccount?.profile?.profileImageUrl,
                                  let name = user?.kakaoAccount?.profile?.nickname else{
                                print("token/name is nil")
                                return
                            }
                            
                            print(token, profile, name)
                            completion(true)
                            //서버에 이메일/토큰/이름 보내주기
                        }
                    }
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    UserApi.shared.me { user, error in
                        if let error = error {
                            print(error)
                        } else {
                            guard let token = oauthToken?.accessToken, let profile = user?.kakaoAccount?.profile?.profileImageUrl,
                                  let name = user?.kakaoAccount?.profile?.nickname else{
                                print("token/name is nil")
                                return
                            }
                            
                            print(token, profile, name)
                            completion(true)                            //서버에 이메일/토큰/이름 보내주기
                        }
                    }
                }
            }
        }
    }
    
    func appleLogin() {
    }
    
    func checkNameAvailability(name: String) -> Bool {
        if(name == "true") {
            return true
        } else {
            return false
        }
    }
}
