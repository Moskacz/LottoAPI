//
//  LottoAPITests.swift
//  LottoAPI
//
//  Created by Michal Moskala on 31/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import XCTest
@testable import LottoAPI

class LottoAPITests: XCTestCase {

    func test_client() {
        XCTAssertTrue(LottoAPI.makeClient(baseURL: URL(string: "http://apple.com")!) is LottoHttpClientImpl)
    }

}
