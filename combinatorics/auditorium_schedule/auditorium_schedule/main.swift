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

func countMaxSatisfied(requests: [Request]) -> Int {
    var count = 1
    var last = 0
    for i in 1 ..< requests.count {
        if requests[i].left >= requests[last].right {
            count += 1
            last = i
        }
    }
    return count
}

let fileName = "/Users/dsheikherev/Work/Lessons/competitive_programming/combinatorics/auditorium_schedule/request2.txt"

var reader = FileReader()
reader.read(fileName)

var requests = reader.requests

requests.sort {
    $0.right < $1.right
}

var maxLessons = countMaxSatisfied(requests: requests)

print("Max nonoverlapping lessons = \(maxLessons)")
