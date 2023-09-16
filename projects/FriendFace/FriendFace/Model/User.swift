//
//  User.swift
//  FriendFace
//
//  Created by Alessandre Livramento on 02/02/23.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id: String
    let name: String
}

struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]

    var firstName: String {
        return String(name.split(separator: " ")[0])
    }

    var lastName: String {
        return String(name.split(separator: " ")[1])
    }

    var formattedDate: [String] {
        let formatter = Date.ISO8601FormatStyle()
        let date = try! Date(registered, strategy: formatter).formatted(date: .abbreviated, time: .omitted)

        let day = String(date.split(separator: " ")[0])
        let month = String(date.split(separator: " ")[1])
        let year = String(date.split(separator: " ")[2])

        let dateArray: [String] = [month, day, year]

        return dateArray
    }

    var month: String {
        return formattedDate[0]
    }

    var day: String {
        return formattedDate[1]
    }

    var year: String {
        return formattedDate[2]
    }
}
