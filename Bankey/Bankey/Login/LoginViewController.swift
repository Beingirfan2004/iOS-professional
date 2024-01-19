//
//  ViewController.swift
//  Bankey
//
//  Created by Irfan Khan on 02/01/24.
//

import UIKit
import Foundation

protocol LogoutDelegate : AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate : AnyObject {
    func didLogin()
    
}

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate : LoginViewControllerDelegate?
    var username : String? {
        return loginView.userTextField.text
    }
    var password : String? {
        return loginView.passwordTextField.text
    }
    // animation
    
    var leadingEdgeOnScreen : CGFloat = 16
    var leadingEdgeOffScreen : CGFloat = -1000
    
    var titleLeadingAnchor : NSLayoutConstraint?
    var subTitleLeadingAnchor : NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        signInButton.configuration?.showsActivityIndicator = false
        loginView.userTextField.text = ""
        loginView.passwordTextField.text = ""
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }


}
extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "Bankey"
        titleLabel.alpha = 0
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subTitleLabel.textAlignment = .center
        subTitleLabel.adjustsFontForContentSizeCategory = true
        subTitleLabel.numberOfLines = 0
        subTitleLabel.text = "Your premium source of all things banking."
        subTitleLabel.alpha = 0

    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // TITLE
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
           
        ])
        titleLeadingAnchor = titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        
        titleLeadingAnchor?.isActive = true
        
        // SUBTITLE
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 3),
            subTitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
            
        ])
        
        // SUBTITLE - CENTERX - MULTILINE
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 3),
            subTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        subTitleLeadingAnchor = subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        subTitleLeadingAnchor?.isActive = true

        
        // SUBTITLE - WIDTH - ALIGNMENT OFF
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 3),
            subTitleLabel.widthAnchor.constraint(equalTo: loginView.widthAnchor)
        ])
        
        // SUBTITLE - PINNING LEADING TRAILING
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 3),
            subTitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //Login View
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2)
        ])
        
        // Sign In Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // ERROR LABEL
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
            
        ])


        
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
        login()
    }
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil.")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage : "Username / password cannot be blank.")
            return
        }
        
        if username == "A" && password == "A" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Invalid username / password")
        }
    }
    
    private func configureView(withMessage message : String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}

//MARK: - Animations

extension LoginViewController {
    private func animate(){
        let duration = 1.0
        
        let animator1 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut){
            self.titleLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator1.startAnimation()
        
        let animator2 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut){
            self.subTitleLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator2.startAnimation(afterDelay: 0.3)
        
        let animator3 = UIViewPropertyAnimator(duration: duration * 2, curve: .easeInOut){
            self.titleLabel.alpha = 1.0
            self.view.layoutIfNeeded()
        }
        animator3.startAnimation(afterDelay: 0.2)
        
        let animator4 = UIViewPropertyAnimator(duration: duration * 2, curve: .easeInOut){
            self.subTitleLabel.alpha = 1.0
            self.view.layoutIfNeeded()
        }
        animator4.startAnimation(afterDelay: 0.2)


        

    }
}

