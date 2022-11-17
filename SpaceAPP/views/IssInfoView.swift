//
//  IssInfoView.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-17.
//

import SwiftUI

struct IssInfoView: View {
    @EnvironmentObject var data : IssManger
    @Environment(\.openURL) var openURL
    
    private var textWidth = 300.0
    var body: some View {
        HStack{
            if let iss == data.iss { iss in
                
                IssArticleView(timestamp:iss.timestamp , issposition: IssLocation(latitude: iss.issposition.latitude, longitude: iss.issposition.longitude), message: iss.message)
                }
    
            }
        }
    }

struct IssInfoView_Previews: PreviewProvider {
    static var previews: some View {
        IssInfoView()
            .environmentObject(IssManger())
    }
}

