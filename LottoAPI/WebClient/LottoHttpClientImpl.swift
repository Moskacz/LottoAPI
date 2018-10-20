//
//  HttpClient.swift
//  LottoAPI
//
//  Created by Michal Moskala on 12/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

internal class LottoHttpClientImpl: LottoHTTPClient {
    
    private let httpClient: HTTPClient
    private let baseURL: URL
    
    internal init(httpClient: HTTPClient, baseURL: URL) {
        self.httpClient = httpClient
        self.baseURL = baseURL
    }
    
    func getNewestResults(completion: @escaping (Result<Any>) -> Void) {
        //http://serwis.mobilotto.pl/mapi_v6/index.php?json=getGames
        let serviceURL = baseURL.appendingPathComponent("mapi_v6").appendingPathExtension("index.php")
        var components = URLComponents(url: serviceURL, resolvingAgainstBaseURL: false)!
        components.queryItems = [URLQueryItem(name: "json", value: "getGames")]
        httpClient.getResource(url: components.url!) { (result: Result<Data>) in
            switch result {
            case .value(let responseData):
                completion(.value(responseData))
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}
