//
//  SendLocalNotificationInteractor.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation

class SendLocalNotificationInteractor {
    var notificationService: LocalNotificationService?
}

extension SendLocalNotificationInteractor: SendLocalNotificationInput {
    func sendNotification(request: LocalNotificationRequest, completion: ((Bool) -> Void)?) {
        
        guard let title = request.title, let message = request.message else {
            completion?(false)
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy M dd hh:mm:ss"
        
        let triggerDate = Date(timeIntervalSinceNow: 3.0)
        
        var path: String?
        switch request.type {
        case .image:
            path = Bundle.main.path(forResource: "trees", ofType: "png")
        case .audio:
            path = Bundle.main.path(forResource: "the_wire", ofType: "mp3")
        case .gif:
            path = Bundle.main.path(forResource: "the_wire", ofType: "mp3")
        case .video:
            path = Bundle.main.path(forResource: "the_wire", ofType: "mp3")
        }
        
        let notificationRequest = NotificationRequest(body:  dateFormatter.string(from: Date()), title: title, message: message, triggerDate: triggerDate, ressourcePath: path, category: .none)
        
        notificationService?.sendNotification(withRequest: notificationRequest, completion: { (succeeded) in
            completion?(succeeded)
        })
        
    }
}
