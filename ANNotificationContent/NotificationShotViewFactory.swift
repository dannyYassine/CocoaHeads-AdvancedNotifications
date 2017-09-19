//
//  NotificationShotViewFactory.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-18.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation

class NotificationShotViewFactory: ModuleFactory {
    typealias ViewController = DetailShotNotificationViewController
    func buildModule() -> DetailShotNotificationViewController {
        let viewController = DetailShotNotificationViewController()
        
        return viewController
    }
}
