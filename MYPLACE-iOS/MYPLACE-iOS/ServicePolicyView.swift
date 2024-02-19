//
//  ServicePolicyView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/19/24.
//

import SwiftUI

struct ServicePolicyView: View {
    @Binding var path: [PathModel]
    var body: some View {
        ScrollView{
            VStack(alignment: .leading,spacing: 0) {
                Text("🏦 마플 서비스 이용약관")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 24)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                
                
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BasicBackButton(path: $path)
            }
        }
    }
}

#Preview {
    ServicePolicyView(path: .constant([]))
}
