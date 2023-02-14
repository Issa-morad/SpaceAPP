//
//  NewsView.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-17.
//

import SwiftUI

struct NewsView: View {
    @StateObject var data = SpaceNew()//view receive the object to initialise it
    @State private var opacity = 0.0 // view own the data, value can change
    var body: some View {
        NavigationView {
            VStack{
                SpaceNewsView()
                    .opacity(opacity)
                
            }
            .navigationTitle("Space News")
            .environmentObject(data)// lets us to create views that rely on shared data, data shared with many views in the app
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
