//: [Previous](@previous)

// Расстановка фишек.
// Имеется полоса размера 1×n, разбитая на единичные клетки.
// Нужно расставить в клетках полосы m фишек, чтобы никакие две фишки не стояли в соседних клетках. Выведите все возможные расстановки.

// Входные данные
// Натуральные числа n и m.

// Выходные данные
// Выведите все корректные расстановки фишек. Каждая расстановка должна быть выведена в отдельной строке.
// Клетки, занятые фишками, обозначаются символами ‘*’, свободные клетки - точками ‘.’.
// Выводите расстановки в лексикографическом порядке, считая, что ‘*’ < ‘.’.

// Пример входных данных
// 5 2
// Пример выходных данных
// 1) *.*..
// 2) *..*.
// 3) *...*
// 4) .*.*.
// 5) .*..*
// 6) ..*.*

import Foundation
import UIKit

let N = 5
let M = 2

var count: Int = 0
var a = [String] (repeating: ".", count: N)

var lineNumber = 1
func print(until: Int) {
    print("\(lineNumber): ", terminator: "")
    for i in 0...N-1 {
        if i <= until {
            print("\(a[i])", terminator: "")
        } else {
            print(".", terminator: "")
        }
    }
    print()
    lineNumber += 1
}

func rec(next id: Int, count: Int) {
    if count == M {
        print(until: id)
        return
    }
    
    if id >= N {
        return
    }
    
    if id == 0 || a[id - 1] != "*" {
        a[id] = "*"
        rec(next: id + 1, count: count + 1)
    }
    
    a[id] = "."
    rec(next: id + 1, count: count)
}


if Int((N + 1) / 2) >= M {
    print("Possible. Let's do it!")
    rec(next: 0, count: 0)
} else {
    print("Impossible to place \(M) tokens on \(N) cells.")
}
//: [Next](@next)
