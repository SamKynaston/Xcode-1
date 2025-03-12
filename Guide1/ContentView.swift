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

#Preview {
    ContentView()
}
