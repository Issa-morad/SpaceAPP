//
//  PeopleInSpace.swift
//  SpaceAPP
//
//  Created byI ssa Morad on 2022-11-20.

import Foundation


class PeopleManager {
    let url = URL(string: "http://api.open-notify.org/astros.json")!
    
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
    func getPeople() async  -> People? {
        do {
            let request = URLRequest (url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(People.self, from: data)
        }
        catch{
            return nil
        }
    }
}
