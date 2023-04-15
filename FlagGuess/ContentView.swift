//
//  ContentView.swift
//  FlagGuess
//
//  Created by Ronav Dholakia on 3/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "Russia", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 16/255, green: 49/255, blue: 82/255), .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack (spacing: 30) {
                Spacer()
                VStack {
                    Text("CHAGNE the Flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                
                Spacer()
                Spacer()
                Spacer()
                
                ForEach(0..<3) { number in
                    Button {
                        // flag was tapped
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
                Spacer()
                Text("The FFF-Final Score: " + String(score))
                    .foregroundColor(.white)
                    .font(.title.weight(.bold))
                Spacer()
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if (number == correctAnswer) {
            score += 1
        }
        askQuestion()
    }
    
    func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
