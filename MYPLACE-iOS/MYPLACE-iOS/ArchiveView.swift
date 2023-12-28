//
//  ArchiveView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/28/23.
//

import SwiftUI

struct ArchiveView: View {
    var body: some View {
        VStack {
            UnevenRoundedRectangle(bottomLeadingRadius: 20, bottomTrailingRadius: 20)
                .fill(.blue)
                .frame(height: 270)
            
            
            Spacer()
        }
        
    }
}

#Preview {
    ArchiveView()
}
