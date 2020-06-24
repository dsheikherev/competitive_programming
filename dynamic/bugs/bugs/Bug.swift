//
//  Bug.swift
//  bugs
//
//  Created by Denis Sheikherev on 12.06.2020.
//  Copyright © 2020 Denis Sheikherev. All rights reserved.
//

import Foundation

class Bug {
    
    enum Move {
        case R
        case D
        case Undefined
    }
    
    var matrix: [[Int]]?
    private var maxScore: Int?
    private var certificateString: String?
    
    init(matrix: [[Int]]) {
        self.matrix = matrix
        self.maxScore = 0
        self.certificateString = ""
    }
    
    func getCertificate() -> String? {
        return certificateString
    }
    
    func getMaxScore() -> Int? {
        return maxScore
    }
    
    func findOptimalPath() {
        guard let mtx = matrix else { return }
        
        var route = Array(repeating: Array(repeating: Move.Undefined, count: mtx[0].count), count: mtx.count)
        
        var points = Array(repeating: Array(repeating: 0, count: mtx[0].count), count: mtx.count)
        
        for r in 0 ..< mtx.count {
            for c in 0 ..< mtx[0].count {
                let currentElement = mtx[r][c]
                points[r][c] = currentElement
                
                if c > 0 && points[r][c - 1] + currentElement > points[r][c] {
                    points[r][c] = points[r][c - 1] + currentElement
                    route[r][c] = Move.R
                }
                if r > 0 && points[r - 1][c] + currentElement > points[r][c]{
                    points[r][c] = points[r - 1][c] + currentElement
                    route[r][c] = Move.D
                }
            }
        }
        maxScore = points[mtx.count - 1][mtx[0].count - 1]
        certificateString = certificateToString(route: route, row: route.count - 1, column: route[0].count - 1)
    }
    
    private func certificateToString(route: [[Move]], row: Int, column: Int) -> String {
        if row == 0 && column == 0 {
            return ""
        }
        
        switch route[row][column] {
            case .R:
                var p = certificateToString(route: route, row: row, column: column - 1)
                p += "R"
//                print("R")
                return p
            case .D:
                var p = certificateToString(route: route, row: row - 1, column: column)
                p += "D"
//                print("D")
                return p
            default:
                return ""
        }
        
    }
    
}
