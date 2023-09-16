//
//  ContentView.swift
//  WordScramble
//
//  Created by Alessandre Livramento on 06/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LoadFileView()
    }
}

struct ListView1: View {
    var body: some View {
        List {
            Section("Section 1") {
                Text("Static row 1")
                Text("Static row 1")
            }

            Section("Section 2") {
                ForEach(0 ..< 5) {
                    Text("Dynamic row \($0)")
                }
            }

            Section("Section") {
                Text("Static row 3")
                Text("Static row 4")
            }
        }
        .listStyle(.grouped)
    }
}

struct ListView2: View {
    var body: some View {
        List(0 ..< 5) {
            Text("Dynamic row \($0)")
        }
    }
}

struct ListView3: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]

    var body: some View {
        VStack {
            List(people, id: \.self) {
                Text($0)
            }

            List {
                Text("Static Row")

                ForEach(people, id: \.self) {
                    Text($0)
                }

                Text("Static row")
            }
        }
    }
}

struct WorkingStringsView: View {
    var body: some View {
        VStack {
            Button {
                print(StringLetters())

            } label: {
                Text("Clique aqui")
            }
        }
    }

    func StringLetters() -> Bool {
        let input = "A l e s s a n d r e"
        let letters = input.components(separatedBy: " ") // Divide em um array com base em separatedBy.

        let letter = letters.randomElement() // Obtém uma letra aleatória do array

        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "" // Limpas espaços iniciais e finais de uma string

        let word = "Specing"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelleRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelleRange.location == NSNotFound

        return allGood
    }
}

struct LoadFileView: View {
    var body: some View {
        Button {
            print(loadFile())
        } label: {
            Text("Carregar arquivo..")
        }
    }

    func loadFile() -> String {
        guard let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") else {
            return "arquivo vazio"
        }

        guard let fileContents = try? String(contentsOf: fileURL) else { return "arquivo vazio" }

        return fileContents
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
