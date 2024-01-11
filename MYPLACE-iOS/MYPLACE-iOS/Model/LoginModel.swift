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
