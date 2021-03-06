//: [Previous](@previous)

// Задача коммивояжера. Коммивояжер хочет объехать n городов и вернуться в исходный город.
// Каждые два города соединены между собой дорогами, для которых известны длины. Найдите путь коммивояжера минимальной длины.

// Входные данные
// В первой строке задано натуральное число n - количество городов.
// Следующие n строк содержат длины дорог a[i][j], по n чисел в каждой строке.
// Города пронумерованы числами от 0 до n−1. Гарантируется, что числа a[i][j] - натуральные, a[i][j]=a[j][i]
// и a[i][i]=0 для i и j от 0 до n−1.

// Выходные данные
// В первой строке выведите одно целое число - минимальную длину пути коммивояжера. Во второй строке выведите последовательность из n чисел - сам путь.
// Путь должен содержать номера городов в порядке обхода и начинаться с номера 0. Гарантируется, что путь минимальной длины единственный с точностью до разворота.
// Из двух вариантов выберите тот, в котором меньше номер второго города.

// Пример входных данных
// 4
// 0 1 4 6
// 1 0 5 2
// 4 5 0 3
// 6 2 3 0
// Пример выходных данных
// 10: 0 1 3 2

import Foundation
import UIKit

var a = [[Int]] ()
var N = Int ()

guard let path = Bundle.main.path(forResource: "salesman", ofType: "txt") else {
    fatalError("Can not get salesman.txt")
}

do {
    let contents = try String(contentsOfFile: path)
    let strArray = contents.components(separatedBy: .whitespacesAndNewlines)
    var readFirstN = false
    var temp = [Int] ()
    var i = 0

    for el in strArray {
        if !readFirstN {
            N = Int(el) ?? 0
            readFirstN = true
            continue
        }
        
        let t = Int(el) ?? 0
        temp.append(t)
        i = i + 1
        
        if i == N {
            a.append(temp)
            temp.removeAll()
            i = 0
        }
    }
} catch _ {
    fatalError("Can not read contents of salesman.txt")
}

//var a = [[Int]]()
//
//let N: Int = 4
//var line0 = [0, 1, 4, 6]
//var line1 = [1, 0, 5, 2]
//var line2 = [4, 5, 0, 3]
//var line3 = [6, 2, 3, 0]
//a.append(line0)
//a.append(line1)
//a.append(line2)
//a.append(line3)

//let N = 10
//var line0 = [0, 41, 67, 0, 78, 5, 91, 4, 18, 67]
//var line1 = [41, 0, 34, 69, 58, 45, 95, 2, 95, 99]
//var line2 = [67, 34, 0, 24, 62, 81, 42, 53, 47, 35]
//var line3 = [0, 69, 24, 0, 64, 27, 27, 92, 26, 94]
//var line4 = [78, 58, 62, 64, 0, 61, 36, 82, 71, 3]
//var line5 = [5, 45, 81, 27, 61, 0, 91, 21, 38, 11]
//var line6 = [91, 95, 42, 27, 36, 91, 0, 16, 69, 22]
//var line7 = [4, 2, 53, 92, 82, 21, 16, 0, 12, 33]
//var line8 = [18, 95, 47, 26, 71, 38, 69, 12, 0, 73]
//var line9 = [67, 99, 35, 94, 3, 11, 22, 33, 73, 0]
//a.append(line0)
//a.append(line1)
//a.append(line2)
//a.append(line3)
//a.append(line4)
//a.append(line5)
//a.append(line6)
//a.append(line7)
//a.append(line8)
//a.append(line9)

var MIN: Int = Int.max
var minPath = [Int](repeating: 0, count: N)

var currentPath = [Int](repeating: 0, count: N)
var used = [Bool](repeating: false, count: N)

func rec(idx: Int, currentCity: Int, sum: Int) {
    if idx == N {
        let returnLen = a[currentPath[N - 1]][0]
        if sum + returnLen < MIN {
            MIN = sum + returnLen
            minPath = currentPath
        }
        return
    }
    
    for i in 1...N-1 {
        if currentCity == i { continue }
        if used[i] == true { continue }
        
        currentPath[idx] = i
        let len = a[currentCity][i]
        
        if (sum + len) > MIN {continue}
        
        used[i] = true
        rec(idx: idx + 1, currentCity: i, sum: sum + len)
        used[i] = false
    }
}

rec(idx: 1, currentCity: 0, sum: 0)

print("Smallest value | Path")
print("---------------------")
print("\(MIN) | \(minPath)")

//: [Next](@next)
