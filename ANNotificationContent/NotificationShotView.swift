//
//  NotificationShotView.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-18.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation
import UIKit
import FLAnimatedImage

class NotificationShotView: UIView {
    
    var shotImageView: FLAnimatedImageView = {
        let shotImageView = FLAnimatedImageView()
        shotImageView.translatesAutoresizingMaskIntoConstraints = false
        shotImageView.contentMode = .scaleAspectFill
        return shotImageView
    }()
    var userImageView: UIImageView = {
        let userImageView = UIImageView()
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.contentMode = .scaleAspectFit
        userImageView.image = UIImage(named: "")
        return userImageView
    }()
    var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor.white
        setupHirarchy()
        setupConstraints()
        setupActions()
    }
    
    func setupHirarchy() {
        addSubview(shotImageView)
        addSubview(userImageView)
        addSubview(userLabel)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
                shotImageView.leftAnchor.constraint(equalTo: leftAnchor),
                shotImageView.topAnchor.constraint(equalTo: topAnchor),
                shotImageView.rightAnchor.constraint(equalTo: rightAnchor),
                shotImageView.heightAnchor.constraint(equalToConstant: 300),
                
                userImageView.leftAnchor.constraint(equalTo: leftAnchor),
                userImageView.heightAnchor.constraint(equalToConstant: 50),
                userImageView.widthAnchor.constraint(equalToConstant: 50),
                userImageView.topAnchor.constraint(equalTo: shotImageView.bottomAnchor, constant: 10),
                userImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                userLabel.leftAnchor.constraint(equalTo: userImageView.leftAnchor),
                userLabel.heightAnchor.constraint(equalTo: userImageView.heightAnchor),
                userLabel.rightAnchor.constraint(equalTo: userImageView.rightAnchor),
                userLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userImageView.layer.cornerRadius = userImageView.bounds.height / 2
        userImageView.layer.masksToBounds = true
    }
    
    func setupActions() {

    }
    
}
