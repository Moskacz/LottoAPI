//
//  LotteryResultImpl.swift
//  LottoAPI
//
//  Created by Michal Moskala on 30/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

class LotteryResultImpl: LotteryResult, Decodable {
    
    let numbers: [Int]
    let date: Date
    let gameId: Int
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.numbers = try container.decodeStringIntArray(key: .numbers)
        self.date = try container.decode(Date.self, forKey: .date)
        self.gameId = try container.decodeStringInt(key: .gameId)
    }
    
    private enum CodingKeys: String, CodingKey {
        case numbers = "numerki"
        case date = "data_losowania"
        case gameId = "num_losowania"
    }
}

class LotteryResultJokerImpl: LotteryResultImpl, LotteryResultJoker {
    let joker: Int
    
    required init(from decoder: Decoder) throws {
        self.joker = try decoder.container(keyedBy: CodingKeys.self).decode(Int.self, forKey: .joker)
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case joker
    }
}

class LotteryResultJokerPlus: LotteryResultImpl, LotteryResultPlus {
    let plus: Int
    
    required init(from decoder: Decoder) throws {
        self.plus = try decoder.container(keyedBy: CodingKeys.self).decode(Int.self, forKey: .plus)
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case plus
    }
}

class LotteryResultJokerExtra: LotteryResultImpl, LotteryResultExtra {
    let extra: [Int]
    
    required init(from decoder: Decoder) throws {
        self.extra = try decoder.container(keyedBy: CodingKeys.self).decodeStringIntArray(key: .extra)
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case extra
    }
}
