//
//  HomeView.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import UIKit

protocol HomeViewDelegate: class {
    func homeView(_ homeView: HomeView, didSelectAtIndexPath indexPath: IndexPath)
}

class HomeView: UIView {
    weak var delegate: HomeViewDelegate?
    
    var buttonsContainer: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = UIStackViewAlignment.center
        view.distribution = UIStackViewDistribution.fillEqually
        view.axis = UILayoutConstraintAxis.vertical
        return view
    }()
    
    var imageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Image", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.sizeToFit()
        button.tag = 0
        return button
    }()
    
    var videoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Video", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.sizeToFit()
        button.tag = 1
        return button
    }()
    
    var audioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Audio", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.sizeToFit()
        button.tag = 2
        return button
    }()
    
    var gifButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Gif", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.sizeToFit()
        button.tag = 3
        return button
    }()
    
    var foregroundButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ForeGround", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.sizeToFit()
        button.tag = 4
        return button
    }()
    
    var customViewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Custom View", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.sizeToFit()
        button.tag = 5
        return button
    }()
    
    var secondCustomViewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Seond Custom View", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.sizeToFit()
        button.tag = 6
        return button
    }()
    
    var revealInforCardButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Reveal", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.sizeToFit()
        button.tag = 7
        return button
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
        addSubview(buttonsContainer)
        buttonsContainer.addArrangedSubview(imageButton)
        buttonsContainer.addArrangedSubview(videoButton)
        buttonsContainer.addArrangedSubview(audioButton)
        buttonsContainer.addArrangedSubview(gifButton)
        buttonsContainer.addArrangedSubview(customViewButton)
        buttonsContainer.addArrangedSubview(secondCustomViewButton)
        buttonsContainer.addArrangedSubview(revealInforCardButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonsContainer.leftAnchor.constraint(equalTo: leftAnchor),
            buttonsContainer.rightAnchor.constraint(equalTo: rightAnchor),
            buttonsContainer.topAnchor.constraint(equalTo: topAnchor),
            buttonsContainer.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    func setupActions() {
        imageButton.addTarget(self, action: #selector(didPressedOnButton(button:)), for: .touchUpInside)
        videoButton.addTarget(self, action: #selector(didPressedOnButton(button:)), for: .touchUpInside)
        audioButton.addTarget(self, action: #selector(didPressedOnButton(button:)), for: .touchUpInside)
        gifButton.addTarget(self, action: #selector(didPressedOnButton(button:)), for: .touchUpInside)
        customViewButton.addTarget(self, action: #selector(didPressedOnButton(button:)), for: .touchUpInside)
        secondCustomViewButton.addTarget(self, action: #selector(didPressedOnButton(button:)), for: .touchUpInside)
        revealInforCardButton.addTarget(self, action: #selector(didPressedOnButton(button:)), for: .touchUpInside)
    }
    
    @objc func didPressedOnButton(button: UIButton) {
        let indexPath = IndexPath(row: button.tag, section: 0)
        delegate?.homeView(self, didSelectAtIndexPath: indexPath)
    }
    
}
