//
//  ContentView.swift
//  CoreImageView
//
//  Created by Alessandre Livramento on 14/03/23.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }

    func loadImage() {
        guard let inputImage = UIImage(named: "Example") else { return }
        let beginImage = CIImage(image: inputImage)

        let context = CIContext()
        // Filtro sépia
        let currentFilter1 = CIFilter.sepiaTone()
        currentFilter1.inputImage = beginImage
        currentFilter1.intensity = 1

        // Filtro pixellate
        let currentFilter2 = CIFilter.pixellate()
        currentFilter2.inputImage = beginImage
        currentFilter2.scale = 100

        // Filtro crystallize
        let currentFilter3 = CIFilter.crystallize()
        currentFilter3.inputImage = beginImage
        currentFilter3.radius = 200

        // Filtro twirlDistortion
        let currentFilter4 = CIFilter.twirlDistortion()
        currentFilter4.inputImage = beginImage
        currentFilter4.radius = 1000
        currentFilter4.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)

        let currentFilter = CIFilter.twirlDistortion()
        currentFilter.inputImage = beginImage

        let amount = 1.0
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }

        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }

        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }

        guard let outputImage = currentFilter.outputImage else { return }

        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
