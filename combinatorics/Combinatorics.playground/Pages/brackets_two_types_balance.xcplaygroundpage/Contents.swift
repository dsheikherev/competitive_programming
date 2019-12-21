//: [Previous](@previous)

// Выведите все правильные скобочные последовательности с двумя типами скобок ‘(’, ‘)’, ‘[‘, ‘]’, содержащие 2𝑛
// 2n скобок, в лексикографическом порядке. В последовательности могут встречаться оба типа скобок или только один из них.

// Входные данные
// Натуральное число n.

// Выходные данные
// Выведите все правильные скобочные последовательности в лексикографическом порядке, каждую последовательность - в отдельной строке, без пробелов.
// Считайте, что ‘(’ < ‘)’ < ‘[‘ < ‘]’.

// Пример входных данных:
// 2
// Пример выходных данных:
// (())
// ()()
// ()[]
// ([])
// [()]
// [[]]
// []()
// [][]

import Foundation
import UIKit

let N = 2
var n = 2 * N
var a = [String] (repeating: "1", count: n)

var lineNumber = 1

func print_variant() {
    print("\(lineNumber): \(a)")
    lineNumber += 1
}

func isBracketsOrderCorrect(array: [String]) -> Bool {
    var stack = [String] ()
    
    for a in array {
        if a == "(" || a == "[" {
            stack.append(a)
        } else if a == ")" {
            if let s = stack.popLast() {
                if s != "(" {return false}
            }
        } else if a == "]" {
            if let s = stack.popLast() {
                if s != "[" {return false}
            }
        }
    }
    
    if stack.isEmpty {return true}
    return false
}

func rec(idx: Int, balanceRound: Int, balanceSquare: Int) {
    
    if idx >= n {
        if balanceSquare == 0 && balanceRound == 0 {
            if isBracketsOrderCorrect(array: a) {
                print_variant()
            }
        }
        return
    }
    
    a[idx] = "("
    rec(idx: idx + 1, balanceRound: balanceRound + 1, balanceSquare: balanceSquare)
    
    if balanceRound > 0 {
        a[idx] = ")"
        rec(idx: idx + 1, balanceRound: balanceRound - 1, balanceSquare: balanceSquare)
    }
    
    a[idx] = "["
    rec(idx: idx + 1, balanceRound: balanceRound, balanceSquare: balanceSquare + 1)
    
    if balanceSquare > 0 {
        a[idx] = "]"
        rec(idx: idx + 1, balanceRound: balanceRound, balanceSquare: balanceSquare - 1)
    }
}

rec(idx: 0, balanceRound: 0, balanceSquare: 0)

//: [Next](@next)
