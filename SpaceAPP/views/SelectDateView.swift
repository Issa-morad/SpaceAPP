//
//  SelectDateView.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-15.
//

import SwiftUI

struct SelectDateView: View {
    @State private var date = Date()
    
    @ObservedObject var manager: NetWorkManager
    
    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack{
            Text("Select a day").font(.headline)
            
            DatePicker(selection: $date, in: ...Date(), displayedComponents: .date){
                Text("select")
            }.labelsHidden()
            
            Button( action: {
                
                self.manager.date = self.date
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Done")
            }
        }
        
    }
}

struct SelectDateView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDateView(manager: NetWorkManager())
    }
}


