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
    
    @Published var user: ArchiveUser = ArchiveUser(id: 0, username: "", profileImg: "", monthPlaceCount: 0, level: 0, archiveCount: 0)
    @Published var folders: [ArchiveFolder] = []
    
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

class ArchiveInformationViewModel: ObservableObject, Codable {
    static let shared = ArchiveInformationViewModel()
    
    @Published var placeId: Int
    @Published var score: Int
    @Published var isPublic: Bool
    @Published var folder: Int
    @Published var title: String
    @Published var comment: String
    @Published var images: [String]
    @Published var hashtag: [String]
    @Published var menu: String
    @Published var price: Int
    @Published var visitedDate: String
    
    private init() {
        self.placeId = 0
        self.score = 0
        self.isPublic = true
        self.folder = 0
        self.title = ""
        self.comment = ""
        self.images = []
        self.hashtag = []
        self.menu = ""
        self.price = 0
        self.visitedDate = ""
    }
    
    // Decodable을 준수하기 위한 이니셜라이저
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        placeId = try container.decode(Int.self, forKey: .placeId)
        score = try container.decode(Int.self, forKey: .score)
        isPublic = try container.decode(Bool.self, forKey: .isPublic)
        folder = try container.decode(Int.self, forKey: .folder)
        title = try container.decode(String.self, forKey: .title)
        comment = try container.decode(String.self, forKey: .comment)
        images = try container.decode([String].self, forKey: .images)
        hashtag = try container.decode([String].self, forKey: .hashtag)
        menu = try container.decode(String.self, forKey: .menu)
        price = try container.decode(Int.self, forKey: .price)
        visitedDate = try container.decode(String.self, forKey: .visitedDate)
    }

    // Encodable을 준수하기 위한 함수
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(placeId, forKey: .placeId)
        try container.encode(score, forKey: .score)
        try container.encode(isPublic, forKey: .isPublic)
        try container.encode(folder, forKey: .folder)
        try container.encode(title, forKey: .title)
        try container.encode(comment, forKey: .comment)
        try container.encode(images, forKey: .images)
        try container.encode(hashtag, forKey: .hashtag)
        try container.encode(menu, forKey: .menu)
        try container.encode(price, forKey: .price)
        try container.encode(visitedDate, forKey: .visitedDate)
    }
    
    private enum CodingKeys: String, CodingKey {
        case placeId
        case score
        case isPublic
        case folder
        case title
        case comment
        case images
        case hashtag
        case menu
        case price
        case visitedDate
    }
    
    func reset() {
        self.placeId = 0
        self.score = 0
        self.isPublic = true
        self.folder = 0
        self.title = ""
        self.comment = ""
        self.images = []
        self.hashtag = []
        self.menu = ""
        self.price = 0
        self.visitedDate = ""
    }
}

class ArchiveFolderViewModel: ObservableObject {
    
}
