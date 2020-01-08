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

guard let path = Bundle.main.path(forResource: "schedule", ofType: "txt") else { fatalError("Can't get schedule.txt")
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
    fatalError("Can't get contents of schedule.txt")
}

func sort(deadline: [Int], cost: [Int]) -> (d: [Int], c: [Int]) {
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

let sorted = sort(deadline: d, cost: c)
let maxSum = countMaxSalary(deadlines: sorted.d, costs: sorted.c)

print("The maximum salary is \(maxSum)")

//: [Next](@next)
