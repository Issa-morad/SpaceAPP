//
//  IssInfo.swift
//  SpaceAPP
//
//  Created by majd morad on 2022-11-20.
//

import Foundation

/* "name":"iss",
 "id":25544,
 "latitude":-33.218124008784,
 "longitude":-62.450330631051,
 "altitude":429.67687826036,
 "velocity":27547.032200326,
 "visibility":"daylight","footprint":4556.3710170301,
 "timestamp":1668935263,
 "daynum":2459903.8803588,
 "solar_lat":-19.719058155414,
 "solar_lon":39.469486801859,
 "units":"kilometers"}*/

//https://api.wheretheiss.at/v1/satellites/25544

import Foundation
struct Iss: Codable {
    let latitude: Double
    let longitude: Double
    let altitude: Double
    let velocity: Double
    
    private enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case altitude
        case velocity
    }
}

extension Iss {
    static let `default` = Iss (
        latitude: 0.0,
        longitude: 0.0,
        altitude: 0.0,
        velocity: 0.0
    )
}
