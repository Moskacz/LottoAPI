//
//  LotteriesResultsImplDecodingTests.swift
//  LottoAPI
//
//  Created by Michal Moskala on 31/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import XCTest
@testable import LottoAPI

class LotteriesResultsImplDecodingTests: XCTestCase {

    func test_decode() throws {
        let jsonData = try JSONLoader.jsonData(name: "games")
        let results = try JSONDecoder.configured.decode(LotteriesResultsImpl.self, from: jsonData)
        XCTAssertNotNil(results.lotto)
        XCTAssertNotNil(results.superszansa)
        XCTAssertNotNil(results.lottoPlus)
        XCTAssertNotNil(results.mini)
        XCTAssertNotNil(results.joker)
        XCTAssertNotNil(results.kaskada1)
        XCTAssertNotNil(results.kaskada2)
        XCTAssertNotNil(results.mm1)
        XCTAssertNotNil(results.mm2)
        XCTAssertNotNil(results.extrapensja)
        XCTAssertNotNil(results.ss1)
        XCTAssertNotNil(results.ss2)
        XCTAssertNotNil(results.ej)
    }

}
