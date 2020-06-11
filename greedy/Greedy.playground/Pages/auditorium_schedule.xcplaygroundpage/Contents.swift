// Задача о выборе заявок.
// Имеется аудитория и n заявок на проведение занятий в ней. Каждая заявка -
// это временной интервал [li,ri), причем левая граница включается в интервал,
// а правая - нет. Нужно выбрать наибольшее число заявок, чтобы они не пересекались по времени.

// Входные данные
// В первой строке задано целое число n - количество заявок. Следующие n строк описывают заявки:
// i-я строка содержит два целых числа - l[i] и r[i].
// Выходные данные
// Выведите одно целое число - наибольшее число заявок, которые можно удовлетворить.

// Пример входных данных
// 3
// 1 5
// 3 6
// 5 7
// Пример выходных данных
// 2

import Foundation
import UIKit

struct FileReader {
    var right: [Int] = []
    var left: [Int] = []

    mutating func read(_ filename: String) throws {
        let start = CFAbsoluteTimeGetCurrent()

        let url = URL(fileURLWithPath: filename)
        let data = Array(try Data(contentsOf: url))
        let array = data.split(separator: UInt8(ascii: "\n"))
        for line in array {
            let pair = String(decoding: line, as: UTF8.self).split(separator: " ")

            guard pair.count == 2,
                let first = Int(String(pair.first ?? "").trimmingCharacters(in: .whitespacesAndNewlines)),
                let last = Int(String(pair.last ?? "").trimmingCharacters(in: .whitespacesAndNewlines)) else {
                print("Could not convert line to Int values, \(pair)")
                continue
            }
            right.append(first)
            left.append(last)
        }

       print("Execution took \(CFAbsoluteTimeGetCurrent() - start) seconds")
    }
}

var N = Int ()
var l = [UInt16] ()
var r = [UInt16] ()

let fileName = "request2"

guard let path = Bundle.main.path(forResource: fileName, ofType: "txt") else { fatalError("Can't get \(fileName).txt")
}

var reader = FileReader()
do {
    try reader.read(path)
} catch _ {
    fatalError("Can't get contents of \(fileName).txt")
}

//do {
//    let contents = try String(contentsOfFile: path)
//    let contentsInStringArray = contents.components(separatedBy: .whitespacesAndNewlines)
//    var i = 0
//    var isNRead = false
//
//    for element in contentsInStringArray {
//        guard !element.isEmpty else {
//            continue
//        }
//
//        if !isNRead {
//            N = Int(element) ?? 0
//            isNRead = true
//            continue
//        }
//
//        let temp = UInt16(element) ?? 0
//        if i % 2 == 0 {
//            l.append(temp)
//        } else {
//            r.append(temp)
//        }
//        i += 1
//    }
//} catch _ {
//    fatalError("Can't get contents of \(fileName).txt")
//}

/* Selection_Sort */
func selectionSort(left: inout [UInt16], right: inout [UInt16]) {
    for i in 0..<right.count {
        var min = i
        for j in i + 1..<right.count {
            if right[min] > right[j] {
                min = j
            }
        }
        var temp = right[i]
        right[i] = right[min]
        right[min] = temp
        
        temp = left[i]
        left[i] = left[min]
        left[min] = temp
    }
}
/* -------------- */

func countMaxTimesAuditoriumIsFree() -> Int {
    var count = 1
    var last = 0
    for i in 1..<r.count {
        if l[i] >= r[last] {
            count += 1
            last = i
        }
    }
    return count
}

selectionSort(left: &l, right: &r)
let maxTimes = countMaxTimesAuditoriumIsFree()
