//
//  NotificationSettingView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/14/24.
//

import SwiftUI

struct NotificationSettingView: View {
    @State private var favoriteNotification: Bool = false
    @State private var eventNotification: Bool = false
    
    @StateObject private var toastViewModel = ToastViewModel.shared
    
    @Binding var path: [PathModel]
    
    var body: some View {
        VStack(spacing: 0) {
            Image("NotificationSetting")
                .resizable()
                .frame(width: 326, height: 326)
                .padding(.top, 24)
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("관심장소 알림")
                      .font(
                        Font.custom("Apple SD Gothic Neo", size: 18)
                          .weight(.medium)
                      )
                      .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    Text("관심장소 제안 수신 동의에 대한 알림")
                      .font(
                        Font.custom("Apple SD Gothic Neo", size: 14)
                          .weight(.medium)
                      )
                      .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                      .padding(.top, 6)
                }
                Spacer()
                Toggle("favoriteNotification", isOn: $favoriteNotification)
                    .labelsHidden()
                    .onChange(of: favoriteNotification) {
                        if(favoriteNotification == true) {
                            toastViewModel.showToastWithString(text:"관심장소 제안 알림을 켰어요.")
                        } else {
                            toastViewModel.showToastWithString(text:"관심장소 제안 알림을 껐어요.")
                        }
                    }
            }
            .frame(width: 320)
            .padding(.top, 32)
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("혜택 알림")
                      .font(
                        Font.custom("Apple SD Gothic Neo", size: 18)
                          .weight(.medium)
                      )
                      .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    Text("광고성 정보 수신 동의에 의한 쿠폰 등 혜택 알림")
                      .font(
                        Font.custom("Apple SD Gothic Neo", size: 14)
                          .weight(.medium)
                      )
                      .foregroundStyle(Color(red: 0.45, green: 0.47, blue: 0.5))
                      .padding(.top, 6)
                }
                Spacer()
                Toggle("eventNotification", isOn: $eventNotification)
                    .labelsHidden()
                    .onChange(of: eventNotification) {
                        if(eventNotification == true) {
                            toastViewModel.showToastWithString(text:"혜택 알림을 켰어요.")
                        } else {
                            toastViewModel.showToastWithString(text:"혜택 알림을 껐어요.")
                        }
                    }
            }
            .frame(width: 320)
            .padding(.top, 60)
            Spacer()
            
        }
        .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BasicBackButton(path: $path)
            }
            ToolbarItem(placement: .principal) {
                Text("알림 설정")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
            }
        }
    }
}

#Preview {
    NotificationSettingView(path: .constant([]))
}
