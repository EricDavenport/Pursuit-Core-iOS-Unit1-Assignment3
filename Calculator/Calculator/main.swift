//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation



func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
    switch opString {
    case "+":
        return {firstValue, secondValue in firstValue + secondValue }
    case "-":
        return {firstValue, secondValue in firstValue - secondValue }
    case "*":
        return {firstValue, secondValue in firstValue * secondValue }
    case "/":
        return {firstValue, secondValue in firstValue / secondValue }
    default:
        return {firstValue, secondValue in firstValue + secondValue }
    }
}

func mapFunction(valueArray: [Double], math: (Double) -> (Double)) -> [Double] {
    var resultArray = [Double]()
    for num in valueArray {
        resultArray.append(math(num))
    }
    return resultArray
}



func performMapOperation(arr: [Double], operatorSymbol: String, operand: Double) -> [Double] {
    var result = [Double]()
    switch operatorSymbol { // *, +, /, -
    case "*":
        result = mapFunction(valueArray: arr) { $0 * operand }
    case "+":
        result = mapFunction(valueArray: arr) { $0 + operand }
    case "/":
        result = mapFunction(valueArray: arr) { $0 / operand }
    case "-":
        result = mapFunction(valueArray: arr) { $0 - operand }
    default:
        print("operation not available")
    }
    return result
}

func stringIntoInt(array: [String]) -> [Double] {
    var intArray = [Double]()
    for num in array {
        if let number = Double(num) {
            intArray.append(number)
        }
    }
    return intArray
}

performMapOperation(arr: [5, 10, 15], operatorSymbol: "*", operand: 10)

let result = [5, 10, 15].filter { $0 < 10 }
print("result of filter is ", result)

print("ON | OFF")
var on = readLine()?.lowercased()

var userInput = readLine() ?? ""




repeat {
    print("""
        What would you like to do?
        Calculator
        Random
        Filter
        Map
        Reduce
        """)
    var mode = readLine()?.lowercased()
    
    while mode == "calculator" {
        
        print("""
        Enter your problem
        x + y
        """)
        
        var userInput = readLine() ?? ""
        if userInput == "off" {
            var on = "off"
            print("Goodbye")
        }
        
        var userArr = userInput.components(separatedBy: " ")
        
        
        var firstValue = Double(userArr[0]) ?? 0.0
        var secondValue = Double(userArr[2]) ?? 0.0
        var math = userArr[1]
        let possibleMath = ["+", "/", "*", "-"]
        
        if math == "&" {
            print("Unknown operator, please try again.")
        }
        
        if userInput.contains("?") {
            let randomSelection = possibleMath.randomElement() ?? "*"
            
            let randomArr = userInput.components(separatedBy: " ")
            let firstRandomValue = Double(randomArr[0]) ?? 0.0
            let secondRandomValue = Double(randomArr[2]) ?? 0.0
            
            
            let randomCalulation =  mathStuffFactory(opString: randomSelection)
            let randomAnswer = randomCalulation(firstRandomValue, secondRandomValue)
            
            print("\(firstRandomValue) \(randomSelection) \(secondRandomValue) = \(randomAnswer)")
            
            
        }
        
        
        
        //    if math == "?" {
        //        mathStuffFactory(opString: )
        //       }
        
        let result = mathStuffFactory(opString: math)
        let calculations = result(firstValue,secondValue)
        print("\(firstValue) \(math) \(secondValue) = \(calculations)")
        
    }
    //    while mode == "random" {
    //        print("Please input you problem. Input ? for random.")
    //        let userInput = readLine() ?? ""
    //
    //    }
    
    
    while mode == "map" {
        print("""
        This is map, please input your numbers to be worked and
        let the final number by the \"map by\" number
        and your multiplation (*) or division symbol (/)
        second to last
            e.g map 4,5,6,3,23,90 by > 4
        """)
        
        let userInput = readLine() ?? ""
        let mapArr = userInput.components(separatedBy: " ")
        let digits = mapArr[1]
        let digitsArray = digits.components(separatedBy: ",")
        
        let mapBy = Double(mapArr[4]) ?? 0.0
        let factor = mapArr[3]
        var result = 0.0
        
        var intChange = stringIntoInt(array: digitsArray)
        var mapResults = performMapOperation(arr: intChange, operatorSymbol: factor, operand: mapBy)
        print(" map return \(mapResults)")
        
        
//        let mapResult = performMapOperation(arr: digitsArray, operatorSymbol: factor, operand: mapBy)
//
    }
    
    while mode == "filter" {
        func filterFunction(arr: [Double], closure:(Double) -> Bool) -> [Double] {
            
            var result = [Double]()
            
            for num in arr {
                if closure(num){
                    result.append(num)
                }
            }
            
            return result
        }
    }
    
    
    
} while on == "on"


// filter



