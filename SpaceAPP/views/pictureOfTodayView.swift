//
//  pictureOfTodayView.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-15.
//

import SwiftUI

struct pictureOfTodayView: View {
    @ObservedObject var manager = NetWorkManager()
    @State private var showSwitchDte: Bool = false // pop over
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            
           Button(action: {
                self.showSwitchDte.toggle()
                
            }){
                Image(systemName: "calendar")
                Text("switch day")
            }
            .padding(.trailing)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .popover(isPresented: $showSwitchDte) {
                SelectDateView(manager: self.manager)
            }
            
           if manager.image != nil { // fetch image
                Image(uiImage: self.manager.image!)
                    .resizable()
                    .scaledToFit()
            }else {
                Rectangle().fill(Color(.white))
                    .frame(height: 400)
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text(manager.photoInfo.date).font(.title)
                    Text(manager.photoInfo.title).font(.headline)
                    Text(manager.photoInfo.description)
                }
            }.padding()
        }
    }
}

struct pictureOfTodayView_Previews: PreviewProvider {
    static var previews: some View {
       let view = pictureOfTodayView()
        view.manager.photoInfo = PhotoInfo.createDefault()
        view.manager.image = UIImage(named: "previewimage")
        return view
    }
}
