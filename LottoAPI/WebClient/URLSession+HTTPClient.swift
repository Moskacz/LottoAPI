//
//  HTTPClientImpl.swift
//  LottoAPI
//
//  Created by Michal Moskala on 16/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

extension URLSession: HTTPClient {
    
    private enum URLSessionError: Error {
        case requestFailed
    }
    
    func getResource(url: URL, completion: @escaping (Result<Data>) -> Void) {
        let task = dataTask(with: url) { (data: Data?, _, error: Error?) in
            if let responseData = data {
                completion(.value(responseData))
            } else if let error = error {
                completion(.error(error))
            } else {
                completion(.error(URLSessionError.requestFailed))
            }
        }
        
        task.resume()
    }
}
