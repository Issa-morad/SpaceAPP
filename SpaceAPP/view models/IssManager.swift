//
//  IssManager.swift
//  SpaceAPP
//
//  Created by Issa Morad on 2022-11-17.
//


import Foundation


class IssManager {
    let url = URL(string: "https://api.wheretheiss.at/v1/satellites/25544")!
    
    func getString() async -> String {
        do {
            let request = URLRequest(url: url)
            let (data,error) = try await URLSession.shared.data(for: request)
            return String(data: data, encoding: .utf8) ?? error.debugDescription
        }
        catch {
            return error.localizedDescription
        }
    }
    func getIss() async  -> Iss? {
        do {
            let request = URLRequest (url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(Iss.self, from: data)
        }
        catch{
            return nil
        }
    }
}
