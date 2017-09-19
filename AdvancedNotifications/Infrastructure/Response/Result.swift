//
//  Result.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation

enum Result<T> {
    case data(T)
    case error(Error)
}

