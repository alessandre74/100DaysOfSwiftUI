//
//  Users.swift
//  FriendFace
//
//  Created by Alessandre Livramento on 02/02/23.
//

import Foundation

class Users {
    func loadData() async -> [User]? {
        if let userData = UserDefaults.standard.data(forKey: "FriendData") {
            return decoderData(data: userData)
        }

        let urlString = "https://www.hackingwithswift.com/samples/friendface.json"

        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: urlString)!)

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            if let saveData = try? decoder.decode([User].self, from: data) {
                print("Precisou fazer download")
                UserDefaults.standard.set(encoderData(data: saveData), forKey: "FriendData")
                return saveData
            }

        } catch {
            print(error)
        }

        return nil
    }

    func encoderData(data: [User]) -> Data? {
        if let encode = try? JSONEncoder().encode(data) {
            return encode
        }
        return nil
    }

    func decoderData(data: Data) -> [User]? {
        if let decode = try? JSONDecoder().decode([User].self, from: data) {
            return decode
        }
        return nil
    }

    func nameInitials(name: String) -> String {
        if let range = name.range(of: " ") {
            let initials = name[range.upperBound...]
            let lastNameInitial = String(initials.prefix(1))
            let firstNameInitial = name.prefix(1)
            return "\(firstNameInitial)\(lastNameInitial)"
        }
        return "XX"
    }

    func loadMock() -> User {
        let mock = User(
            id: "50a48fa3-2c0f-4397-ac50-64da464f9954",
            isActive: false,
            name: "Alford Rodriguez",
            age: 21,
            company: "Imkan",
            email: "alfordrodriguez@imkan.com",
            address: "907 Nelson Street, Cotopaxi, South Dakota, 5913",
            about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.",
            registered: "2015-11-10T01:47:18-00:00",
            tags: [
                "cillum",
                "consequat",
                "deserunt",
                "nostrud",
                "eiusmod",
                "minim",
                "tempor",
            ],
            friends: [
                Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel"),
                Friend(id: "0c395a95-57e2-4d53-b4f6-9b9e46a32cf6", name: "Jewel Sexton"),
                Friend(id: "be5918a3-8dc2-4f77-947c-7d02f69a58fe", name: "Berger Robertson"),
                Friend(id: "f2f86852-8f2d-46d3-9de5-5bed1af9e4d6", name: "Hess Ford"),
                Friend(id: "6ba32d1b-38d7-4b0f-ba33-1275345eacc0", name: "Bonita White"),
                Friend(id: "4b9bf1e5-abec-4ee3-8135-3a838df90cef", name: "Sheryl Robinson"),
                Friend(id: "5890bacd-f49c-4ea2-b8fa-02db0e083238", name: "Karin Collins"),
                Friend(id: "29e0f9ee-71f2-4043-ad36-9d2d6789b2c8", name: "Pace English"),
                Friend(id: "aa1f8001-59a3-4b3c-bf5e-4a7e1d8563f2", name: "Pauline Dawson"),
                Friend(id: "d09ffb09-8adc-48e1-a532-b99ae72473d4", name: "Russo Carlson"),
                Friend(id: "7ef1899e-96e4-4a76-8047-0e49f35d2b2c", name: "Josefina Rivas"),
            ]
        )

        return mock
    }
}
