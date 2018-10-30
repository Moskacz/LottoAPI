//
//  LotteriesResults.swift
//  LottoAPI
//
//  Created by Michal Moskala on 30/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

public protocol LotteriesResults {
    var lotto: LotteryResult? { get }
    var superszansa: [LotteryResult]? { get }
    var lottoPlus: LotteryResult? { get }
    var mini: LotteryResult? { get }
    var kaskada1: LotteryResult? { get }
    var kaskada2: LotteryResult? { get }
    var ss1: LotteryResult? { get }
    var ss2: LotteryResult? { get }
}
