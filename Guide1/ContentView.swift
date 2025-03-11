//
//  ContentView.swift
//  Guide1
//
//  Created by Sam Kynaston on 11/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var text = "Knock Knock!"
    
    var body: some View {
        VStack {
            Text(text)
                .padding()
            
            Button("Who's there?") {
                text = "John!"
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
