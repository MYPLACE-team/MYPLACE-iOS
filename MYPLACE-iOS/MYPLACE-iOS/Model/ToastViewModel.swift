//
//  ToastViewModel.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/31/23.
//

import SwiftUI

class ToastViewModel: ObservableObject {
    static let shared = ToastViewModel()
    @Published var showToast = false
    @Published var toastMessage = ""
    
    func showToastWithString(text: String) {
        self.toastMessage = text
        self.showToast = true
    }
}



