//
//  HomePresenter.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation

class HomePresenter: NSObject {
    var localNotificationInteractor: SendLocalNotificationInput?
}

extension HomePresenter: HomeViewControllerOutput {
    func didSelectAction(atIndexPath indexPath: IndexPath) {
        let handler: (_ sent: Bool) -> Void = { (sent) in
            print("Notifcation Sent: \(sent)")
        }
        let localNotificationRequest = LocalNotificationRequest()
        localNotificationRequest.message = "Hello from CocoaHeads"
        switch indexPath.row {
        case 0:
            localNotificationRequest.title = "Image"
        case 1:
            localNotificationRequest.title = "Video"
            localNotificationRequest.type = .video
        case 2:
            localNotificationRequest.title = "Audio"
            localNotificationRequest.type = .audio
        case 3:
            localNotificationRequest.title = "Gif"
            localNotificationRequest.type = .gif
        case 4:
            localNotificationRequest.title = "Custom View"
            localNotificationRequest.type = .custom
            localNotificationRequest.category = "category_dummy"
        case 5:
            localNotificationRequest.title = "Custom View 2"
        case 6:
            localNotificationRequest.title = "Reveal"
        default:
            return
        }
        localNotificationInteractor?.sendNotification(request: localNotificationRequest, completion: handler)
    }
}
