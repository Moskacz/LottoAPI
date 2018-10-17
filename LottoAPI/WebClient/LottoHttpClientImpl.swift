//
//  HttpClient.swift
//  LottoAPI
//
//  Created by Michal Moskala on 12/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

internal class LottoHttpClientImpl {
    
    private let urlSession: URLSession
    private let baseURL: URL
    
    internal init(urlSession: URLSession, baseURL: URL) {
        self.urlSession = urlSession
        self.baseURL = baseURL
    }
}

extension LottoHttpClientImpl {
    
    private enum HttpClientError: Error {
        case requestFailed
    }
    
    private func getResource(url: URL, completion: @escaping (Result<Data>) -> Void) {
        let task = urlSession.dataTask(with: url) { (data: Data?, _, error: Error?) in
            if let responseData = data {
                completion(.value(responseData))
            } else if let error = error {
                completion(.error(error))
            } else {
                completion(.error(HttpClientError.requestFailed))
            }
        }
        
        task.resume()
    }
    
}

extension LottoHttpClientImpl: LottoHTTPClient {
    func getNewestResults(completion: @escaping (Result<Any>) -> Void) {
        
    }
}
