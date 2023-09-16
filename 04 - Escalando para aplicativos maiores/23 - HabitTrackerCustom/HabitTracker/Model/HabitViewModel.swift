//
//  HabitViewModel.swift
//  HabitTracker
//
//  Created by Alessandre Livramento on 05/12/22.
//

import Foundation

class HabitViewModel: ObservableObject {
    @Published var items = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let saveItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodeItems = try? JSONDecoder().decode([Habit].self, from: saveItems) {
                items = decodeItems
                return
            }
        }

//        items = []
        items = [
            Habit(title: "Academia", description: "Academia as 10:00hs"),
            Habit(title: "Futebol", description: "Futebol as 20:00hs"),
            Habit(title: "Corrida", description: "Corrida as 18:hs"),
            Habit(title: "Box", description: "Box as 21:00hs"),
        ]
    }

    func removeItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
