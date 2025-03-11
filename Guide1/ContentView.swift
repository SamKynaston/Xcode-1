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
    @State private var num1 = ""
    @State private var num2 = ""
    @State private var result: Double? = nil

    var body: some View {
        VStack(spacing: 20) {
            if let result = result {
                Text("Result: \(String(format: "%.2f", result))")
                    .font(.largeTitle)
                    .padding()
            }
            
            TextField("No. 1", text: $num1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            TextField("No. 2", text: $num2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            
            HStack {
                Button(action: { calculate(operation: "+") }) {
                    Text("+")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: { calculate(operation: "-") }) {
                    Text("-")
                        .frame(width: 50, height: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: { calculate(operation: "*") }) {
                    Text("×")
                        .frame(width: 50, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: { calculate(operation: "/") }) {
                    Text("÷")
                        .frame(width: 50, height: 50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    func calculate(operation: String) {
        guard let number1 = Double(num1), let number2 = Double(num2) else { return }
        
        switch operation {
            case "+":
                result = number1 + number2
            case "-":
                result = number1 - number2
            case "*":
                result = number1 * number2
            case "/":
                result = number2 != 0 ? number1 / number2 : nil
            default:
                break
        }
    }
}

#Preview {
    ContentView()
}
