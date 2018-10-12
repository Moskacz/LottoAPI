//
//  Result.swift
//  LottoAPI
//
//  Created by Michal Moskala on 12/10/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

public enum Result<T, E: Error> {
    case value(T)
    case error(E)
}