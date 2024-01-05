//
//  ToastView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/31/23.
//

import SwiftUI

struct ToastView: View {
    @State var showAlert = false
    @StateObject var toastViewModel = ToastViewModel.shared
    var body: some View {
        ZStack {
            Color.white
            Text("Order Toast")
                .foregroundStyle(.blue)
                .onTapGesture {
                    ToastViewModel.shared.showToastWithString(text: "Toast Is Ready!")
                }
        }
        .ignoresSafeArea(.all)
//        .alert(isPresented: $showAlert) {
//            Alert(title: Text("Alert"), message: Text("This is an example of an alert controller"), dismissButton: .default(Text("Ok")))
//        }
        .toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: Toast.time)
    }
}
extension View {
    func toast(message: String,
               isShowing: Binding<Bool>,
               duration: TimeInterval) -> some View {
        self.modifier(Toast(isShowing: isShowing,
                            showMessage: message,
                            hideMessage: message,
                            config: .init(duration: duration)))
    }
}
struct Toast: ViewModifier {
    static let time: TimeInterval = 2
    @Binding var isShowing: Bool
    let showMessage: String
    let hideMessage: String
    
    let config: Config
    func body(content: Content) -> some View {
        ZStack {
            content
            toastView
        }
    }
    
    private var toastView: some View {
        VStack {
            Spacer()
            if isShowing {
                Group {
                    Text(showMessage)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(config.textColor)
                        .font(config.font)
                        .padding(.vertical, 16)
                        .padding(.horizontal, 30)
                }
                .background(Capsule().foregroundStyle(config.backgroundColor))
                .cornerRadius(8)
                .onTapGesture {
                    isShowing = false
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + config.duration) {
                        isShowing = false
                    }
                }
            }
        }
//        .padding(.horizontal, 16)
//        .padding(.bottom, 10)
        .animation(config.animation, value: isShowing)
        .transition(config.transition)
    }
    struct Config {
        let textColor: Color
        let font: Font
        let backgroundColor: Color
        let duration: TimeInterval
        let transition: AnyTransition
        let animation: Animation
        init(textColor: Color = .white,
             font: Font = .system(size: 14),
             backgroundColor: Color = .black.opacity(0.588),
             duration: TimeInterval = Toast.time,
             transition: AnyTransition = .opacity,
             animation: Animation = .linear(duration: 0.3))
        {
            self.textColor = textColor
            self.font = font
            self.backgroundColor = backgroundColor
            self.duration = duration
            self.transition = transition
            self.animation = animation
        }
    }
}

    

#Preview {
    ToastView()
}
