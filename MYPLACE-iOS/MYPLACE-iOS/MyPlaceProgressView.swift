//
//  MyPlaceProgressView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 2/21/24.
//

import SwiftUI

struct MyPlaceProgressView: View {
    @State private var isFirstJumped = false
    @State private var isSecondJumped = false
    @State private var isThirdJumped = false
    
    let delayTime = 2.0

    var body: some View {
        VStack {
            HStack(spacing: 30) {
                Circle()
                    .fill(isFirstJumped ? Color.accentColor : Color(red: 0.76, green: 0.74, blue: 1, opacity: 0.6))
                    .frame(width: 20, height: 20)
                    .offset(y: isFirstJumped ? -30 : 0)
                    .onAppear {
                        withAnimation(.easeInOut(duration: delayTime / 3)) {
                            isFirstJumped.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime / 3) {
                            withAnimation(.easeInOut(duration: delayTime / 3)) {
                                isFirstJumped.toggle()
                            }
                        }
                    }
                
                Circle()
                    .fill(isSecondJumped ? Color.accentColor : Color(red: 0.76, green: 0.74, blue: 1, opacity: 0.6))
                    .frame(width: 20, height: 20)
                    .offset(y: isSecondJumped ? -30 : 0)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime / 3) {
                            withAnimation(.easeInOut(duration: delayTime / 3)) {
                                isSecondJumped.toggle()
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime / 1.5) {
                            withAnimation(.easeInOut(duration: delayTime / 3)) {
                                isSecondJumped.toggle()
                            }
                        }
                    }
                
                Circle()
                    .fill(isThirdJumped ? Color.accentColor : Color(red: 0.76, green: 0.74, blue: 1, opacity: 0.6))
                    .frame(width: 20, height: 20)
                    .offset(y: isThirdJumped ? -30 : 0)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime / 1.5) {
                            withAnimation(.easeInOut(duration: delayTime / 3)) {
                                isThirdJumped.toggle()
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
                            withAnimation(.easeInOut(duration: delayTime / 3)) {
                                isThirdJumped.toggle()
                            }
                        }
                    }
            }
            Text("로딩중이에요......")
                .font(
                    Font.custom("Apple SD Gothic Neo", size: 20)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .padding(.top, 10)
        }
    }
}

#Preview {
    MyPlaceProgressView()
}
