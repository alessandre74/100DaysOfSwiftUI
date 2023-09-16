//
//  ContentView.swift
//  CodableURLSessionView
//
//  Created by Alessandre Livramento on 12/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var results = [Result]()

    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }

    func loadData() async {
        let urlString = "https://itunes.apple.com/search?term=taylor+swift&entity=song"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }

        } catch {
            print("Invalid data")
        }
    }
}

// Adicionando conformidade Codable para propriedades @Published
class User: ObservableObject, Codable {
    @Published var name = "Mike Livramento"

    enum CodingKeys: CodingKey {
        case name
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

// Enviando e recebendo dados Codable com URLSession e SwiftUI
struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
