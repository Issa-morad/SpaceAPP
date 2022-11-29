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
    
    @Published var date: Date = Date()
    
    @Published var photoInfo = PhotoInfo() // holds the information of my photoInfo
    @Published var image: UIImage? = nil
    
    
    private var subscriptions = Set<AnyCancellable>() // stor the subscripthion, AnyCancellable: because during the init, when the NetWorkManager leaves the heap all this
                                                      // AnyCancellable subscriptions be automatically for me to cancel
    init(){
        // create url
        let url = URL(string: Constants.baseURL)! // constucting url, don't get the baseURL ->not able to fetch anythings
        
        // fetch data
        let fullURL = url.withQuery(["api_key" : Constants.key])! // need here a dictionarythat the key value pair
        print(url.withQuery(["api_key" : Constants.key])!)
        print(fullURL.absoluteString)
        
        
        $date.removeDuplicates()
            .sink { (value) in
                self.image = nil
            } .store(in: &subscriptions) // return value and stor them in subscription
        
        $date.removeDuplicates()
            .map {
                API.createURL(for: $0)
            }.flatMap {(url) in
                API.createPublisher(url: url)
                    
            }
            .receive(on: RunLoop.main) // this is the main queue, allowed to publish changes from the background queue on the main queue
            .assign(to: \.photoInfo, on: self) // assign this new one to my property, on root self
            .store(in: &subscriptions)
        
        
        $photoInfo
            .filter {$0.url != nil}
            .map { photoInfo -> URL in
                return photoInfo.url!
                
            }.flatMap { (url) in
                URLSession.shared.dataTaskPublisher(for: url) // fetching the data, URLSession fetch request, Publisher because want to work with combien
                    .map(\.data) // only use my data
                    .catch({ error in
                        return Just(Data())
                    })
                            
            }.map { (out) -> UIImage? in
                UIImage (data: out)
            }
            .receive(on: RunLoop.main)
            .assign(to: \.image, on: self)
            .store(in: &subscriptions)
    }
}
        
        /*  URLSession.shared.dataTaskPublisher(for: fullURL)
         .sink(receiveCompletion: { (completion) in
         switch completion{
         case.finished:
         print("fetch complete finished")
         case.failure(let failure):
         print("fetch complete with failure: \(failure.localizedDescription)")
         }
         
         }) { (data, response) in
         if let desription = String(data: data, encoding: .utf8){ // encoding: .utf8: gives the easy access of the information that we just featched
         print("fetched new data \(desription)")
         }
         
         }.store(in: &subscriptions)*/
        
    
    
    /*func createURL(for date: Date) -> URL {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD"
        let dateString = formatter.string(from: date)
        
        let url = URL(string: Constants.baseURL)!
        let fullURL = url.withQuery(["api_key" : Constants.key, "date" : dateString])!
        
        return fullURL
    }*/
    
    

