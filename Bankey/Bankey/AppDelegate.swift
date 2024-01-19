//
//  AppDelegate.swift
//  Bankey
//
//  Created by Irfan Khan on 02/01/24.
//

import UIKit

let appColor : UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
        
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let mainViewController = MainViewController()
    let accountSummaryViewController = AccountSummaryViewController()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        
        let vc = mainViewController
        vc.setStatusBar()
        
        displayLogin()
        return true
    }
    
    private func displayLogin() {
        rootViewController(loginViewController)
        
    }
    
    private func displayNextScreen() {
        if LocalState.hasOnboarded {
            prepMainView()
            rootViewController(mainViewController)
        } else {
            rootViewController(onboardingContainerViewController)
        }
        
    }

    private func prepMainView() {
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
        
    }

    

    
}
extension AppDelegate {
    func rootViewController(_ vc : UIViewController, animated : Bool = true){
        guard animated, let window = self.window else {
            
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(
            with: window,
            duration: 0.7,
            options: .transitionCrossDissolve,
            animations: nil,
        completion: nil
        )
    }
    
}

extension AppDelegate : LoginViewControllerDelegate {
    func didLogin() {
        displayNextScreen()
    }
    
    
}
extension AppDelegate : OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        prepMainView()
        rootViewController(mainViewController)
    }
}

extension AppDelegate : LogoutDelegate {
    func didLogout() {
        rootViewController(loginViewController)
    }
}

