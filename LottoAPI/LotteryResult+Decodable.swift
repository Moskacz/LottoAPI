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
        self.init(numbers: try container.decode([Int].self, forKey: .numbers),
                  date: try container.decode(Date.self, forKey: .date),
                  gameId: try container.decode(Int.self, forKey: .gameId))
    }
    
    private enum CodingKeys: String, CodingKey {
        case numbers = "numerki"
        case date = "data_losowania"
        case gameId = "num_losowania"
    }
}
