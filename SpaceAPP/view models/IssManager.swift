//
//  IssManager.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-17.
//
/* {"timestamp": 1668679092,
 "iss_position": {"latitude": "-35.6676", "longitude": "-53.8437"},
 "message": "success"}*/

//http://api.open-notify.org/iss-now.json

import Foundation

struct IssData : Codable {
    
    var timestamp: Int
    var issposition: IssLocation
    var message: String
}
struct IssLocation: Codable {
    var latitude: Double
    var longitude: Double
}

@MainActor class IssManger : ObservableObject {
    @Published var iss: [IssData] = []
    
    func getNews(){
        guard let url = URL(string: "http://api.open-notify.org/iss-now.json") else{
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                let error = error!.localizedDescription
                DispatchQueue.main.async {
                    self.iss = [IssData(timestamp: 0, issposition: IssLocation(latitude: 0.0, longitude: 0.0), message: "Error" )]
                }
                return
            }
            let issData = try! JSONDecoder().decode([IssData].self, from: data)
            
            DispatchQueue.main.async {
                print("successfully, Articles: \(issData.count)")
                self.iss = issData
            }
        }.resume()
    }
}
