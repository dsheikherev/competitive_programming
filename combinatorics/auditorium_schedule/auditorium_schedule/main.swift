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

func sort(left: inout [Int], right: inout [Int]) {
    for i in 0..<right.count {
        for j in stride(from: i, to: 0, by: -1) {
            if right[j] < right[j-1] {
                var temp = right[j-1]
                right[j-1] = right[j]
                right[j] = temp
                
                temp = left[j-1]
                left[j-1] = left[j]
                left[j] = temp
            } else { break }
        }
    }
}

func countMaxLessonsInAuditorium() -> Int{
    var count = 1
    var last = 0
    for i in 1..<right.count {
        if left[i] >= right[last] {
            count += 1
            last = i
        }
    }
    return count
}

var left = [Int]()
var right = [Int]()

let fileName = "/Users/dsheikherev/Work/Lessons/competitive_programming/combinatorics/auditorium_schedule/request2.txt"

var reader = FileReader()
reader.read(fileName)

left = reader.left
right = reader.right

sort(left: &left, right: &right)
var maxLessons = countMaxLessonsInAuditorium()

print("Max nonoverlapping lessons = \(maxLessons)")
