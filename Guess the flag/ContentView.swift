//
//  ContentView.swift
//  Guess the flag
//
//  Created by Vadym Hordov on 2020-06-18.
//  Copyright © 2020 Vadym Hordov. All rights reserved.
//

// Model View Controller (MVC)

import SwiftUI

struct ContentView: View {
    
    // Model - a place where you structure and store data
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score: Int = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    
    // View - a place where you display data
    
    // Data Bidning - the process of connecting data (Model) and functions (Controller) to the View
    var body: some View {
        ZStack {
            // Color.blue.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
//Modifiers
                }
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.green, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    // Controllers - a place where you manipulate data
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 10
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



