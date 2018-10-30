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
        dateFormatter.timeZone = TimeZone(identifier: "Europe/Warsaw")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }
    
}

extension KeyedDecodingContainer {
    
    func decodeStringInt(key: KeyedDecodingContainer.Key) throws -> Int {
        let stringVal = try decode(String.self, forKey: key)
        return try convertToInt(stringVal: stringVal, key: key)
    }
    
    func decodeStringIntArray(key: KeyedDecodingContainer.Key) throws -> [Int] {
        let allNumbersString = try decode(String.self, forKey: key)
        
        let numbers = try allNumbersString.split(separator: ",").map { strValue -> Int in
            try convertToInt(stringVal: strValue, key: key)
        }
        
        return numbers
    }
    
    private func convertToInt<T: StringProtocol>(stringVal: T, key: KeyedDecodingContainer.Key) throws -> Int {
        guard let intVal = Int(stringVal) else {
            throw DecodingError.dataCorruptedError(forKey: key,
                                                   in: self,
                                                   debugDescription: "could not cast value \(stringVal) to int ")
        }
        return intVal
    }
    
}
