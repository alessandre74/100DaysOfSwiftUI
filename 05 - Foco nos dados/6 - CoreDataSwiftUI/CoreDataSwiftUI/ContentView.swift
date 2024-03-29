//
//  ContentView.swift
//  CoreDataSwiftUI
//
//  Created by Alessandre Livramento on 12/01/23.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>

    @Environment(\.managedObjectContext) var moc

    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }

            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                let chosenFirtsname = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!

                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirtsname) \(chosenLastName)"

                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
