//
//  PasswordCriteriaView.swift
//  Password
//
//  Created by Irfan Khan on 08/03/24.
//

import UIKit


class PasswordCriteriaView: UIView {
    let stackView       = UIStackView()
    let imageView       = UIImageView()
    let label           = UILabel()
    
    let circleImage     = UIImage(systemName: "circle")!.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
    let xmarkImage      = UIImage(systemName: "xmark.circle")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
    let checkmarkImage  = UIImage(systemName: "checkmark.circle")!.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
    var isCriteriaMet: Bool = false {
        didSet{
            if isCriteriaMet{
                imageView.image = checkmarkImage
            } else {
                imageView.image = xmarkImage
            }
        }
    }
    
    func reset() {
        isCriteriaMet       = false
        imageView.image     = circleImage
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    convenience init(text: String) {
        self.init(frame: .zero)
        
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 40)
    }
}


extension PasswordCriteriaView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints   = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis      = .horizontal
        stackView.spacing   = 8
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image  = circleImage
        imageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        imageView.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font              = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor         = .secondaryLabel
        label.numberOfLines     = 0
        label.lineBreakMode     = .byWordWrapping
        label.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        
    }
    
    
    func layout() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }
}
