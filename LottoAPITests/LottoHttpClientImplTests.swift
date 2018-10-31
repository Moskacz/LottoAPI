//
//  LottoHttpClientImplTests.swift
//  LottoAPITests
//
//  Created by Michal Moskala on 20/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import XCTest
@testable import LottoAPI

class LottoHttpClientImplTests: XCTestCase {

    private var sut: LottoHttpClientImpl!
    private var httpClient: FakeHTTPClient!
    
    override func setUp() {
        httpClient = FakeHTTPClient()
        sut = LottoHttpClientImpl(httpClient: httpClient,
                                  baseURL: URL(string: "http://serwis.mobilotto.pl")!)
    }

    override func tearDown() {
        sut = nil
        httpClient = nil
    }

    func test_getNewestResults_url() {
        let expectedURL = URL(string: "http://serwis.mobilotto.pl/mapi_v6/index.php?json=getGames")!
        sut.getNewestResults(completion: { _ in })
        XCTAssertEqual(httpClient.passedURL, expectedURL)
    }
    
    func test_getNewestResults_decoding() throws {
        httpClient.completionResult = Result.value(try JSONLoader.jsonData(name: "games"))
        
        let exp = expectation(description: "response decoded")
        
        sut.getNewestResults { (result) in
            switch result {
            case .error(_):
                XCTFail()
            case .value(_):
                exp.fulfill()
            }
        }
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }

}
