//
//  photoinfo.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-15.
//

/*
 {"copyright":"Gianni Lacroce",
 "date":"2022-11-15",
 "explanation":"The mysterious blue reflection nebula found in catalogs as VdB 152 or Ced 201 really is very faint. It lies at the tip of the long dark nebula Barnard 175 in a dusty complex that has also been called Wolf's Cave. At the center of this deep telescopic view, the cosmic apparitions are nearly 1,400 light-years away along the northern Milky Way in the royal constellation Cepheus. Interstellar dust in the region blocks light from background stars and scatters light from the embedded bright star, giving the end nebula its characteristic blue color. Though stars do form in molecular clouds, this star seems to have only accidentally wandered into the area, as its measured velocity through space is very different from the cloud's velocity. At the image bottom is the planetary nebula Dengel-Hartl 5, while red glowing gas from an ancient supernova remnant is also visible along the image's right side.",
 "hdurl":"https://apod.nasa.gov/apod/image/2211/WolfsCave_Lacroce_3053.jpg",
 "media_type":"image",
 "service_version":"v1",
 "title":"Wolf's Cave Nebula",
 "url":"https://apod.nasa.gov/apod/image/2211/WolfsCave_Lacroce_960.jpg"}
 */

import Foundation
import SwiftUI

struct PhotoInfo: Codable, Identifiable { // consist of an encodable and decodable protocol to convert diffrent data types to each other
    
    var title: String
    var description: String
    var url: URL? // for the image
    var copyright: String?
    var date: String
    let id = UUID()
      
      var image: UIImage? = nil
      
    var formattedDate: Date {
        let dateFormatter = API.createFormatter()
        return dateFormatter.date(from: self.date) ?? Date()
    }
    
    enum CodingKeys: String, CodingKey { // CodingKeys: looking for JSON file
        case title = "title"
        case description = "explanation"
        case url = "url"
        case copyright = "copyright"
        case date = "date"
    }
    init(from decoder: Decoder) throws { // create my own initializer, access data by decoder
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self) // .self to use this type here
        // access my JSON data
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.copyright = try? valueContainer.decode(String.self, forKey: CodingKeys.copyright)
        self.date = try valueContainer.decode(String.self, forKey: CodingKeys.date)
    }
    
    init() { // initializer for testing, this is empty
        self.description = ""
        self.title = ""
        self.date = ""
    }
    
    static func createDefault() -> PhotoInfo {
        var photoInfo = PhotoInfo()
        photoInfo.title = "Wolf's Cave Nebula"
        photoInfo.description = "Explanation: The mysterious blue reflection nebula found in catalogs as VdB 152 or Ced 201 really is very faint. It lies at the tip of the long dark nebula Barnard 175 in a dusty complex that has also been called Wolf's Cave. At the center of this deep telescopic view, the cosmic apparitions are nearly 1,400 light-years away along the northern Milky Way in the royal constellation Cepheus. Interstellar dust in the region blocks light from background stars and scatters light from the embedded bright star, giving the end nebula its characteristic blue color. Though stars do form in molecular clouds, this star seems to have only accidentally wandered into the area, as its measured velocity through space is very different from the cloud's velocity. At the image bottom is the planetary nebula Dengel-Hartl 5, while red glowing gas from an ancient supernova remnant is also visible along the image's right side."
        photoInfo.date = "2022-11-15"
        photoInfo.image = UIImage(named: "previewimage")
        return photoInfo
    }
}
 

