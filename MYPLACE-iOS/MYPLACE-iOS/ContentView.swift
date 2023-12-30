//
//  ContentView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isPopupPresented = false

    var body: some View {
        ZStack {
            VStack {
                Text("Your Main Content")
                Button("Show Popup") {
                    isPopupPresented.toggle()
                }
            }
            .padding()

            if isPopupPresented {
                Color.black.opacity(0.4) // Background blur
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Text("Popup Content")
                        .font(.title)
                        .padding()

                    Button("Close Popup") {
                        isPopupPresented.toggle()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .background(Color.white)
                .cornerRadius(15)
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
