//
//  ContentView.swift
//  Guide1
//
//  Created by Sam Kynaston on 11/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            KnockKnock()
                .tabItem {
                    Label("Knock Knock", systemImage: "house")
                }
            CalculatorPage()
                .tabItem {
                    Label("Calculator", systemImage: "numbers")
                }
        }
    }
}

struct KnockKnock: View {
    @State private var text = "Knock Knock!"
    @State private var isButtonVisible = true
    
    var body: some View {
        VStack {
            Text(text)
                .font(.largeTitle)
                .padding()
            
            if (isButtonVisible) {
                Button("Who's there?") {
                    text = "John!"
                    isButtonVisible = false
                }
            }
        }
        .padding()
    }
}

struct CalculatorPage: View {
    var body: some View {
        VStack {
            Text("Calculator!")
        }
    }
}

#Preview {
    ContentView()
}
