//
//  JSONLoader.swift
//  LottoAPITests
//
//  Created by Michal Moskala on 12/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

enum LoadJSONError: Error {
    case fileMissing
}

class JSONLoader {
    static func jsonData(name: String) throws -> Data {
        let bundle = Bundle(for: self)
        guard let url = bundle.url(forResource: name, withExtension: "json") else {
            throw LoadJSONError.fileMissing
        }
        
        return try Data(contentsOf: url)
    }
}
