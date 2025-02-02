//
//  People.swift
//  SuperStuff
//

import Foundation
import os

struct Person: Codable {
    let id: Int
    let login: String
    let url: String
    let gravatarId: String
    let avatarUrl: String
}

class PeopleStore {

    static var people: [Person] {

        let signposter = OSSignposter(subsystem: "Asset Loading", category: .pointsOfInterest)
        let intervalName: StaticString = "Loading People File"
        let signpostID = signposter.makeSignpostID()
        let signpostState = signposter.beginInterval(intervalName, id: signpostID)
        defer { signposter.endInterval(intervalName, signpostState) }

        guard let url = Bundle.main.url(forResource: "people", withExtension: "json") else {
            return []
        }

        guard let jsonData = try? Data(contentsOf: url) else {
            return []
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let returnValue = try decoder.decode([Person].self, from: jsonData)
            return returnValue
        }
        catch {
            print(error)
            return []
        }
    }

}
