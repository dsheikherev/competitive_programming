//
//  Exchange.swift
//  exchange
//
//  Created by Denis Sheikherev on 15.06.2020.
//  Copyright © 2020 Denis Sheikherev. All rights reserved.
//

import Foundation

class Exchange {
    private var sumToExchange = 0
    private var minCoinsToExchange = 0
    private var minCoinsToExchangeEverySum: [Int]? // Index is sum and value is minimum number of coins to exchange this sum
    
    private var denominationCertificate: [Int]?
    private var certificate = ""
    
    private var denominationsOfCoins = [Int]()
    
    private let INF = Int.max
    
    func coinsToExchangeSumOf(_ sum: Int, with denominations: [Int]) -> Int {
        guard sum != 0 else { return 0 } // It needs 0 coins to exchange 0 sum
               
        guard sum != sumToExchange || !denominations.hasSameElementsWith(denominationsOfCoins) else { return minCoinsToExchange } // Do not recalculate
        
        sumToExchange = sum
        denominationsOfCoins = denominations
        
        minCoinsToExchangeEverySum = [Int](repeating: INF, count: sum + 1)
        denominationCertificate = [Int](repeating: INF, count: sum + 1)
        
        minCoinsToExchangeEverySum![0] = 0 // It needs 0 coins to exchange 0 sum
        
        for i in 1 ... sum {
            minCoinsToExchangeEverySum![i] = INF
            for j in 0 ..< denominations.count {
                if i - denominations[j] >= 0 && minCoinsToExchangeEverySum![i - denominations[j]] + 1 < minCoinsToExchangeEverySum![i] {
                    minCoinsToExchangeEverySum![i] = minCoinsToExchangeEverySum![i - denominations[j]] + 1
                    denominationCertificate![i] = denominations[j]
                }
            }
        }
        
        minCoinsToExchange = minCoinsToExchangeEverySum![sum]
        
        certificate = getDenominationCertificate(sum: sum)
        
        return minCoinsToExchange
    }
    
    private func getDenominationCertificate(sum: Int) -> String {
        guard let certificate = denominationCertificate else { return "" }
        
        guard sum != 0 else { return "" }
        
        var cert = getDenominationCertificate(sum: sum - certificate[sum])
        if sum - certificate[sum] > 0 {
            cert += " + "
        }
        
        cert += "\(certificate[sum])"
        
        return cert
    }
    
    func getCertificate() -> String {
        return certificate
    }
    
}

extension Array where Element: Comparable {
    func hasSameElementsWith(_ array: Array<Element>) -> Bool {
        let ret = self.count == array.count && self.sorted() == array.sorted()
        return ret
    }
}
