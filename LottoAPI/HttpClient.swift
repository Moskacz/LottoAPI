//
//  HttpClient.swift
//  LottoAPI
//
//  Created by Michal Moskala on 12/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

internal protocol HttpClient {
    
    func getResource(at url: URL, completion: (Result<Any, NSError>) -> Void)
}
