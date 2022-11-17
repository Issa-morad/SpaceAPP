//
//  NewsInfo.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-17.

//https://api.spaceflightnewsapi.net/v3/articles

/*
 "id":17308,
 "title":"Rocket Factory Augsburg signs deal to test engines at DLR premises",
 "url":"https://spacenews.com/rocket-factory-augsburg-signs-deal-to-test-engines-at-dlr-premises/",
 "imageUrl":"https://spacenews.com/wp-content/uploads/2022/11/RFA-Helix-engine-RFA-one-upper-stage-Nov2022-RFA-scaled.jpg"
 "newsSite":"SpaceNews",
 "summary":"Rocket Factory Augsburg has signed a deal allowing it to build and operate its own engine test stand at German Aerospace Center (DLR) premises.",
 "publishedAt":"2022-11-16T17:07:23.000Z"
 */

//

import Foundation

struct SpaceData : Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
}
