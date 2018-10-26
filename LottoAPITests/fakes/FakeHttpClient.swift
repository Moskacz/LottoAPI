//
//  FakeHttpClient.swift
//  LottoAPITests
//
//  Created by Michal Moskala on 20/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation
@testable import LottoAPI

class FakeHTTPClient: HTTPClient {
    
    var completionResult: Result<Data>?
    var passedURL: URL?
    
    @discardableResult func getResource(url: URL, completion: @escaping (Result<Data>) -> Void) -> URLSessionDataTask {
        passedURL = url
        if let result = completionResult {
            completion(result)
        }
        return URLSessionDataTask()
    }
}
