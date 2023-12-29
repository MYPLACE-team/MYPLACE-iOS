//
//  ArchiveView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/28/23.
//

import SwiftUI

struct ArchiveView: View {
    @Binding var path: [HomeViewModel]
    var body: some View {
        Text("")
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    ArchiveBackButton(path: $path)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    ToolBarView(path: $path)
                }
            }
        ZStack {
            Color("MPLightPurple")
                .ignoresSafeArea(.all)
                .padding(.top, 50)
            VStack {
                UnevenRoundedRectangle(bottomLeadingRadius: 20, bottomTrailingRadius: 20)
                    .fill(.white)
                    .frame(height: 270)
                
                Spacer()
            }
        }
        
    }
}



#Preview {
    ArchiveView(path: .constant([]))
}

