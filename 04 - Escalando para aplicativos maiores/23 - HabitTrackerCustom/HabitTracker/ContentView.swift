//
//  ContentView.swift
//  HabitTracker
//
//  Created by Alessandre Livramento on 05/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = HabitViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(habits.items) { item in
                    ListItemsView(item: item)
                }
                .onDelete(perform: habits.removeItem)
                .padding(EdgeInsets(top: 16, leading: 12, bottom: 16, trailing: 12))
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.lightBackground).shadow(color: .black.opacity(0.8), radius: 6, x: 4, y: 8))
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 10, leading: 6, bottom: 8, trailing: 6))
            }
            .navigationTitle("Habit Tracking")
            .navigationDestination(for: Habit.self) { selectedItem in
                DetailView(habit: selectedItem)
            }
            .toolbar {
                EditButton().foregroundColor(.lightBackground)
            }
            .listStyle(.plain)
            .background(.lightBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
