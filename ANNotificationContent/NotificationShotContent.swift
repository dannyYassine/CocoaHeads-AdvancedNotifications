//
//  NotificationShotContent.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-18.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import UserNotificationsUI

class DetailShotNotificationViewController: UIViewController, UNNotificationContentExtension {
    
    override func loadView() {
        view = NotificationShotView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
        
    }
    
    func didReceive(_ notification: UNNotification) {
        
//        self.userLabel.text = (notification.request.content.userInfo["aps"] as! [String: Any])["title"] as? String
//        self.detailLabel.text = (notification.request.content.userInfo["aps"] as! [String: Any])["subtitle"] as? String
//
//        self.preferredContentSize = CGSize(width: self.view.frame.width, height: self.view.frame.width * 0.75 + 50)
//        if let notificationData = notification.request.content.userInfo["data"] as? [String: String], let urlString = notificationData["attachment-url"], let fileUrl = URL(string: urlString) {
//            print(fileUrl)
//            //            self.shotImageView.downloadImageFromStringURL(urlString, completion: { (image) in
//            //                self.shotImageView.image = image
//            //            })
//
//        }
        
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        
        if response.actionIdentifier == "ACTION_VIEW" {
            completion(.doNotDismiss)
        }
        
    }
    
}
