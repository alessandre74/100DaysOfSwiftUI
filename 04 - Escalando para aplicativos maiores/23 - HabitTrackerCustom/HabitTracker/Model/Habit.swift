//
//  Habit.swift
//  HabitTracker
//
//  Created by Alessandre Livramento on 05/12/22.
//

import Foundation

struct Habit: Identifiable, Codable, Hashable {
    var id = UUID()
    let title: String
    let description: String
}
