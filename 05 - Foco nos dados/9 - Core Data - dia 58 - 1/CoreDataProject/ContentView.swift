//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Alessandre Livramento on 22/01/23.
//
import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    @State private var isButtonSort = ""
    @State private var typePredicade = TypePredicade.beginsWith
    @State private var sortDescriptors = [SortDescriptor<Singer>]()
    let addButtomImage = "person.crop.circle.badge.plus"

    var body: some View {
        VStack {
            // MARK: FILTERED LIST

            FilteredList(type: typePredicade, filterKey: "lastname", filterValue: lastNameFilter, sortDescriptor: sortDescriptors) { (singer: Singer) in
                Text("\(singer.wrapperFirstname) \(singer.wrapperLastName)")
            }

            // MARK: LIST ALL

            ListAll()

            // MARK: ADD SINGER

            ButtonView(
                action: { DataController.addSinger(moc: moc) },
                text: "Add Singer",
                image: addButtomImage,
                colorTint: .blue,
                disabled: false
            )

            Spacer().frame(height: 20)

            // MARK: BUTTONS FILTER

            Group {
                ButtonView(
                    action: { lastNameFilter = "A" },
                    text: DataController.labelFilter(filter: "A", type: typePredicade),
                    image: "none",
                    colorTint: .green,
                    disabled: lastNameFilter == "A" ? true : false
                )
                ButtonView(
                    action: { lastNameFilter = "S" },
                    text: DataController.labelFilter(filter: "S", type: typePredicade),
                    image: "none",
                    colorTint: .green,
                    disabled: lastNameFilter == "S" ? true : false
                )
            }

            // MARK: BUTTONS PREDICATE

            Group {
                ButtonView(
                    action: { typePredicade = .beginsWith },
                    text: "Begins With",
                    image: "none",
                    colorTint: .purple,
                    disabled: typePredicade == .beginsWith ? true : false
                )

                ButtonView(
                    action: { typePredicade = .contains },
                    text: "Contais",
                    image: "none",
                    colorTint: .purple,
                    disabled: typePredicade == .contains ? true : false)
            }

            // MARK: BUTTOS SORTED

            Group {
                ButtonView(
                    action: {
                        isButtonSort = "AZ"
                        sortDescriptors = [SortDescriptor(\.firstname)]
                    },
                    text: "Sort A-Z",
                    image: "none",
                    colorTint: .teal,
                    disabled: isButtonSort == "AZ" ? true : false
                )

                ButtonView(
                    action: {
                        isButtonSort = "ZA"
                        sortDescriptors = [SortDescriptor(\.firstname, order: .reverse)]
                    },
                    text: "Sort Z-A",
                    image: "none",
                    colorTint: .teal,
                    disabled: isButtonSort == "ZA" ? true : false
                )
            }
        }
        .padding()
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
