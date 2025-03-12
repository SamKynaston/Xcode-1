//
//  KnockKnockPage.swift
//  Guide1
//
//  Created by Sam Kynaston on 12/03/2025.
//

import SwiftUI

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

