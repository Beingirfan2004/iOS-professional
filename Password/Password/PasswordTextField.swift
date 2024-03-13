//
//  PasswordTextField.swift
//  Password
//
//  Created by Irfan Khan on 07/03/24.
//

import UIKit

protocol PasswordTextFieldDelegate: AnyObject {
    func editingChanged(_ sender: PasswordTextField )
}

class PasswordTextField: UIView {
    let lockImageView       = UIImageView(image: UIImage(systemName: "lock.fill"))
    let textField           = UITextField()
    let eyeButton           = UIButton(type: .custom)
    let divider             = UIView()
    let errorMessageLabel   = UILabel()
    let placeHolderText: String
    weak var delegate: PasswordTextFieldDelegate?
    
    
    init(placeHolderText: String) {
        self.placeHolderText = placeHolderText
        
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 60)
    }
}

extension PasswordTextField {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints   = false
        
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        
        textField.translatesAutoresizingMaskIntoConstraints     = false
        textField.placeholder                                   = placeHolderText
        textField.isSecureTextEntry                             = false // true
        textField.delegate                                      = self
        textField.keyboardType                                  = .asciiCapable // to stop user from typing emojis.
        textField.attributedPlaceholder = NSAttributedString(string: placeHolderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel])
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.slash.circle"), for: .selected)
        eyeButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .separator
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.font                          = UIFont.preferredFont(forTextStyle: .footnote)
        errorMessageLabel.textColor                     = .systemRed
        errorMessageLabel.text                          = "Your password must meet the requirements below."
        errorMessageLabel.numberOfLines                 = 0
        errorMessageLabel.lineBreakMode                 = .byWordWrapping
        errorMessageLabel.isHidden                      = true // true
    }
    
    
    func layout() {
        self.addSubview(lockImageView)
        self.addSubview(textField)
        self.addSubview(eyeButton)
        self.addSubview(divider)
        self.addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            lockImageView.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: lockImageView.trailingAnchor, multiplier: 1),
            
            eyeButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            eyeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1),
            eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            divider.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            errorMessageLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 4),
            errorMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        //CHCR
        lockImageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        textField.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        eyeButton.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
    }
}

//MARK: - ACTIONS
extension PasswordTextField {
    @objc func togglePasswordView(_ sender: Any) {
        textField.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
    
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        delegate?.editingChanged(self)
    }

}

//MARK: - UITextFieldDelegate
extension PasswordTextField: UITextFieldDelegate {
}
