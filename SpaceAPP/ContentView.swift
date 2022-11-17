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
                Text("Welcom to SpaceApp")
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

/*  Text(text)
      .padding()
      .task {
          text = await NetWorkManager().getString()
      }*/
  
  /*  NavigationStack{
   HStack{
   Text("Welcom to SpaceApp")
   }
   VStack{
   NavigationLink{
   pictureOfTodayView(manager: NetWorkManager())
   } label:{
   Label("Go to APOD", systemImage: "rectangle.portrait.and.arrow.right.fill")
   }
   }
   }
   @State var photoinfo = Photoinfo.default
   var body: some View {
       List {
           AsyncImage(url: photoinfo.url)
               .frame(height: 280)
               .listRowInsets(.init())
           Text(photoinfo.title)
               .font(.title)
               .bold()
               .padding(.vertical)
           Label(photoinfo.copyright, systemImage: "c.circle.fill")
           Label (photoinfo.date, systemImage: "calendar")
           Text(photoinfo.explanation)
               .padding(.vertical)
       }.task {
           if let response =  await NetWorkManager().getPhoto() {
               photoinfo = response
           }
       }
 
   }
   }*/
