//: [Previous](@previous)

// Выведите все правильные скобочные последовательности из 2n скобок в лексикографическом порядке.

// Входные данные
// Натуральное число n

// Выходные данные
// Выведите правильные скобочные последовательности в лексикографическом порядке. Считайте, что ‘(’ < ‘)’.
// Каждая последовательность должна выводиться в отдельной строке.

// Пример входных данных
// 3
// Пример выходных данных
// ((()))
// (()())
// (())()
// ()(())
// ()()()

import Foundation
import UIKit

let N = 3
var n = 2 * N
var a = [String] (repeating: "1", count: n)

var lineNumber = 1

func print_variant() {
    print("\(lineNumber): \(a)")
    lineNumber += 1
}

func rec(next idx: Int, balance: Int) {
    
    if idx >= n {
        if balance == 0 {
            print_variant()
        }
        return
    }
    
    a[idx] = "("
    rec(next: idx + 1, balance: balance + 1)
    
    if balance == 0 {
        return
    }
    
    a[idx] = ")"
    rec(next: idx + 1, balance: balance - 1)
}

rec(next: 0, balance: 0)

//: [Next](@next)
