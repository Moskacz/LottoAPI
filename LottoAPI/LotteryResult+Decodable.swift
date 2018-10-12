//
//  LotteryResult+Decodable.swift
//  LottoAPI
//
//  Created by Michal Moskala on 12/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

extension LotteryResult: Decodable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let allNumbersString = try container.decode(String.self, forKey: .numbers)
        let numbers = try allNumbersString.split(separator: ",").map { strValue -> Int in
            if let intValue = Int(strValue) {
                return intValue
            } else {
                throw DecodingError.dataCorruptedError(forKey: CodingKeys.numbers,
                                                       in: container,
                                                       debugDescription: "could not cast value \(strValue) to int ")
            }
        }
        
        let gameIdStr = try container.decode(String.self, forKey: .gameId)
        guard let gameId = Int(gameIdStr) else {
            throw DecodingError.dataCorruptedError(forKey: CodingKeys.gameId,
                                                   in: container,
                                                   debugDescription: "could not cast value \(gameIdStr) to int")
        }
        
        self.init(numbers: numbers,
                  date: try container.decode(Date.self, forKey: .date),
                  gameId: gameId)
    }
    
    private enum CodingKeys: String, CodingKey {
        case numbers = "numerki"
        case date = "data_losowania"
        case gameId = "num_losowania"
    }
}
