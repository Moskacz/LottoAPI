//
//  AllLotteriesResult.swift
//  LottoAPI
//
//  Created by Michal Moskala on 12/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

public struct LotteriesResults: Decodable {
    
    let lotto: LotteryResult?
    let superszansa: [LotteryResult]?
    let lottoPlus: LotteryResult?
    let mini: LotteryResult?
    let kaskada1: LotteryResult?
    let kaskada2: LotteryResult?
    let ss1: LotteryResult?
    let ss2: LotteryResult?
    
    enum CodingKeys: String, CodingKey {
        case lotto = "Lotto"
        case superszansa = "Superszansa"
        case lottoPlus = "LottoPlus"
        case mini = "Mini"
        case kaskada1 = "Kaskada1"
        case kaskada2 = "Kaskada2"
        case ss1 = "SS1"
        case ss2 = "SS2"
    }
}
