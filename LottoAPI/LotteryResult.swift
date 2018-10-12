//
//  LotteryResult.swift
//  LottoAPI
//
//  Created by Michal Moskala on 12/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

public struct LotteryResult {
    
    public let numbers: [Int]
    public let date: Date
    public let gameId: Int
    
    public init(numbers: [Int], date: Date, gameId: Int) {
        self.numbers = numbers
        self.date = date
        self.gameId = gameId
    }
}
