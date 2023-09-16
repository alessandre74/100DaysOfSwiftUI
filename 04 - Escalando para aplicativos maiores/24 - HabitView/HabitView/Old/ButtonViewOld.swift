//
//  ButtonViewOld.swift
//  HabitView
//
//  Created by Alessandre Livramento on 14/12/22.
//

// import SwiftUI
//
// struct ButtonViewOld: View {
//    @ObservedObject var habits: HabitViewModel
//    @State var isValidField = false
//
//    var dismiss: DismissAction
//
//    var typeButton: TypeButton
//    var typeIcon: TypeIcon
//
//    var body: some View {
//        VStack {
//            Button {
//                if !habits.isValidFields() && typeButton == .save {
//                    isValidField = true
//                    return
//                }
//
//                if typeButton == .save {
//                    habits.save()
//                }
//
//                habits.reset()
//                dismiss()
//
//            } label: {
//                Label(typeButton.rawValue, systemImage: typeIcon.rawValue)
//                    .frame(minWidth: 30, maxWidth: .infinity)
//                    .font(.body.weight(.semibold))
//            }
//            .buttonStyle(.borderedProminent)
//            .buttonStyle(.bordered)
//            .controlSize(.large)
//            .tint(typeButton == .save ? .blue : .black)
//        }
//        .frame(minWidth: 0, maxWidth: .infinity)
//        .alert("Atenção", isPresented: $isValidField) {
//            Button("Ok", role: .cancel) {}
//        } message: {
//            Text("Campos preenchimento obrigatório!")
//        }
//    }
// }
//
// struct ButtonViewOld_Previews: PreviewProvider {
//    @Environment(\.dismiss) static var dismiss
//
//    static var previews: some View {
//        ButtonViewOld(habits: HabitViewModel(), dismiss: dismiss, typeButton: .save, typeIcon: .save)
//    }
//
