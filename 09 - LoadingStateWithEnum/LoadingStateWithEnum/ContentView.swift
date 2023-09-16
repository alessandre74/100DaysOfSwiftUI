//
//  ContentView.swift
//  LoadingStateWithEnum
//
//  Created by Alessandre Livramento on 28/06/23.
//

import SwiftUI

enum LoadingState {
  case loading, success, failed
}

struct ContentView: View {
  var loadingState = LoadingState.success
  
  var body: some View {
    if loadingState == .loading {
      LoadingView()
    }
    
    if loadingState == .success {
      SuccessView()
    }
    
    if loadingState == .failed {
      FailedView()
    }
  }
}

struct LoadingView: View {
  var body: some View {
    Text("Loading...")
  }
}

struct SuccessView: View {
  var body: some View {
    Text("Success!")
  }
}

struct FailedView: View {
  var body: some View {
    Text("Failed.")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
