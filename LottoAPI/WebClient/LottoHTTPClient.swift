//
//  LottoHTTPClient.swift
//  LottoAPI
//
//  Created by Michal Moskala on 12/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

public protocol LottoHTTPClient {
    
    @discardableResult func getNewestResults(completion: @escaping (Result<LotteriesResults>) -> Void) -> URLSessionDataTask
}
