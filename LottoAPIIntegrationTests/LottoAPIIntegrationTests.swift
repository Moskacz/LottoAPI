//
//  LottoAPIIntegrationTests.swift
//  LottoAPIIntegrationTests
//
//  Created by Michal Moskala on 21/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import XCTest
@testable import LottoAPI

class LottoAPIIntegrationTests: XCTestCase {

    private var sut: LottoHttpClientImpl!
    
    override func setUp() {
        sut = LottoHttpClientImpl(httpClient: URLSession.shared,
                                  baseURL: URL(string: "http://serwis.mobilotto.pl")!)
    }

    override func tearDown() {
        sut = nil
    }

    func test() {
        let exp = expectation(description: "data retrieved")
        
        sut.getNewestResults { (result) in
            switch result {
            case .error(_):
                XCTFail("data retrieve failed")
            case .value(let lotteriesResults):
                XCTAssertNotNil(lotteriesResults.lotto)
                XCTAssertNotNil(lotteriesResults.lottoPlus)
                exp.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }

}
