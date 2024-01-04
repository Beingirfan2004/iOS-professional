//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Irfan Khan on 04/01/24.
//

import UIKit

class OnboardingViewController : UIViewController {
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        
    }
}

extension OnboardingViewController {
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        //IMAGE
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "car")
        
        // LABEL
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "Bankey is faster, easier to use and has a brand new look and feel that will make you feel like you are back in 1989."
        
    }
    private func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        
        // STACK VIEW LAYOUT
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
        

    }
}