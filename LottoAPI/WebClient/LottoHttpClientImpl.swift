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
    
    @discardableResult func getNewestResults(completion: @escaping (Result<LotteriesResults>) -> Void) -> URLSessionDataTask {
        let serviceURL = baseURL.appendingPathComponent("mapi_v6").appendingPathComponent("index").appendingPathExtension("php")
        var components = URLComponents(url: serviceURL, resolvingAgainstBaseURL: false)!
        components.queryItems = [URLQueryItem(name: "json", value: "getGames")]
        return httpClient.getResource(url: components.url!) { (result: Result<Data>) in
            switch result {
            case .value(let responseData):
                do {
                    let lotteriesResults = try JSONDecoder.configured.decode(LotteriesResultsImpl.self, from: responseData)
                    completion(.value(lotteriesResults))
                } catch {
                    completion(.error(error))
                }
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}
