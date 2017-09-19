//
//  LocalNotificationService.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation
import UserNotifications

enum NotificationCategory: RawRepresentable {
    typealias RawValue = String
    init?(rawValue: String) {
        switch rawValue {
        case "category_dummy":
            self = .dummy
        default:
            self = .none
        }
    }
    var rawValue: String {
        switch self {
        case .dummy:
            return "category_dummy"
        case .none:
            return ""
        }
    }
    
    case dummy, none
}

struct NotificationRequest {
    var body: String
    var title: String
    var message: String
    var triggerDate: Date
    var ressourcePath: String?
    var category: NotificationCategory?
}

protocol LocalNotificationDataSource {
    func sendNotification(withRequest request: NotificationRequest, completion: ((_ suceeded: Bool) -> Void)?)
}

class LocalNotificationService {
    
}

extension LocalNotificationService: LocalNotificationDataSource {
    func sendNotification(withRequest request: NotificationRequest, completion: ((Bool) -> Void)?) {
        
        let content = UNMutableNotificationContent()
        content.body = request.body
        content.title = request.title
        content.subtitle = request.message
        
        if let category = request.category?.rawValue {
            content.categoryIdentifier = category
        }
        
        if let ressourcePath = request.ressourcePath {
            do {
                content.attachments = try [UNNotificationAttachment(identifier: "1234", url: URL(fileURLWithPath: ressourcePath), options: nil)]
            } catch _ {
            }
        }
        
        let unitComponents: Set<Calendar.Component> = [.hour, .day, .month, .year]
        let components = Calendar.current.dateComponents(unitComponents, from: request.triggerDate)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
        
        let notificationRequest = UNNotificationRequest(identifier: "123", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            completion?(error == nil ? true : false)
        }

    }
}
