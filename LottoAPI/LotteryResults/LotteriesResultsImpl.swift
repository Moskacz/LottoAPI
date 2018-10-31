//
//  File.swift
//  LottoAPI
//
//  Created by Michal Moskala on 30/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

struct LotteriesResultsImpl: LotteriesResults, Decodable {
    
    private let _lotto: LotteryResultImpl?
    var lotto: LotteryResult? { return _lotto }
    
    private let _superszansa: [LotteryResultImpl]?
    var superszansa: [LotteryResult]? { return _superszansa }
    
    private let _lottoPlus: LotteryResultImpl?
    var lottoPlus: LotteryResult? { return _lottoPlus }
    
    private let _mini: LotteryResultImpl?
    var mini: LotteryResult? { return _mini }
    
    private let _joker: LotteryResultJokerImpl?
    var joker: LotteryResultJoker? { return _joker }
    
    private let _kaskada1: LotteryResultImpl?
    var kaskada1: LotteryResult? { return _kaskada1 }
    
    private let _kaskada2: LotteryResultImpl?
    var kaskada2: LotteryResult? { return _kaskada2 }
    
    private let _mm1: LotteryResultPlusImpl?
    var mm1: LotteryResultPlus? { return _mm1 }
    
    private let _mm2: LotteryResultPlusImpl?
    var mm2: LotteryResultPlus? { return _mm2 }
    
    private let _extrapensja: LotteryResultExtraImpl?
    var extrapensja: LotteryResultExtra? { return _extrapensja }
    
    private var _ss1: LotteryResultImpl?
    var ss1: LotteryResult? { return _ss1 }
    
    private var _ss2: LotteryResultImpl?
    var ss2: LotteryResult? { return _ss2 }
    
    private let _ej: LotteryResultExtraImpl?
    var ej: LotteryResultExtra? { return _ej }
    
    enum CodingKeys: String, CodingKey {
        case _lotto = "Lotto"
        case _superszansa = "Superszansa"
        case _lottoPlus = "LottoPlus"
        case _mini = "Mini"
        case _joker = "Joker"
        case _kaskada1 = "Kaskada1"
        case _kaskada2 = "Kaskada2"
        case _mm1 = "MM1"
        case _mm2 = "MM2"
        case _extrapensja = "EkstraPensja"
        case _ss1 = "SS1"
        case _ss2 = "SS2"
        case _ej = "EJ"
    }
}
