//
//  CalculatorPage.swift
//  Guide1
//
//  Created by Sam Kynaston on 12/03/2025.
//

import SwiftUI

struct CalculatorPage: View {
    @State private var num1 = ""
    @State private var num2 = ""
    @State private var operation = ""
    @State private var stage = 1
    @State private var text = ""
    @State private var resetOnNextInput = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text(text)
                .font(.largeTitle)
                .padding()

            HStack {
                Button(action: { numButtonHandler(val: 1) }) {
                    Text("1")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { numButtonHandler(val: 2) }) {
                    Text("2")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { numButtonHandler(val: 3) }) {
                    Text("3")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { numButtonHandler(val: 4) }) {
                    Text("4")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { numButtonHandler(val: 5) }) {
                    Text("5")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            HStack {
                Button(action: { numButtonHandler(val: 6) }) {
                    Text("6")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { numButtonHandler(val: 7) }) {
                    Text("7")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { numButtonHandler(val: 8) }) {
                    Text("8")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { numButtonHandler(val: 9) }) {
                    Text("9")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { numButtonHandler(val: 0) }) {
                    Text("0")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

            HStack {
                Button(action: { operationButtonhandler(newOperator: "+") }) {
                    Text("+")
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: { operationButtonhandler(newOperator: "-") }) {
                    Text("-")
                        .frame(width: 50, height: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: { operationButtonhandler(newOperator: "*") }) {
                    Text("×")
                        .frame(width: 50, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: { operationButtonhandler(newOperator: "/") }) {
                    Text("÷")
                        .frame(width: 50, height: 50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: { calculate() }) {
                    Text("=")
                        .frame(width: 50, height: 50)
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    func numButtonHandler(val: Int) {
        if resetOnNextInput {
            resetOnNextInput = false
            text = ""
        }
        
        text.append(String(val))

        if stage == 1 {
            num1.append(String(val))
        } else if stage == 2 {
            num2.append(String(val))
        }
    }
    
    func operationButtonhandler(newOperator: String) {
        if resetOnNextInput {
            resetOnNextInput = false
            text = ""
        }
        
        if stage == 1 && num1.isEmpty { return }
        if stage == 2 && num2.isEmpty { return }
        if stage > 2 { return }
        
        stage += 1
        
        text.append(newOperator)
        operation = newOperator
    }
    
    func calculate() {
        if num1.isEmpty { return }
        if num2.isEmpty { return }
        
        var result: Double? = nil
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
        
        text.append("=")
        if let unwrappedResult = result {
            text.append(String(format: "%.2f", unwrappedResult))
        } else {
            text.append("Error!")
        }
        
        num1 = ""
        num2 = ""
        operation = ""
        stage = 1
        resetOnNextInput = true
    }
}

