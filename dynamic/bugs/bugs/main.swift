//
//  main.swift
//  bugs
//
//  Created by Denis Sheikherev on 12.06.2020.
//  Copyright © 2020 Denis Sheikherev. All rights reserved.
//

import Foundation

var matrix = [
    [1, 4, 1, 2, 3],
    [2, 3, 2, 1, 4],
    [1, 1, 1, 2, 4],
    [2, 5, 1, 7, 1]
]

var bug = Bug(matrix: matrix)

bug.findOptimalPath()

print(bug.getCertificate() ?? "")
print(bug.getMaxScore() ?? 0)
