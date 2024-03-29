//
//  ContentView.swift
//  MapKitView
//
//  Created by Alessandre Livramento on 30/06/23.
//

import MapKit
import SwiftUI

struct Location: Identifiable {
  let id = UUID()
  let name: String
  let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
  @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

  let location = [
    Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
    Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076)),
  ]

  var body: some View {
    // MARK: MapMarker

    // Map(coordinateRegion: $mapRegion, annotationItems: location) { location in
    //  MapMarker(coordinate: location.coordinate)
    // }

    // MARK: MapAnnotation

    NavigationView {
      Map(coordinateRegion: $mapRegion, annotationItems: location) { location in
        MapAnnotation(coordinate: location.coordinate) {
          NavigationLink {
            Text(location.name)
          } label: {
            Circle()
              .stroke(.red, lineWidth: 3)
              .frame(width: 44, height: 44)
            //              .onTapGesture {
            //                print("Tapped on \(location.name)")
            //              }
          }
        }
      }
      .navigationTitle("London Explorer")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
