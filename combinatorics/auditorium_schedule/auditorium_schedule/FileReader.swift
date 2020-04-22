//
//  FileReader.swift
//  auditorium_schedule
//
//  Created by Denis Sheikherev on 24.02.2020.
//  Copyright © 2020 Denis Sheikherev. All rights reserved.
//

import Foundation

struct FileReader {
    var right: [Int] = []
    var left: [Int] = []

    mutating func read(_ filename: String) {
        let url = URL(fileURLWithPath: filename)
        if let data = try? Data(contentsOf: url) {
            let array = data.split(separator: UInt8(ascii: "\n"))
            for line in array {
                let pair = String(decoding: line, as: UTF8.self).split(separator: " ")

                guard pair.count == 2,
                    let first = Int(String(pair.first ?? "").trimmingCharacters(in: .whitespacesAndNewlines)),
                    let last = Int(String(pair.last ?? "").trimmingCharacters(in: .whitespacesAndNewlines)) else {
                    print("Could not convert line to Int values, \(pair)")
                    continue
                }
                left.append(first)
                right.append(last)
            }
        }
    }

}
