/*:
 [< Previous](@previous)                           [Home](DateFomatterDateStyleTimeStyle)
 # FirstIndex
 Teste com firstIndex
 */
import Foundation

code(for: "firsIndex") {
  let array = ["Apples", "Peaches", "Plums"]

  if let index = array.firstIndex(of: "Peaches") {
    print("Found peaches at index \(index)")
  }
}
