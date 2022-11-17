//
//  NewsView.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-17.
//

import SwiftUI

struct NewsView: View {
    @StateObject var data = SpaceNew()
    @State private var opacity = 0.0
    
    var body: some View {
       
        NavigationView {
            VStack{
                SpaceNewsView()
                    .opacity(opacity)
                
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
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
