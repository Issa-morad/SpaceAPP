//
//  IssView.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-17.
//

import SwiftUI

struct IssView: View {
    @State var  iss = Iss.default
    var body: some View {
        NavigationStack {
            VStack{
                HStack {
                    Text("ISS")
                        .bold()
                        .font(.largeTitle)
                }
                AsyncImage(url: URL(string:"https://image.cnbcfm.com/api/v1/image/106944370-1632155941607-2-Full_station_ISSperspective.png?v=1632156028")) { image in image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    //show the whole image by scalees the image fit to the view size
                        .frame(width: 390)
                }placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                Spacer()
                HStack{
                    Text("Latitude  \(iss.latitude)")
                }
                .padding()
                .background(.blue)
                .cornerRadius(30)
                .symbolVariant(.fill)
                .font(.title).foregroundColor(.white)
                Spacer()
                HStack {
                    Text("Longitude  \(iss.longitude)")
                }
                .padding()
                .background(.black)
                .cornerRadius(30)
                .symbolVariant(.fill)
                .font(.title).foregroundColor(.white)
                Spacer()
                HStack {
                    Text ("Altitude  \(iss.altitude)")
                }
                .padding()
                .background(.blue)
                .cornerRadius(30)
                .symbolVariant(.fill)
                .font(.title).foregroundColor(.white)
                Spacer()
                HStack {
                    Text("Velocity  \(iss.velocity)")
                    
                }
                .padding()
                .background(.black)
                .cornerRadius(30)
                .symbolVariant(.fill)
                .font(.title).foregroundColor(.white)
                
            } .task { // to start async work when view is showen
                if let response = await IssManager().getIss() {
                    iss = response // waits for answer from async fun
                }
            }
            Spacer()
        }
    }
}
struct IssView_Previews: PreviewProvider {
    static var previews: some View {
        IssView()
    }
}

