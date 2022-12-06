//
//  DetailView.swift
//  HabitTracker
//
//  Created by Alessandre Livramento on 05/12/22.
//

import SwiftUI

struct DetailView: View {
    @State var habit: Habit

    var body: some View {
        VStack {
            VStack {
                Text(habit.title)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(RoundedRectangle(cornerRadius: 20).fill(.lightBackground).shadow(color: .black.opacity(0.8), radius: 6, x: 4, y: 8))
        }
        .navigationTitle("Activity Details")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.lightBackground)
        .preferredColorScheme(.dark)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(habit: Habit(title: "Box", description: "Box as 21:00hs"))
    }
}
