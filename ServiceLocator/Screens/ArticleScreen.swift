//
//  ArticleScreen.swift
//  ServiceLocator
//
//  Created by artembolotov on 19.01.2023.
//

import SwiftUI

struct ArticleScreen: View {
    let article: Article
    
    @ObservedObject private var imageModel = ImageModel()
    
    @Injected private var networkService: NewsNetworkServiceProtocol
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(article.title ?? "")
                    .font(.title)
                    .foregroundColor(.primary)
                HStack {
                    Text(article.newsSite ?? "")
                        .font(.footnote)
                    Spacer()
                    Text(article.publishedAtPrettyDate ?? "")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding([.top, .bottom], 8)
                Text(article.summary ?? "")
                    .font(.body)
                    .padding(.bottom)
                
                imageModel.image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
            }
            .padding()
            .onAppear {
                guard let imageURL = article.imageUrl else { return }
                imageModel.fetchImage(url: imageURL)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ArticleScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArticleScreen(article: ModelData.testArticle)
    }
}
