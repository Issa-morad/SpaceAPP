//
//  PeopleView.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-20.
//

import SwiftUI

struct PeopleView: View {
    @State var  people = People.default
    @State var  text = "hallo text"
    var body: some View {
        NavigationStack {
            VStack{
                HStack {
                    Text("People in space")
                        .bold()
                        .font(.largeTitle)
                }
                Spacer()
                
                VStack{
                    Text("NUMBER OF PEOPOLE IN SPACE: \(people.number)")
                        .bold()
                    Spacer()
                    
                    VStack{
                        ForEach (people.people) { people in
                            Text("NAME: \(people.name)")
                                .background(.red)
                                .cornerRadius(5)
                                .symbolVariant(.fill)
                                .font(.title2).foregroundColor(.white)
                            Text("SPACE CRAFT: \(people.craft)")
                                .background(.blue)
                                .cornerRadius(5)
                                .symbolVariant(.fill)
                                .font(.title3).foregroundColor(.white)
                            Spacer()
                        }.task {
                            text = await PeopleManager().getString()
                            if let response = await PeopleManager().getPeople() {
                                people = response
                            }
                        }
                    }
                    Spacer()
                    Text(text)
                        .bold()
                        .padding()
                    }
                }
            }
        }
    }


struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
