//
//  MYPLACE_iOSApp.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/27/23.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import GoogleSignIn

@main
struct MYPLACE_iOSApp: App {
    init() {
        // Kakao SDK 초기화
        guard let path = Bundle.main.path(forResource: "secret", ofType: "plist") else {
            fatalError("secret.plist 파일을 찾을 수 없습니다.")
        }
        guard let data = FileManager.default.contents(atPath: path) else {
            fatalError("secret.plist 파일을 읽어올 수 없습니다.")
        }
        guard let plistDictionary = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] else {
            fatalError("secret.plist를 NSDictionary로 변환할 수 없습니다.")
        }
        if let kakao_key = plistDictionary["KakaoSDK"] as? String {
           KakaoSDK.initSDK(appKey: kakao_key)
        } else {
            fatalError("BaseURL을 찾을 수 없거나 유효하지 않습니다.")
        }
    }
    
    var body: some Scene {
        WindowGroup {
//            LoginView()
//                .onOpenURL(perform: { url in
//                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
//                        AuthController.handleOpenUrl(url: url)
//                    }})
//                .onOpenURL { url in
//                    GIDSignIn.sharedInstance.handle(url)
//                }
            HomeView()
                .preferredColorScheme(.light)
        }
    }
}
