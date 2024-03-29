//
//  ContentView.swift
//  FileManager
//
//  Created by Alessandre Livramento on 28/06/23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Text("Hello World")
      .onTapGesture {
        let str = "Test Message"
        let url = getDocumentsDirectory().appendingPathComponent("message.txt")
        
        do {
          print(url)
          try str.write(to: url, atomically: true, encoding: .utf8)
          let input = try String(contentsOf: url)
          print(input)
          
        } catch {
          print(error.localizedDescription)
        }
      }
  }
  
  func getDocumentsDirectory() -> URL {
      // find all possible documents directories for this user
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
      // just send back the first one, which ought to be the only one
    return paths[0]
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
