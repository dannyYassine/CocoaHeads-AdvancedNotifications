//
//  HomeViewFactory.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation

class HomeFactory: ModuleFactory {
    typealias ViewController = HomeViewController
    func buildModule() -> HomeViewController {
        let viewController = HomeViewController()
        
        let sendLocalNotificationInteractor = SendLocalNotificationInteractor()
        sendLocalNotificationInteractor.notificationService = LocalNotificationService()
        
        let presenter = HomePresenter()
        presenter.localNotificationInteractor = sendLocalNotificationInteractor
        viewController.outputDelegate = presenter
        
        return viewController
    }
}
