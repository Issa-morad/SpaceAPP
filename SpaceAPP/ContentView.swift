//
//  ContentView.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
 NavigationStack{
        ZStack{
           Image("spaceimage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 30 ){
                Text("Welcome to SpaceApp")
                    .bold()
                    .font(.largeTitle) .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,24)
            
                VStack(alignment: .leading, spacing: 20){
                    NavigationLink{
                        pictureOfTodayView()
                    } label:{
                        Label("Go to APOD", systemImage: "photo")
                    }
                    .padding()
                    .background(.black)
                    .cornerRadius(30)
                    .symbolVariant(.fill)
                    .font(.title).foregroundColor(.white)
                    NavigationLink{
                        NewsView()
                    } label:{
                        Label("Go to Space news", systemImage: "newspaper.fill")
                    }
                    .padding()
                    .background(.black)
                    .cornerRadius(30)
                    .symbolVariant(.fill)
                    .font(.title).foregroundColor(.white)
                    NavigationLink{
                        IssView()
                    } label:{
                        Label("Go to ISS", systemImage: "newspaper.fill")
                    }
                    .padding()
                    .background(.black)
                    .cornerRadius(30)
                    .symbolVariant(.fill)
                    .font(.title).foregroundColor(.white)
                    NavigationLink{
                        PeopleView()
                    } label:{
                        Label("Go to People in space", systemImage: "newspaper.fill")
                    }
                    .padding()
                    .background(.black)
                    .cornerRadius(30)
                    .symbolVariant(.fill)
                    .font(.title).foregroundColor(.white)
                    Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .multilineTextAlignment(.center)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

