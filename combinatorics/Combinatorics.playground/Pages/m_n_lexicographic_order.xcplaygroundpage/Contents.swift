// Выведите в лексикографическом порядке все последовательности длины n,
// состоящие из чисел от 1 до m.
// Каждое число может встречаться в последовательности сколько угодно раз или не
// встречаться совсем.
//
// Входные данные
// Натуральные числа n и m.
//
// Выходные данные
// Выведите последовательности в лексикографическом порядке. Каждая последовательность
// должна выводиться в отдельной строке, числа в последовательности должны быть разделены
// одиночными пробелами.
//
// Пример входных данных
// 2 2
//
// Пример выходных данных
// 1 1
// 1 2
// 2 1
// 2 2
//
// В качестве ответа на задание выберите последовательность для n=6, m=5,
// имеющую номер 6659 в лексикографическом порядке.
// Для примера из условия последовательность с номером 3 имеет вид “2 1”.

import UIKit
import Foundation


let N = 2
let M = 3

var a = [Int] (repeating: 0, count: N)
var lineCnt = 1

func rec(next id:Int) {
    guard id < N else {
        print("\(lineCnt): \(a)")
        lineCnt += 1
        return
    }
    
    for i in 1...M {
        a[id] = i
        rec(next: id + 1)
    }
}

rec(next: 0)
