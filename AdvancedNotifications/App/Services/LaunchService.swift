//
//  LaunchService.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation
import UIKit

class LaunchService: NSObject {
    
    weak var window: UIWindow?
    
    //MARK: - Init
    
    init(withWindow window: inout UIWindow?) {
        super.init()
        self.window = window
        self.window?.makeKeyAndVisible()
    }
    
    //MARK: - Instance Methods
    
    func handleRemoteNotificationLaunch(withUserInfo userInfo: [AnyHashable: Any]) {
        
    }
}

extension LaunchService: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        // Core Data
        // Resources cleanup
        
        self.window?.rootViewController = RootFactory().buildModule()
        
        if let userInfo = launchOptions?[.remoteNotification] as? [AnyHashable: Any] {
            handleRemoteNotificationLaunch(withUserInfo: userInfo)
        }
        
        return false
    }
}
