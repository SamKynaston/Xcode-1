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
            
            // Implement Buttons here
            HStack {
                Button(action: { buttonHandler(val: 1) }) {
                    Text("1")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { buttonHandler(val: 2) }) {
                    Text("2")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { buttonHandler(val: 3) }) {
                    Text("3")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { buttonHandler(val: 4) }) {
                    Text("4")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { buttonHandler(val: 5) }) {
                    Text("5")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            HStack {
                Button(action: { buttonHandler(val: 6) }) {
                    Text("6")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { buttonHandler(val: 7) }) {
                    Text("7")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { buttonHandler(val: 8) }) {
                    Text("8")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { buttonHandler(val: 9) }) {
                    Text("9")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { buttonHandler(val: 0) }) {
                    Text("0")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

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
    
    func buttonHandler(val: Int) {
        if num1.isEmpty {
            num1 = String(val)
        } else if num2.isEmpty {
            num2 = String(val)
        }
    }
    
    func calculate(operation: String) {
        if num1.isEmpty { return }
        if num2.isEmpty { return }
        
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
        
        num1 = ""
        num2 = ""
    }
}

#Preview {
    ContentView()
}
