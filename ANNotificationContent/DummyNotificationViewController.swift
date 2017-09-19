//
//  DummyNotificationViewController.swift
//  ANNotificationContent
//
//  Created by Danny Yassine on 2017-09-18.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import UserNotificationsUI

class DummyNotificationViewController: UIViewController, UNNotificationContentExtension {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var firstView: UIView! {
        didSet {
            firstView.backgroundColor = UIColor.red
        }
    }
    @IBOutlet weak var secondView: UIView! {
        didSet {
            secondView.backgroundColor = UIColor.orange
        }
    }
    
    @IBOutlet weak var firstConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondConstraint: NSLayoutConstraint!
    
    var didAnimate: Bool!
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
        self.didAnimate = false
        preferredContentSize = CGSize(width: self.view.frame.width, height: 75)
    }
    
    func didReceive(_ notification: UNNotification) {
        
        self.titleLabel.text = notification.request.content.title
        self.subTitleLabel.text = notification.request.content.subtitle + " " + notification.request.content.body
        
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        
        if response.actionIdentifier == "ANIMATE_ACTION" {
            
            self.didAnimate = !self.didAnimate
            
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                self.firstConstraint.constant = (self.didAnimate == true) ? -200 : 0
                self.view.layoutIfNeeded()
            }, completion: { (done) in
            })
            
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1.0, options: .curveEaseIn, animations: {
                self.secondConstraint.constant = (self.didAnimate == true) ? -200 : 0
                self.view.layoutIfNeeded()
            }, completion: { (done) in
            })
            completion(.doNotDismiss)
            
        } else if response.actionIdentifier == "TEXT1_ACTION" {
            
            if let responseTextInput = response as? UNTextInputNotificationResponse {
                if !responseTextInput.userText.isEmpty {
                    self.resignFirstResponder()
                    self.titleLabel.text = responseTextInput.userText
                }
            }
            
        } else if response.actionIdentifier == "COLOR_ACTION" {
            
            let red = CGFloat(arc4random_uniform(255)) / 255.0
            let green = CGFloat(arc4random_uniform(255)) / 255.0
            let blue = CGFloat(arc4random_uniform(255)) / 255.0
            
            self.view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            completion(.doNotDismiss)
            
        } else if response.actionIdentifier == "SPIN_ACTION" {
            
            UIView.animate(withDuration: 5.0, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                self.firstView.transform = self.firstView.transform.rotated(by: 360)
                self.secondView.transform = self.firstView.transform.rotated(by: 720)
            }, completion: { (done) in
                
            })
            completion(.doNotDismiss)
            
        } else if response.actionIdentifier == "SHOW_ACTION" {
            
            self.preferredContentSize = CGSize(width: self.view.bounds.width, height: 225)
            
        } else if response.actionIdentifier == "HIDE_ACTION" {
            
            preferredContentSize = CGSize(width: self.view.frame.width, height: 75)
            
        }
        
    }
    
}


