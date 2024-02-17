//
//  ArchiveViewModel.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/15/24.
//

import Foundation

class ArchiveUserViewModel: ObservableObject {
    static let shared = ArchiveUserViewModel()
    let archiveManager = ArchiveManager.shared
    
    @Published var user: ArchiveUser = ArchiveUser(id: 1, username: "test", profileImg: "test", monthPlaceCount: 1, level: 1, archiveCount: 1)
    @Published var folders: [ArchiveFolder] = [ArchiveFolder(id: 1, title: "부산여행부산여행", dateStart: "3", dateEnd: "2024-01-01T15:00:00.000Z", image: "test")]
    
    // MARK: - 성공
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

class ArchiveListViewModel: ObservableObject {
    static let shared = ArchiveListViewModel()
    let archiveManager = ArchiveManager.shared
    
    @Published var archivePlaceList: [ArchivePlace] = [ArchivePlace(id: 1, score: 1, userId: 1, name: "test", address: "test", thumbnailUrl: "DummyImg", categoryId: 1, hashtag: ["탕수육", "짜장면"])]
    
    // MARK: - 되는지 검사해야함
    func getArchiveList() {
        archiveManager.getArchivePlaceList(page: 1) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.archivePlaceList = response.result
                    print(self.archivePlaceList)
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    // MARK: - 되는지 검사해야함
    func getArchiveListWithTag(tag: [String]) {
        var param = ""
        if(tag.count == 1) {
            param = tag[0]
        } else if(tag.count == 2) {
            param = tag.joined(separator: ",")
        }
        archiveManager.getArchivePlaceListWithTag(tag: param, page: 1) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.archivePlaceList = response.result
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

class ArchiveDetailViewModel: ObservableObject {
    static let shared = ArchiveDetailViewModel()
    let archiveManager = ArchiveManager.shared
    
    @Published var archiveDetail: ArchiveDetail = ArchiveDetail(archiveID: 1, title: "test", createdAt: "2023-02-27T15:00:00.000Z", count: 1, price: 1, menu: "test", score: 1, comment: "test", images: ["DummyImg"], hashtag: ["tag1", "tag2"], visitedDate: "2023-02-27T15:00:00.000Z", isPublic: true, folderID: 1, folderName: "test")
    @Published var archiveDetailPlace: ArchiveDetailPlace = ArchiveDetailPlace(placeID: 1, name: "test", address: "test", categoryID: 1, isLike: 1, thumbnail: "DummyImg")
    
    // MARK: - 되는지 검사해야함
    func getArchiveDetail(archiveId: Int) {
        archiveManager.getArchiveDetail(archiveId: archiveId) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.archiveDetail = response.result.archive
                    self.archiveDetailPlace = response.result.place
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
}
