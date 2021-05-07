//
//  ContentView.swift
//  Shared
//
//  Created by Erik Mikac on 5/7/21.
//

import SwiftUI

/*
 Take aways:
 
 didSet -- Triggers only on regular vars...not @State
 To use didSet with an @State property wrapper, create it yourself using Bidning.
 */
struct ContentView: View {
    
    @State private var blurAmount: CGFloat = 0 {
        didSet {
            print("New Value is \(blurAmount)")
        }
    }
    
    var body: some View {
        
        let blur = Binding<CGFloat> (
            get: {
                self.blurAmount
            },
        set: {
            self.blurAmount = $0
            print("New value is \(self.blurAmount)")
        }
    )
        
        Text("Hello, world!")
            .padding()
            .blur(radius: blurAmount)
        Slider(value: blur, in: 0...20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
