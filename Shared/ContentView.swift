//
//  ContentView.swift
//  Shared
//
//  Created by Erik Mikac on 5/7/21.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
struct ContentView: View {
    
    @State private var image: Image?
    var body: some View {
        
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
        
        Text("Hello, world!")
            .padding()
    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "nature.jpg") else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.crystallize()
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.radius = 200
        
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
