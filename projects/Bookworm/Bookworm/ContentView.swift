//
//  ContentView.swift
//  Bookworm
//
//  Created by Alessandre Livramento on 12/01/23.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>

  @State private var showingAddScreen = false

  var body: some View {
    NavigationView {
      List {
        ForEach(books) { book in
          NavigationLink {
            DetailView(book: book)
          } label: {
            HStack {
              EmojiRatingView(raring: book.rating)
                .font(.largeTitle)

              VStack(alignment: .leading) {
                Text(book.title ?? "Unknown Title")
                  .font(.headline)
                  .foregroundColor(book.rating == 1 ? .red : .white)

                Text(book.author ?? "Unknown Title")
                  .foregroundColor(.secondary)
              }
            }
          }
        }
        .onDelete { IndexSet in
          DataController().deleteBook(at: IndexSet, books: books, moc: moc)
        }
      }
      .navigationTitle("Bookworn")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          EditButton().disabled(books.count == 0 ? true : false)
        }

        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            showingAddScreen.toggle()
          } label: {
            Label("Add Book", systemImage: "plus")
          }
        }
      }
      .sheet(isPresented: $showingAddScreen) {
        AddBookView()
      }
    }
    .preferredColorScheme(.dark)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
