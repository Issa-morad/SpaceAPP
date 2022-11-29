//
//  NetWorkManager.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-15.
//

import Foundation
import Combine
import SwiftUI

class NetWorkManager: ObservableObject { // ObservableObject at use it in my swiftui views
    
    @Published var date: Date = Date() // return date which is today
    
    @Published var photoInfo = PhotoInfo() // holds the information of my photoInfo
    @Published var image: UIImage? = nil //   return image, must use SwiftUI
    
    
    private var subscriptions = Set<AnyCancellable>() // stor the subscripthion, AnyCancellable: because during the init, when the NetWorkManager leaves the heap all this
                                                      // AnyCancellable subscriptions be automatically for me to cancel
    init(){
        // create url
        let url = URL(string: Constants.baseURL)! // constucting url, don't get the baseURL ->not able to fetch anythings
        
        // fetch data
        let fullURL = url.withQuery(["api_key" : Constants.key])! // need here a dictionarythat the key value pair
        print(url.withQuery(["api_key" : Constants.key])!)
        print(fullURL.absoluteString)
        
        
        $date.removeDuplicates() // when date changed image should directly reset
            .sink { (value) in
                self.image = nil // image nil till it is loading
            } .store(in: &subscriptions) // return value and stor them in subscription
        
        $date.removeDuplicates() //new date for fetching date, so subscribe date
                                // removeDuplicates if date does not change
            .map {
                API.createURL(for: $0)
            }.flatMap {(url) in
                API.createPublisher(url: url)
                    
            }
            .receive(on: RunLoop.main) // this is the main queue, allowed to publish changes from the background queue on the main queue
            .assign(to: \.photoInfo, on: self) // assign this new one to my property, on root self
            .store(in: &subscriptions)
        
        
        $photoInfo
            .filter {$0.url != nil} // new url for fetching image, so subscribe photoInfo
            .map { photoInfo -> URL in // to change old to a new one
                return photoInfo.url!
                
            }.flatMap { (url) in // create publisher of publisher
                URLSession.shared.dataTaskPublisher(for: url) // fetching the data, URLSession fetch request, Publisher because want to work with combien
                    .map(\.data) // only use my data
                    .catch({ error in
                        return Just(Data()) // empty data
                    })
                            
            }.map { (out) -> UIImage? in // change the data to image
                UIImage (data: out)
            }
            .receive(on: RunLoop.main)
            .assign(to: \.image, on: self)
            .store(in: &subscriptions)
    }
}
        
    
    

