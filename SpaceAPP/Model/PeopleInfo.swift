//
//  PeopleInfo.swift
//  SpaceAPP
//
//  Created by majd morad on 2022-11-20.
//
//http://api.open-notify.org/astros.json

/* "people": [{"name": "Cai Xuzhe", "craft": "Tiangong"}, {"name": "Chen Dong", "craft": "Tiangong"}, {"name": "Liu Yang", "craft": "Tiangong"}, {"name": "Sergey Prokopyev", "craft": "ISS"}, {"name": "Dmitry Petelin", "craft": "ISS"}, {"name": "Frank Rubio", "craft": "ISS"}, {"name": "Nicole Mann", "craft": "ISS"}, {"name": "Josh Cassada", "craft": "ISS"}, {"name": "Koichi Wakata", "craft": "ISS"}, {"name": "Anna Kikina", "craft": "ISS"}],
 "number": 10}*/


import Foundation

struct People: Codable {
    let number: Int
    var people: [PeopleName]
    
    
    struct PeopleName: Codable, Identifiable {
        var id: UUID
        
        let name: String
        let craft: String
    }
}
    private enum CodingKeys: String, CodingKey {
        case number
        case people
        case name
        case craft
    }

extension People {
    static let `default` = People (
        number: 10,
        people: [PeopleName(id: UUID(), name: "Cai Xuzhe", craft: "Tiangong"),
                 PeopleName(id: UUID(), name: "Chen Dong", craft: "Tiangong"),
                 PeopleName(id: UUID(), name: "Liu Yang", craft: "Tiangong"),
                 PeopleName(id: UUID(), name: "Sergey Prokopyev", craft: "ISS"),
                 PeopleName(id: UUID(), name: "Dmitry Peteline", craft: "ISS"),
                 PeopleName(id: UUID(), name: "Frank Rubio", craft: "ISS"),
                 PeopleName(id: UUID(), name: "Nicole Mann", craft: "ISS"),
                 PeopleName(id: UUID(), name: "Josh Cassada", craft: "ISS"),
                 PeopleName(id: UUID(), name: "Koichi Wakata", craft: "ISS"),
                 PeopleName(id: UUID(), name: "Anna Kikina", craft: "ISS")]
        
    )
}

 
