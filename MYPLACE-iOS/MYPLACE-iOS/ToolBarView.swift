//
//  ToolBarView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/29/23.
//

import SwiftUI

struct ToolBarPreview: View{
    var body: some View {
        VStack {
            BasicBackButton(path: .constant([]))
            ArchiveBackButton(path: .constant([]))
            ToolBarView(path: .constant([]))
        }
    }
}

struct ToolBarView: View {
    @Binding var path: [PathModel]
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    path.append(.settingView)
                }) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                }
                .padding(.trailing, 5)
                
                Button(action: {
                    path.append(.notificationView)
                }) {
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

struct BasicBackButton: View {
    @Binding var path: [PathModel]
    var body: some View {
        Button(action: {
            if path.count > 0 {
                path.removeLast()
            }
        }) {
            HStack {
                Image(systemName: "chevron.left")
            }
            .foregroundStyle(.black)
        }
    }
}

struct ArchiveBackButton: View {
    @Binding var path: [PathModel]
    var body: some View {
        Button(action: {
            if path.count > 0 {
                path.removeLast()
            }
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("아카이브")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 30)
                        .weight(.bold)
                    )
            }
            .foregroundStyle(.black)
        }
    }
}


#Preview {
    ToolBarPreview()
}


