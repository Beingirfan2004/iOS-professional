//
//  ViewController.swift
//  Password
//
//  Created by Irfan Khan on 07/03/24.
//

import UIKit

class ViewController: UIViewController {
    let newPasswordTextField     = PasswordTextField(placeHolderText: "New Password")
    let stackView                = UIStackView()
    let passwordCriteriaView     = PasswordCriteriaView(text: "uppercase letter (A-Z)")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}


extension ViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis      = .vertical
        stackView.spacing   = 20
        
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        stackView.addArrangedSubview(passwordCriteriaView)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
        ])
    }
}

