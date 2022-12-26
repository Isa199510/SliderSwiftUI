//
//  ContentView.swift
//  SliderSwiftUI
//
//  Created by Иса on 25.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randomNumber = Double.random(in: 1...100).rounded()
    @State private var sliderValue: Double = 20
    @State var showsAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(randomNumber.formatted())")
            HStack {
                
                Text("0")
                SliderView(value: $sliderValue, alpha: computeScore())
                Text("100")
            }
            
            Button("Проверь меня!", action: { showsAlert.toggle() })
                .alert(isPresented: $showsAlert) {
                    Alert(title: Text("Your score"),
                          message: Text("\(computeScore())"),
                          dismissButton: .cancel(Text("OK")) { startOver() }
                    )
                }
                .padding()

            Button("Начать заново") {
               startOver()
            }
        }
        .padding()
    }
}

extension ContentView {
    private func startOver() {
        randomNumber = Double.random(in: 1...100).rounded()
        sliderValue = 0
    }
    
    private func computeScore() -> Int {
        let difference = abs(Int(randomNumber) - lround(Double(sliderValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

