//
//  NotificationView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/28/23.
//

import SwiftUI

struct NotificationView: View {
    @Binding var path: [PathModel]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text("전체")
                          .font(
                            Font.custom("Apple SD Gothic Neo", size: 14)
                              .weight(.bold)
                          )
                          .foregroundColor(Color(red: 0.4, green: 0.35, blue: 0.96))
                        Text("0")
                          .font(
                            Font.custom("Apple SD Gothic Neo", size: 12)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0.2, green: 0.25, blue: 0.33))
                          .background(Color(red: 0.95, green: 0.96, blue: 0.97))
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BasicBackButton(path: $path)
            }
            ToolbarItem(placement: .principal) {
                Text("알림")
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
    NotificationView(path: .constant([]))
}
