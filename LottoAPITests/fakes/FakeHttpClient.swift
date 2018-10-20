//
//  FakeHttpClient.swift
//  LottoAPITests
//
//  Created by Michal Moskala on 20/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation
@testable import LottoAPI

class HttpClientFake: HTTPClient {
    
    var completionResult: Result<Data>?
    var passedURL: URL?
    
    func getResource(url: URL, completion: @escaping (Result<Data>) -> Void) {
        passedURL = url
        if let result = completionResult {
            completion(result)
        }
    }
}
