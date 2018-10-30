//
//  LotteryResultDecodingTests.swift
//  LottoAPITests
//
//  Created by Michal Moskala on 12/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import XCTest
@testable import LottoAPI

class LotteryResultDecodingTests: XCTestCase {

    func test_decode() throws {
        let jsonData = try JSONLoader.jsonData(name: "lottery_result")
        let parsedObject = try JSONDecoder.configured.decode(LotteryResultImpl.self, from: jsonData)
        XCTAssertEqual(parsedObject.numbers, [17,15,38,9,1,3])
        XCTAssertEqual(parsedObject.gameId, 6163)
        
        let lotteryDate = Date(timeIntervalSince1970: 1539036000)// 2018-10-08 22:00 UTC
        XCTAssertEqual(parsedObject.date, lotteryDate)
    }
    
    func test_decode_plus() throws {
        let jsonData = try JSONLoader.jsonData(name: "plus")
        let parsedObject = try JSONDecoder.configured.decode(LotteryResultPlusImpl.self, from: jsonData)
        XCTAssertEqual(parsedObject.plus, 15)
    }
    
    func test_decode_joker() throws {
        let jsonData = try JSONLoader.jsonData(name: "joker")
        let parsedObject = try JSONDecoder.configured.decode(LotteryResultJokerImpl.self, from: jsonData)
        XCTAssertEqual(parsedObject.joker, 59)
    }
    
    func test_decode_extra() throws {
        let jsonData = try JSONLoader.jsonData(name: "extra")
        let parsedObject = try JSONDecoder.configured.decode(LotteryResultExtraImpl.self, from: jsonData)
        XCTAssertEqual(parsedObject.extra, [7,8])
    }
}
