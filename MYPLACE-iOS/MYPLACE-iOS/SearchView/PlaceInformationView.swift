//
//  PlaceInformationView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 1/5/24.
//

import SwiftUI

struct PlaceInformationView: View {
    @Binding var path: [PathModel]
    @Binding var isHeartFilled: Bool
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    TabView {
                        Image("DummyImage2")
                            .resizable()
                            .ignoresSafeArea(.all)
                        Image("DummyImage")
                            .resizable()
                            .ignoresSafeArea(.all)
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 460)
                    VStack {
                        Spacer()
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .background(BackgroundBlurView())
                                .frame(height: 70)
                                .overlay(
                                    VStack {
                                        HStack {
                                            Text("hello")
                                                .padding(.leading, 10)
                                                .font(.system(size: 25))
                                            Spacer()
                                            Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                                                .foregroundStyle(isHeartFilled ? .red : .gray)
                                                .onTapGesture {
                                                    isHeartFilled.toggle()
                                                    let toastMessage = isHeartFilled ? "관심 장소로 저장되었습니다." : "관심 장소 저장이 해제되었습니다."
                                                    ToastViewModel.shared.showToastWithString(text: toastMessage)
                                                }
                                                .padding(.trailing, 10)
                                                .padding(.bottom, 5)
                                        }
                                        HStack {
                                            Text("hello")
                                                .padding(.leading, 10)
                                            Spacer()
                                        }
                                    }
                                    .foregroundStyle(.white)
                                    .font(
                                        .custom("Apple SD Gothic Neo", size: 20)
                                            .weight(.semibold)
                                    )
                                )
                        }

                    }
                    .frame(height: 460)
                }
                Spacer()
            }
            .ignoresSafeArea(.all)
            
            VStack {
                HStack{
                    Button(action: {
                        path.removeLast()
                    }) {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.white)
                            .overlay(
                                Image(systemName: "chevron.backward")
                                    .foregroundStyle(.black)
                                    .bold()
                            )
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                    Spacer()
                }
                Spacer()
            }
        }
        .toolbar(.hidden)
    }
}

struct BackgroundBlurView: UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
        
        DispatchQueue.main.async{
            view.superview?.superview?.backgroundColor = .clear
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}

struct ImageTabView: View {
    let imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(height: 460)

    }
}

#Preview {
    PlaceInformationView(path: .constant([]), isHeartFilled: .constant(true))
}
