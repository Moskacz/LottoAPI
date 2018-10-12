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
        let parsedObject = try JSONDecoder.configured.decode(LotteryResult.self, from: jsonData)
        XCTAssertEqual(parsedObject.numbers, [17,15,38,9,1,3])
        XCTAssertEqual(parsedObject.gameId, 6163)
        
        let lotteryDate = Date(timeIntervalSinceReferenceDate: 560725200)// 2018-10-09 00:00 UTC
        XCTAssertEqual(parsedObject.date, lotteryDate)
    }

}
