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
    
    var imageName : String
    var labelText : String
    var imageScale : CGFloat
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        
    }
    init(imageName : String, labelText : String, imageScale : CGFloat) {
        self.imageName = imageName
        self.labelText = labelText
        self.imageScale = imageScale
        
        super.init(nibName : nil, bundle : nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingViewController {
    private func style() {
        view.backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        //IMAGE
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.contentScaleFactor = imageScale
        imageView.image = UIImage(named: imageName)
        
        // LABEL
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = labelText
        
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
