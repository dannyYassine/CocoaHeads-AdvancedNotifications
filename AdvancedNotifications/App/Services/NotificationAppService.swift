//
//  NotificationAppService.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

/// NotificationAppService
class NotificationAppService: NSObject {
    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    func setup() {
        DispatchQueue.main.async {
            let replyAction = UNTextInputNotificationAction(identifier: "REPLY_ACTION", title: "Reply", options: UNNotificationActionOptions.authenticationRequired, textInputButtonTitle: "Reply to post", textInputPlaceholder: "Something cool...")
            let sendLikeAction = UNNotificationAction(identifier: "SEND_LIKE_ACTION", title: "Send Like", options: UNNotificationActionOptions.authenticationRequired)
            let foregroundAction = UNNotificationAction(identifier: "FOREGROUND_ACTION", title: "Launch", options: UNNotificationActionOptions.foreground)
            
            let textAction = UNTextInputNotificationAction(identifier: "TEXT1_ACTION", title: "Text", options: UNNotificationActionOptions.authenticationRequired, textInputButtonTitle: "Send", textInputPlaceholder: "Something cool...")
            let animateAction = UNNotificationAction(identifier: "ANIMATE_ACTION", title: "Animate", options: UNNotificationActionOptions.authenticationRequired)
            let colorAction = UNNotificationAction(identifier: "COLOR_ACTION", title: "Random Color", options: UNNotificationActionOptions.authenticationRequired)
            let spingAction = UNNotificationAction(identifier: "SPIN_ACTION", title: "SPIN", options: UNNotificationActionOptions.authenticationRequired)
            
            let showAction = UNNotificationAction(identifier: "SHOW_ACTION", title: "Show", options: UNNotificationActionOptions.authenticationRequired)
            let hideAction = UNNotificationAction(identifier: "HIDE_ACTION", title: "Hide", options: UNNotificationActionOptions.authenticationRequired)
            let respondAction = UNTextInputNotificationAction(identifier: "RESPOND_ACTION", title: "Respond", options: UNNotificationActionOptions.authenticationRequired, textInputButtonTitle: "Send", textInputPlaceholder: "Something interesting...")
            
            let replyCategory = UNNotificationCategory(identifier: "REPLY_CATEGORY", actions: [replyAction, sendLikeAction], intentIdentifiers: [replyAction.identifier], options: UNNotificationCategoryOptions.customDismissAction)
            let sendAction = UNNotificationCategory(identifier: "SEND_CATEGORY", actions: [sendLikeAction], intentIdentifiers: [sendLikeAction.identifier], options: UNNotificationCategoryOptions.customDismissAction)
            let foregroundCategory = UNNotificationCategory(identifier: "FOREGROUND_CATEGORY", actions: [foregroundAction], intentIdentifiers: [foregroundAction.identifier], options: UNNotificationCategoryOptions.customDismissAction)
            let notificationCategory = UNNotificationCategory(identifier: "myNotificationCategory", actions: [showAction, hideAction, animateAction, colorAction, spingAction, textAction], intentIdentifiers: [showAction.identifier, hideAction.identifier, animateAction.identifier, colorAction.identifier, spingAction.identifier, textAction.identifier], options: .customDismissAction)
            let chartCategory = UNNotificationCategory(identifier: "chartCategory", actions: [], intentIdentifiers: [], options: .customDismissAction)
            
            let demoCategory = UNNotificationCategory(identifier: "demoCategory", actions: [showAction, hideAction, animateAction, respondAction], intentIdentifiers: [showAction.identifier, hideAction.identifier, animateAction.identifier, respondAction.identifier], options: .customDismissAction)
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { (isAuthorized, error) in
                UNUserNotificationCenter.current().setNotificationCategories([replyCategory, sendAction, foregroundCategory, notificationCategory, chartCategory, demoCategory])
            })
        }
    }
}

//MARK: - UIApplicationDelegate
extension NotificationAppService: UIApplicationDelegate {
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        
    }
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
        
    }
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable : Any], withResponseInfo responseInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
        
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
}

//MARK: - UNUserNotificationCenterDelegate
extension NotificationAppService: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
    }
}
