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
    let dummyViewContoller = DummyViewController()
    let mainViewController = MainViewController()
    let accountSummaryViewController = AccountSummaryViewController()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        dummyViewContoller.delegate = self
//        window?.rootViewController = LoginViewController()
//        window?.rootViewController = mainViewController
        window?.rootViewController = accountSummaryViewController 
        
        mainViewController.selectedIndex = 1
        
        
        
        return true
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
        if LocalState.hasOnboarded == false {
            rootViewController(onboardingContainerViewController)
            
        } else {
            rootViewController(dummyViewContoller)
        }
        
    }
    
    
}
extension AppDelegate : OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        
        rootViewController(dummyViewContoller)
    }
}

extension AppDelegate : LogoutDelegate {
    func didLogout() {
        rootViewController(loginViewController)
    }
}

