//
//  ModelData.swift
//  ServiceLocator
//
//  Created by artembolotov on 19.01.2023.
//

import Foundation
import SwiftUI

protocol ModelDataProtocol {
    var articles: [Article] { get }
    
    var canFetchMore: Bool { get }
    var lastIds: [Int] { get }
    var fetchOffset: Int { get }
    
    func fetch()
    
    static var fetchLimit: Int { get }
    static var testArticle: Article { get }
}

final class ModelData: ObservableObject, ModelDataProtocol {
    
    @Injected var newsNetworkService: NewsNetworkServiceProtocol
    
    @Published private(set) var articles = [Article]()
    
    private(set) var canFetchMore = true
    private(set) var lastIds = [Int]()
    private(set) var fetchOffset = 0
    
    private var isFetching = false
    
    func fetch() {
        guard canFetchMore && !isFetching else { return }
        self.isFetching = true
        
        newsNetworkService.articlesGet(limit: ModelData.fetchLimit, start: fetchOffset) { articles in
            if let newArticles = articles {
                let count = newArticles.count
                
                self.canFetchMore = count == ModelData.fetchLimit
                
                self.lastIds = newArticles.suffix(10).map { $0.id }
                self.articles.append(contentsOf: newArticles)
                
                self.fetchOffset += count
                self.isFetching = false
            }
        }
    }
    
    static var fetchLimit: Int {
        return 50
    }
    
    static var testArticle: Article {
        Article(id: 17663, featured: false, title: "L3Harris to acquire Aerojet Rocketdyne for $4.7 billion", url: "https://spacenews.com/l3harris-to-acquire-aerojet-rocketdyne-for-4-7-billion/", imageUrl: "https://spacenews.com/wp-content/uploads/2015/11/RS-25-engines-factory.jpg", newsSite: "SpaceNews", summary: "L3Harris Technologies on Dec. 18 announced an agreement to acquire Aerojet Rocketdyne for $4.7 billion.", publishedAt: "2022-12-18T23:11:46.000Z")
    }
}

