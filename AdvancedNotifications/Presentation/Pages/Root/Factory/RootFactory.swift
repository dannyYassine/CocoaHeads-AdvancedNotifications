//
//  RootFactory.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation

class RootFactory: ModuleFactory {
    typealias ViewController = RootTabBarController
    func buildModule() -> RootTabBarController {
        let tabBarController = RootTabBarController()
        return tabBarController
    }
}
