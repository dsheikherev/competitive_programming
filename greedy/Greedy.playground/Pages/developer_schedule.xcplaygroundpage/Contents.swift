//: [Previous](@previous)

// Задача о расписании.
// У программиста есть n заказов. Для каждого заказа известны дедлайн d[i]  - срок,
// до которого нужно выполнить заказ, и стоимость заказа c[i]. На выполнение каждого заказа требуется один день.
// Программист начинает работать с 1-го дня, и если у заказа дедлайн d[i],
// то этот заказ нужно выполнить до конца d[i]-го дня. Например, если дедлайн равен 1,
// то программист успеет выполнить этот заказ в первый день. Нужно составить оптимальное расписание -
// определить, какие заказы программист может выполнять и в каком порядке,
// чтобы максимизировать суммарную стоимость выполненных заказов.

// Входные данные
// В первой строке задано число n - количество заказов.
// Следующие n строк содержат описания заказов:
// i-я строка содержит два целых числа - дедлайн d[i] и стоимость c[i].
// Выходные данные
// Выведите одно целое число - максимальную суммарную стоимость выполненных заказов.

// Пример входных данных
// 5
// 2 5
// 2 4
// 5 3
// 1 2
// 3 1
// Пример выходных данных
// 13

import Foundation
import UIKit

var N = Int ()
var d = [Int] ()
var c = [Int] ()

let fileName = "schedule2"

guard let path = Bundle.main.path(forResource: fileName, ofType: "txt") else { fatalError("Can't get \(fileName).txt")
}

do {
    let contents = try String(contentsOfFile: path)
    let contentsInStringArray = contents.components(separatedBy: .whitespacesAndNewlines)
    var i = 0
    var isNRead = false
    
    for element in contentsInStringArray {
        guard !element.isEmpty else {
            continue
        }
        
        if !isNRead {
            N = Int(element) ?? 0
            isNRead = true
            continue
        }
        
        let temp = Int(element) ?? 0
        if i % 2 == 0 {
            d.append(temp)
        } else {
            c.append(temp)
        }
        i += 1
    }
} catch _ {
    fatalError("Can't get contents of \(fileName).txt")
}

/* Selection_Sort */

func selectionSort(deadline: [Int], cost: [Int]) -> (d: [Int], c: [Int]) {
    var d = deadline
    var c = cost
    
    for i in 0 ..< c.count {
        var max = i
        for j in i + 1 ..< c.count {
            if c[max] < c[j] {
                max = j
            }
        }
        var temp = c[i]
        c[i] = c[max]
        c[max] = temp
        
        temp = d[i]
        d[i] = d[max]
        d[max] = temp
    }
    
    return(d, c)
}

/* -------------- */

/* Merge_____Sort */

func mergeSort(_ c: [Int], ascendingOrder: Bool) -> [Int] {
    guard c.count > 1 else { return c}
    let middleIndex = c.count / 2
    let leftHalf = mergeSort(Array(c[0 ..< middleIndex]), ascendingOrder: ascendingOrder)
    let rightHalf = mergeSort(Array(c[middleIndex ..< c.count]), ascendingOrder: ascendingOrder)
    return merge(lHalf: leftHalf, rHalf: rightHalf, ascending: ascendingOrder)
}

func merge(lHalf: [Int], rHalf: [Int], ascending: Bool) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var sorted = [Int] ()
    
    if sorted.capacity < lHalf.count + rHalf.count {
        sorted.reserveCapacity(lHalf.count + rHalf.count)
    }
    
    while true {
        guard leftIndex < lHalf.endIndex else {
            sorted.append(contentsOf: rHalf[rightIndex ..< rHalf.endIndex])
            break
        }
        guard rightIndex < rHalf.endIndex else {
            sorted.append(contentsOf: lHalf[leftIndex ..< lHalf.endIndex])
            break
        }
        
        if ascending {
            if lHalf[leftIndex] < rHalf[rightIndex] {
                sorted.append(lHalf[leftIndex])
                leftIndex += 1
            } else {
                sorted.append(rHalf[rightIndex])
                rightIndex += 1
            }
        } else {
            if lHalf[leftIndex] > rHalf[rightIndex] {
                sorted.append(lHalf[leftIndex])
                leftIndex += 1
            } else {
                sorted.append(rHalf[rightIndex])
                rightIndex += 1
            }
        }
    }
    
    return sorted
}

/* -------------- */

func countMaxSalary(deadlines: [Int], costs: [Int]) -> UInt64 {
    var sum: UInt64 = 0
    var used = [Bool](repeating: false, count: N + 1)
    
    for i in 0 ..< N {
        var k = deadlines[i]
        while k > 0 && used[k]  {
            k -= 1
        }
        if k == 0 {
            continue
        }
        used[k] = true
        sum += UInt64(costs[i])
    }
    return sum
}

//let sortedArray = mergeSort(c, ascendingOrder: false)

let sortedArray = selectionSort(deadline: d, cost: c)
let maxSum = countMaxSalary(deadlines: sortedArray.d, costs: sortedArray.c)

print("The maximum salary is \(maxSum)")

//: [Next](@next)
