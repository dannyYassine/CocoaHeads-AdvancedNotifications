//
//  NotificationViewController.swift
//  ANNotificationContentExtension
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController {

    weak var currentViewController: UNNotificationContentExtension?
    weak var notification: UNNotification? {
        didSet {
            setup()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setup() {
        guard let notification = notification else {
            return
        }
        
        switch notification.request.content.categoryIdentifier {
        case "category_detail_shot_view":
            let viewController = NotificationShotViewFactory().buildModule()
            currentViewController = viewController
            addViewController(viewController)
        case "category_dummy":
            let viewController = UIStoryboard(name: "Dummy", bundle: nil).instantiateViewController(withIdentifier: "Dummy") as! DummyNotificationViewController
            currentViewController = viewController
            addViewController(viewController)
        default:
            return
        }
    }
    
    private func addViewController(_ viewController: UIViewController) {
        addChildViewController(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParentViewController: self)
    }
}

extension NotificationViewController: UNNotificationContentExtension {
    func didReceive(_ notification: UNNotification) {
        self.notification = notification
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        currentViewController?.didReceive?(response, completionHandler: completion)
    }
}
