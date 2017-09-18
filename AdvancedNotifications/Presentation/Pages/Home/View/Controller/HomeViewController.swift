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
    var outputDelegate: HomeViewControllerOutput?
    var mainView: HomeView {
        return view as! HomeView
    }
    override func loadView() {
        view = HomeView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
    }
}

extension HomeViewController: HomeViewDelegate {
    func homeView(_ homeView: HomeView, didSelectAtIndexPath indexPath: IndexPath) {
        outputDelegate?.didSelectAction(atIndexPath: indexPath)
    }
}

extension HomeViewController: HomeViewControllerInput {
    
}
