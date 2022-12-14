//
//  TextFieldViewOld.swift
//  HabitView
//
//  Created by Alessandre Livramento on 14/12/22.
//

// import SwiftUI

// struct TextFieldViewOld: View {
//    @ObservedObject var habits: HabitViewModel
//    @FocusState var selectedField: TypeField?
//
//    var placeHolder: String
//    @State var isTapped = false
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 4) {
//            TextField("", text: placeHolder == TypeField.title.rawValue ? $habits.title : $habits.description) { status in
//                if status {
//                    withAnimation(.easeIn) {
//                        isTapped = true
//                    }
//                }
//            } onCommit: {
//                withAnimation(.easeOut) {
////                    isTapped = false
//                }
//            }
//            .focused($selectedField, equals: placeHolder == TypeField.title.rawValue ? .title : .description)
//            .onChange(of: selectedField) { focus in
//                let selectedHabit = placeHolder == TypeField.title.rawValue ? habits.title : habits.description
//
//                if (focus == nil) && selectedHabit.count == 0 {
//                    withAnimation(.easeOut) {
//                        isTapped = false
//                    }
//                }
//            }
//            .background(
//                Text(placeHolder)
//                    .scaleEffect(isTapped ? 0.8 : 1)
//                    .offset(x: isTapped ? -7 : 0, y: isTapped ? -15 : 0)
//                    .foregroundColor(isTapped ? .accentColor : .gray)
//                    .padding(.bottom, isTapped ? 12 : 0)
//
//                , alignment: .leading
//            )
//            .padding(.horizontal)
//
//            Rectangle()
//                .fill(isTapped ? Color.accentColor : Color.gray)
//                .opacity(isTapped ? 1 : 0.5)
//                .frame(height: 1)
//                .padding(.top, 10)
//        }
//        .padding(.top, 20)
////        .background(Color.gray.opacity(0.09))
//        .cornerRadius(5)
//    }
// }
//
// struct TextFieldViewOld_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldViewOld(habits: HabitViewModel(), placeHolder: TypeField.title.rawValue)
//    }
// }
