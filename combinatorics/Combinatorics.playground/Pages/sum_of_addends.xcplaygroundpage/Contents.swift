//: [Previous](@previous)

// Разбиение числа на слагаемые.
// Выведите все разбиения числа
// n на натуральные слагаемые. Разбиения, отличающиеся только порядком слагаемых, считаются одинаковыми,
// поэтому выводите слагаемые в каждом разбиении в порядке неубывания.

// Входные данные
// Натуральное число
// n.
// Выходные данные
// Выведите разбиения числа
// n на слагаемые в лексикографическом порядке, каждое разбиение - в отдельной строке.
// Числа в каждом разбиении должны идти в порядке неубывания, разделяться знаками “+” (без пробелов)
// и в сумме давать n.

// Пример входных данных
// 5
// Пример выходных данных
// 1+1+1+1+1
// 1+1+1+2
// 1+1+3
// 1+2+2
// 1+4
// 2+3
// 5

import Foundation
import UIKit

let NUMBER = 5

var a = [Int](repeating: 0, count: NUMBER)
var sum: Int = 0
var lineNumber: Int = 1

func print(until: Int) {
    print("\(lineNumber): \(a.prefix(until))")
    lineNumber += 1
}

func rec(next id: Int, startFrom: Int, sum: Int) {
    guard sum < NUMBER else {
        print(until: id)
        return
    }
    
    for i in startFrom...NUMBER {
        if i + sum > NUMBER {
            return
        }
        a[id] = i
        rec(next: id + 1, startFrom: i, sum: sum + i)
    }
}

rec(next: 0, startFrom: 1, sum: 0)

//: [Next](@next)
