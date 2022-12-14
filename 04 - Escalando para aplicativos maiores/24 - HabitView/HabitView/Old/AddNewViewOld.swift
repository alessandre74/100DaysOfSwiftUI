//
//  AddNewViewOld.swift
//  HabitView
//
//  Created by Alessandre Livramento on 14/12/22.
//

// import SwiftUI
// struct AddNewViewOld: View {
//    @ObservedObject var habits: HabitViewModel
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextFieldView(habits: habits, placeHolder: TypeField.title.rawValue)
//                TextFieldView(habits: habits, placeHolder: TypeField.description.rawValue)
//
//                HStack {
//                    Spacer()
//                    Text("\(habits.description.count)/\(TypeNumber.maxLength.rawValue)")
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                }
//
//                Spacer()
//
//                ButtonView(
//                    habits: habits,
//                    dismiss: dismiss,
//                    typeButton: .save,
//                    typeIcon: .save
//                )
//
//                ButtonView(
//                    habits: habits,
//                    dismiss: dismiss,
//                    typeButton: .close,
//                    typeIcon: .close
//                )
//            }
//            .padding()
//            .navigationTitle("New habit")
//            .preferredColorScheme(.dark)
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//        }
//    }
// }
//
// struct AddNewViewOld_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewViewOld(habits: HabitViewModel())
//    }
// }
