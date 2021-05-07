//
//  ContentView.swift
//  Shared
//
//  Created by Erik Mikac on 5/7/21.
//

import SwiftUI
// Alerts show up on the center of the screen.

// ActionSheets are seperate pages. Could use this for ToC.
struct ContentView: View {
    @State private var showingActionSheet = false
    @State private var backgroundColor =  Color.white
    
    var body: some View {
        Text("Hello, world!")
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                self.showingActionSheet = true
            }
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("Change Background"), message: Text("Select a new color"), buttons: [
                                .default(Text("Red")) {self.backgroundColor = .red},
                                .default(Text("Green")) {self.backgroundColor = .green},
                                .default(Text("Blue")) {self.backgroundColor = .blue},
                                .cancel()])
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
