//
//  DummyviewController.swift
//  Bankey
//
//  Created by Irfan Khan on 05/01/24.
//

import UIKit

class DummyViewController : UIViewController {
    
    weak var delegate : LogoutDelegate?
    let stackView = UIStackView()
    let label = UILabel()
    let logoutButton = UIButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        
    }
}

extension DummyViewController {
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.setTitle("Logout", for: [.normal])
        logoutButton.isHidden = false
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .primaryActionTriggered)
        
    }
    private func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logoutButton)
        
        view.addSubview(stackView)
        
        // STACK VIEW LAYOUT
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 3)
        ])
    }
    
    @objc func logoutTapped() {
        delegate?.didLogout()
        
    }
}



