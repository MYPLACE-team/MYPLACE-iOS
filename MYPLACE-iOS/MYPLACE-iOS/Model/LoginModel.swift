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
            
            let image = profile.imageURL(withDimension: 180)
            let name = profile.name
            let idToken = result.user.idToken
            
            completion(true)
            
            print(image, name, idToken)
        }
    }
    
    func kakaoLogin(completion: @escaping (Bool) -> Void) {
        var result = false
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
                            
                            print(token, name)
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
                            
                            print(token, name)
                            completion(true)                            //서버에 이메일/토큰/이름 보내주기
                        }
                    }
                }
            }
        }
    }
    
    func kakaoLoginthroughAPI() {
        
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
