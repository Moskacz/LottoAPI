//
//  LottoAPI.swift
//  LottoAPI
//
//  Created by Michal Moskala on 23/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

public class LottoAPI {
    
    public static func makeClient(baseURL: URL) -> LottoHTTPClient {
        return LottoHttpClientImpl(httpClient: URLSession.shared, baseURL: baseURL)
    }
}
