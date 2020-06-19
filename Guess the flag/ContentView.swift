//
//  ContentView.swift
//  Guess the flag
//
//  Created by Vadym Hordov on 2020-06-18.
//  Copyright © 2020 Vadym Hordov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert: Bool = false
    @State private var name: String = "Vadym"
    
    var body: some View {
        ZStack() {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                TextField("Name", text: $name)
                HStack(spacing: 20) {
                    Button("Show alert") {
                        self.showingAlert = true
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("This is alert!"), message: Text("We are showing alert to \(name)!"))
                    }
                    Button(action: {
                        print("Tapped!")
                    }) {
                        VStack(spacing: 10) {
                            Text("Tap me!")
                            Image(systemName: "heart")
                                .renderingMode(.original)
                        }
                    }
                    Button(action: {
                        print("editing!")
                    }) {
                        Text("Edit")
                        Image(systemName: "pencil")
                    }
                }
                Spacer()
                HStack(spacing: 20) {
                    Text("First")
                    Text("Second")
                    Text("Third")
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
