//
//  MYPLACE_iOSApp.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/27/23.
//

import SwiftUI
//import KakaoSDKCommon
//import KakaoSDKAuth

@main
struct MYPLACE_iOSApp: App {
    
//    init() {
//        // Kakao SDK 초기화
//        KakaoSDK.initSDK(appKey: "78756fd73a212ebe5b9f720292d65d1a")
//    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
//            LoginView().onOpenURL(perform: { url in
//                if (AuthApi.isKakaoTalkLoginUrl(url)) {
//                    AuthController.handleOpenUrl(url: url)
//                }
//            })
        }
    }
}
