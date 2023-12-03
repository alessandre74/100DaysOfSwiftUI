//
//  ContentView.swift
//  BucketList
//
//  Created by Alessandre Livramento on 28/06/23.
//

import MapKit
import SwiftUI

struct ContentView: View {
  @StateObject private var viewModel = ViewModel()

  var body: some View {
    if viewModel.isUnlocked {
      ZStack {
        Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
          MapAnnotation(coordinate: location.coordinate) {
            VStack {
              Image(systemName: "pin.fill")
                .foregroundColor(.red)
              Text(location.name)
                .font(.system(size: 12))
                .fixedSize()
            }
            .onTapGesture {
              viewModel.selectedPlace = location
            }
          }
        }
        .ignoresSafeArea()

        Circle()
          .fill(.blue)
          .opacity(0.3)
          .frame(width: 32, height: 32)

        VStack {
          Spacer()
          HStack {
            Spacer()
            Button {
              viewModel.addLocation()
            } label: {
              Image(systemName: "plus")
                .padding()
                .background(.black.opacity(0.75))
                .foregroundColor(.white)
                .font(.title)
                .clipShape(Circle())
                .padding(.trailing)
            }
          }
        }
      }
      .sheet(item: $viewModel.selectedPlace) { place in

        EditView(location: place) { newLocation in
          viewModel.update(location: newLocation)
        }
      }

    } else {
      Button("Unlock Places") {
        viewModel.authenticate()
      }
      .padding()
      .background(.blue)
      .foregroundColor(.white)
      .clipShape(Capsule())
      .alert("Attention", isPresented: $viewModel.noAuthenticateBiometric, actions: {}) {
        Text("Device does not have biometric authentication")
      }
      .alert("Attention", isPresented: $viewModel.errorAuthenticate, actions: {}) {
        Text("Authentication failed")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
