//
//  ContentView.swift
//  HabitView
//
//  Created by Alessandre Livramento on 14/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = HabitViewModel()

    @State var showingAddHabit = false
    @State var isEditing = false

    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { item in
                    NavigationLink {
                        DetailView(habits: habits, habit: item)
                    } label: {
                        ListItemsView(item: item)
                    }
                }
                .onDelete(perform: habits.removeItem)
            }
            .navigationTitle("Habits")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showingAddHabit = true
                    } label: {
                        Image(systemName: TypeIcon.add.rawValue)
                            .foregroundColor(.blue)
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            isEditing.toggle()
                        }

                    } label: {
                        Image(systemName: !isEditing ? TypeIcon.trash.rawValue : TypeIcon.trashSlash.rawValue)
                            .foregroundColor(!isEditing ? .blue : .red)
                    }
                }
            }
            .environment(\.editMode, .constant(isEditing ? EditMode.active : EditMode.inactive))
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $showingAddHabit) {
            AddNewView(habits: habits)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
