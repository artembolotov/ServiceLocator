//
//  ContentView.swift
//  ServiceLocator
//
//  Created by artembolotov on 19.01.2023.
//

import SwiftUI

struct NewsScreen: View {
    
    @ObservedObject var viewModel = ModelData()
    
    var body: some View {
        NavigationView(content: {
            List(viewModel.articles) { article in
                NavigationLink {
                    ArticleScreen(article: article)
                } label: {
                    ArticleCell(article: article)
                }
                .onAppear{
                    if viewModel.lastIds.contains(article.id) {
                        viewModel.fetch()
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Spaceflight News")
        })
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}
