//
//  ArchiveViewModel.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/15/24.
//

import Foundation

class ArchiveUserViewModel: ObservableObject {
    static let shared = ArchiveUserViewModel()
    let archiveManager = ArchiveManager()
    
    @Published var user: ArchiveUser = ArchiveUser(id: 1, username: "test", profileImg: "test", monthPlaceCount: 1, level: 1, archiveCount: 1)
    @Published var folders: [ArchiveFolder] = [ArchiveFolder(id: 1, title: "부산여행부산여행", dateStart: "3", dateEnd: "2024-01-01T15:00:00.000Z", image: "test")]
    
    func getArchiveUserInfo() {
        archiveManager.getArchiveUserInfo { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.user = response.result.user
                    self.folders = response.result.folder
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
}
