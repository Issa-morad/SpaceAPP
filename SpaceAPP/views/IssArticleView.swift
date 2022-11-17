//
//  IssArticleView.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-17.
//

import SwiftUI

struct IssArticleView: View {
    
    let timestamp: Int
    let issposition: IssLocation
    let message: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(timestamp)")
                .foregroundColor(.blue)
                .italic()
            
            Text("\(issposition.latitude)")
                    .font(.headline)
                    .padding(8)
            Text("\(issposition.longitude)")
                    .font(.headline)
                    .padding(8)
                Text(message)
                    .lineLimit(6)
                    .font(.body)
                    .padding(8)
        }
    }
}

struct IssArticleView_Previews: PreviewProvider {
    static var previews: some View {
        IssArticleView(timestamp: 0, issposition: IssLocation(latitude: 0.0, longitude: 0.0), message: "dhdcj")
    }
}
