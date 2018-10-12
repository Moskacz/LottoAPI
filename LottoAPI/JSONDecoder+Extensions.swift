//
//  JSONDecoder+Extensions.swift
//  LottoAPI
//
//  Created by Michal Moskala on 12/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    static var configured: JSONDecoder {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }
    
}
