//
//  LoginModel.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2024/01/05.
//

import SwiftUI

class LoginModel: ObservableObject {
    func googleLogin() {
        
    }
    
    func kakaoLogin() {
//        if (UserApi.isKakaoTalkLoginAvailable()) {
//            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                }
//                else {
//                    print("loginWithKakaoTalk() success.")
//
//                    //do something
//                    _ = oauthToken
//                }
//            }
//        }
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
