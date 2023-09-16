//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Alessandre Livramento on 22/01/23.
//

import SwiftUI

/**
 1 - Por que \.self funciona para ForEach?
 2 - Criando subclasses NSManagedObject
 3 - Salvamento condicional de NSManagedObjectContext

 if moc.hasChanges {
     try? moc.save()
 }
 */

struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]

    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
