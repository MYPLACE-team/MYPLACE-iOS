//
//  ContentView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var items = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        VStack {
            ForEach(items, id: \.self) { item in
                HStack {
                    Text(item)
                        .padding()
                    Spacer()
                }
                .swipeActions {
                    Button(action: {
                        // Perform action when swiped from the leading edge
                        if let index = items.firstIndex(of: item) {
                            items.remove(at: index)
                        }
                    }) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                }
                .swipeActions(edge: .trailing) {
                    Button(action: {
                        // Perform action when swiped from the trailing edge
                        // Your custom action here
                    }) {
                        Label("Custom Action", systemImage: "star")
                    }
                    .tint(.blue)
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
