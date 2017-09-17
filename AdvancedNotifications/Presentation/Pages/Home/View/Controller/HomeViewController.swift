//
//  HomeViewController.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    override func loadView() {
        view = HomeView()
    }
}

extension HomeViewController: HomeViewControllerInput {
    
}
