//
//  IssView.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-17.
//

import SwiftUI

struct IssView: View {
    @StateObject var data = IssManger()
    @State private var opacity = 0.0
    var body: some View {
        NavigationView {
            VStack{
                IssInfoView()
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
struct IssView_Previews: PreviewProvider {
    static var previews: some View {
        IssView()
    }
}
