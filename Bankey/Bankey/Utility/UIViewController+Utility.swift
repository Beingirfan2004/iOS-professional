//
//  UIViewController+Utility.swift
//  Bankey
//
//  Created by Irfan Khan on 06/01/24.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let statusBarManager = windowScene.statusBarManager {
            let statusBarFrame = statusBarManager.statusBarFrame.size
                // Use statusBarFrame as needed
            let frame = CGRect(origin: .zero, size: statusBarFrame)
            let statusBarView = UIView(frame: frame)
            
            statusBarView.backgroundColor = appColor
            view.addSubview(statusBarView)

        }
    }
    
    func setTabBarImage(imageName : String, title : String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
        
    }
}
