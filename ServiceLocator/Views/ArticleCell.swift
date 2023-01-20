//
//  ArticleCell.swift
//  ServiceLocator
//
//  Created by artembolotov on 19.01.2023.
//

import SwiftUI

struct ArticleCell: View {
    
    var article: Article
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(article.title ?? "")
                    .font(.headline)
                    .padding([.top, .bottom])
                Text(article.summary ?? "")
                    .font(.body)
                    .lineLimit(2)
                HStack {
                    Text(article.newsSite ?? "")
                        .font(.footnote)
                    Spacer()
                    Text(article.publishedAtPrettyDate ?? "")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding(.top)
            }
        }
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(article: ModelData.testArticle)
            .previewLayout(.fixed(width: 300, height: 170))
    }
}
