//
//  File.swift
//  LottoAPI
//
//  Created by Michal Moskala on 30/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

struct LotteriesResultsImpl: LotteriesResults, Decodable {
    
    private var _lotto: LotteryResultImpl?
    var lotto: LotteryResult? { return _lotto }
    
    private var _superszansa: [LotteryResultImpl]?
    var superszansa: [LotteryResult]? { return _superszansa }
    
    private var _lottoPlus: LotteryResultImpl?
    var lottoPlus: LotteryResult? { return _lottoPlus }
    
    private var _mini: LotteryResultImpl?
    var mini: LotteryResult? { return _mini }
    
    private var _kaskada1: LotteryResultImpl?
    var kaskada1: LotteryResult? { return _kaskada1 }
    
    private var _kaskada2: LotteryResultImpl?
    var kaskada2: LotteryResult? { return _kaskada2 }
    
    private var _ss1: LotteryResultImpl?
    var ss1: LotteryResult? { return _ss1 }
    
    private var _ss2: LotteryResultImpl?
    var ss2: LotteryResult? { return _ss2 }
    
    enum CodingKeys: String, CodingKey {
        case _lotto = "Lotto"
        case _superszansa = "Superszansa"
        case _lottoPlus = "LottoPlus"
        case _mini = "Mini"
        case _kaskada1 = "Kaskada1"
        case _kaskada2 = "Kaskada2"
        case _ss1 = "SS1"
        case _ss2 = "SS2"
    }
}
