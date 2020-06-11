//
//  main.swift
//  petrol_stations
//
//  Created by Denis Sheikherev on 11.06.2020.
//  Copyright © 2020 Denis Sheikherev. All rights reserved.
//

import Foundation

let refuelings = Refuelings()

refuelings.readFile()
let count = refuelings.countRefuelings()

print(count)
