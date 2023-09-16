//
//  AddNew.swift
//  HabitView
//
//  Created by Alessandre Livramento on 14/12/22.
//

import SwiftUI

struct AddNewView: View {
    @ObservedObject var habits: HabitViewModel
    @Environment(\.dismiss) var dismiss

    @State var isSection = false
    @State var isValidField = false

    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        TextFieldView(habits: habits, placeHolder: TypeField.Title.rawValue)
                    }
                }

                Section {
                    HStack {
                        TextFieldView(habits: habits, placeHolder: TypeField.Description.rawValue)
                        Text("\(habits.description.count)/\(TypeNumber.maxLength.rawValue)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("New habit")
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        if !habits.isValidFields() {
                            isValidField = true
                            return
                        }

                        habits.save()
                        dismiss()

                    } label: {
                        Image(systemName: TypeIcon.save.rawValue)
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        habits.reset()
                        dismiss()

                    } label: {
                        Image(systemName: TypeIcon.close.rawValue)
                            .foregroundColor(.red)
                    }
                }
            }
            .alert("Atenção", isPresented: $isValidField) {
                Button("Ok", role: .cancel) {}
            } message: {
                Text("Campos preenchimento obrigatório!")
            }
        }
    }
}

struct AddNewView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewView(habits: HabitViewModel())
    }
}
