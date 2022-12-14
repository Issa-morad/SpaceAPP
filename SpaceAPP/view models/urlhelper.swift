//
//  urlhelper.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-15.
//

import Foundation

extension URL {
    func withQuery(_ query: [String: String]) -> URL? {
        // add query to URL in correct format
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true) //resolvingAgainstBaseURL: true construct query
        components?.queryItems = query.map { URLQueryItem(name: $0.0, value: $0.1)}
        return components?.url
    }
}
