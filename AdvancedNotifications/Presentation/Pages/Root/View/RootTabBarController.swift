//
//  RootTabBarController.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation
import UIKit

class RootTabBarController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBar.isTranslucent = false
        
        let homeViewController = HomeFactory().buildModule()
        
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.navigationBar.isTranslucent = false
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
        
        setViewControllers([homeNavigationController], animated: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
