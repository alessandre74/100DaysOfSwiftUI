//
//  HabitViewModel.swift
//  HabitView
//
//  Created by Alessandre Livramento on 14/12/22.
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

    @Published var title = String()

    @Published var description = "" {
        didSet {
            if description.count > TypeNumber.maxLength.rawValue && oldValue.count <= TypeNumber.maxLength.rawValue {
                description = oldValue
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

        items = []
    }

    func removeItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func reset() {
        title = String()
        description = String()
    }

    func isValidFields() -> Bool {
        if title.count == 0 || description.count == 0 {
            return false
        }

        return true
    }

    func save() {
        let item = Habit(title: title, description: description, habitCount: 0)
        items.append(item)
        reset()
    }

    func updateFieldHabitCount(habitItem: Habit, typeCount: TypeCount) {
        var newHabitCount = habitItem

        if typeCount == .increment {
            newHabitCount.habitCount += 1
        }

        if typeCount == .decrement {
            newHabitCount.habitCount -= newHabitCount.habitCount >= 1 ? 1 : 0
        }

        if let habitIndex = items.firstIndex(of: habitItem) {
            items[habitIndex] = newHabitCount
        }
    }

    func habitCountIncrement(habit: Habit) {
        updateFieldHabitCount(habitItem: habit, typeCount: .increment)
    }

    func habitCountDecrement(habit: Habit) {
        updateFieldHabitCount(habitItem: habit, typeCount: .decrement)
    }
}
