//
//  SpaceNewsView.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-16.
//

import SwiftUI

struct SpaceNewsView: View {
    @EnvironmentObject var data : SpaceNew
    @Environment(\.openURL) var openURL
    private var textWidth = 300.0
    var body: some View {
        List{
            ForEach(data.news) { news in
                NewsArticleView(title: news.title, imagUrl: news.imageUrl, siteName: news.newsSite, summary: news.summary)
                
                    .onTapGesture {
                        openURL (URL(string: news.url)!)
                    }
            }
            .refreshable {
                data.getNews()
            }
        }
    }
}

struct SpaceNewsView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceNewsView()
            .environmentObject(SpaceNew())
    }
}


/*
 @StateObject var data = SpaceNew()
 @State private var opacity = 0.0
 NavigationView {
 VStack{
     
 }
 .navigationTitle("Space News")
 .environmentObject(data)
 .onAppear{
     data.getNews()
     
     withAnimation(.easeIn(duration: 2)) {
         opacity = 1.0
     }
 }
}
}*/
