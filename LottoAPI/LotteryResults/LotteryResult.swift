//
//  LotteryResult.swift
//  LottoAPI
//
//  Created by Michal Moskala on 30/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

public protocol LotteryResult {
    var numbers: [Int] { get }
    var date: Date { get }
    var gameId: Int { get }
}

public protocol LotteryResultJoker: LotteryResult {
    var joker: Int { get }
}

public protocol LotteryResultPlus: LotteryResult {
    var plus: Int { get }
}

public protocol LotteryResultExtra: LotteryResult {
    var extra: [Int] { get }
}
