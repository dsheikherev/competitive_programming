//
//  main.swift
//  exchange
//
//  Created by Denis Sheikherev on 15.06.2020.
//  Copyright © 2020 Denis Sheikherev. All rights reserved.
//

import Foundation

print("Hello, World!")

let exchange = Exchange()

var coinsIn = exchange.coinsToExchangeSumOf(25, with: [1, 5, 10])
var ceert = exchange.getCertificate()
print(coinsIn)
print(ceert)

coinsIn = exchange.coinsToExchangeSumOf(25, with: [1, 5, 10])
ceert = exchange.getCertificate()
print(coinsIn)
print(ceert)

coinsIn = exchange.coinsToExchangeSumOf(25, with: [1, 5])
ceert = exchange.getCertificate()
print(coinsIn)
print(ceert)
