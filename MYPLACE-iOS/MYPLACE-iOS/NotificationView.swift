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
