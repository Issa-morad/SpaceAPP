//
//  NewsArticleView.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-16.
//

import SwiftUI
import CachedAsyncImage

struct NewsArticleView: View {
    let title: String
    let imagUrl: String
    let siteName: String
    let summary: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(siteName)
                .foregroundColor(.blue)
                .italic()
            HStack(alignment: .center) {
                CachedAsyncImage (url: URL(string: imagUrl),
                                  transaction: Transaction(animation: .easeInOut)) // add animation
                {
                    phase in
                    if let image = phase.image{
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .transition(.opacity) // load image
                    } else {
                        HStack {
                            ProgressView()
                            }
                        }
                    }
                }
                Text(title)
                    .font(.headline)
                    .padding(8)
                Text(summary)
                    .lineLimit(6)
                    .font(.body)
                    .padding(8)
        }
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleView(title: "news", imagUrl: "imag", siteName: "news", summary: "news")
    }
}
