//
//  Refuelings.swift
//  petrol_stations
//
//  Created by Denis Sheikherev on 11.06.2020.
//  Copyright © 2020 Denis Sheikherev. All rights reserved.
//

import Foundation

class Refuelings {
//    let N = 3
//    let totalDistance = 10
//    let distancePerTank = 4
//
//    var petrolStations = [3, 4, 6]
    
//    let N = 10
//    let totalDistance = 100
//    let distancePerTank = 25
//
//    var petrolStations = [13, 16, 21, 35, 38, 61, 67, 70, 77, 81]
    

    let N = 50000
    let totalDistance = 1000000000
    let distancePerTank = 1000000

    var petrolStations: [Int] = []
    
    func readFile() {
        let fileName = "/Users/dsheikherev/Work/Lessons/competitive_programming/combinatorics/petrol_stations/petrol2.txt"
        let url = URL(fileURLWithPath: fileName)
        if let strings = try? String(contentsOf: url) {
            let numbers = strings.components(separatedBy: .whitespacesAndNewlines).compactMap {Int($0)}
            petrolStations = numbers
        }
    }
    
    func countRefuelings() -> Int {
        petrolStations.append(totalDistance) // добавим в массив пункт назначения
        
        var refuelings = 0 // количество перезаправок
        var ableToReach = 0 + distancePerTank // до какого километра возможно доехать
                                              // в начале пути на полном баке возможно проехать distancePerTank
        
        for i in 0 ..< N {
            if petrolStations[i + 1] > ableToReach { // если следующего километра не достигнуть, то
                refuelings += 1 // заправляемся
                ableToReach = petrolStations[i] + distancePerTank // и вычисляем следующий достижимый километр
            }
        }
        
        return refuelings
    }
}
