//
//  HTTPClient.swift
//  LottoAPI
//
//  Created by Michal Moskala on 16/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

internal protocol HTTPClient {
    @discardableResult func getResource(url: URL, completion: @escaping (Result<Data>) -> Void) -> URLSessionDataTask
}
