//
//  SendLocalNotificationContract.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation

enum NotificationMediaType: Int {
    case image, video, gif, audio
}

class LocalNotificationRequest {
    var title: String?
    var message: String?
    var type: NotificationMediaType = .image
}

protocol SendLocalNotificationInput {
    func sendNotification(request: LocalNotificationRequest, completion: ((_ sent: Bool) -> Void)?)
}
