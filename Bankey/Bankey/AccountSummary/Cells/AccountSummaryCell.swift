//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Irfan Khan on 08/01/24.
//

import UIKit


class AccountSummaryCell : UITableViewCell {
    
    enum AccountType : String {
        case Banking
        case CreditCard
        case Investment
    }
    
    struct ViewModel {
        let accountType : AccountType
        let accountName : String
        let balance: Decimal
        
        var balanceAsAttributedText : NSAttributedString {
            return CurrencyFormatter().makeAttributedCurrency(balance)
        }
    }
    
    let viewModel : ViewModel? = nil
    
    let typeLabel = UILabel()
    let divider = UIView()
    let nameLabel = UILabel()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
    let chevronImageView = UIImageView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight : CGFloat = 112
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AccountSummaryCell {
    private func setup() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Account type"
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = appColor
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.text = "Account name"
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.textAlignment = .right
        balanceLabel.adjustsFontSizeToFitWidth = true
        balanceLabel.text = "Some Balance"
        
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.textAlignment = .right
        balanceAmountLabel.text = "$XXX,XXX.XX"
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        chevronImageView.image = UIImage(systemName: "chevron.right")?.withTintColor(appColor, renderingMode: .alwaysOriginal)
        
        contentView.addSubview(typeLabel)
        contentView.addSubview(divider)
        contentView.addSubview(nameLabel)
        
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        
        contentView.addSubview(balanceStackView)
        contentView.addSubview(chevronImageView)
        
    }
    
    private func layout() {
        // TYPE LABEL
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2)
        ])
        
        // DIVIDER
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            divider.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            divider.widthAnchor.constraint(equalToConstant: 60),
            divider.heightAnchor.constraint(equalToConstant: 4)
        ])
        
        // ACCOUNT NAME
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor)
        ])
        
        // BALANCE STACK VIEW
        NSLayoutConstraint.activate([
            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 0),
            balanceStackView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 4)
        ])
        
        // CHEVRON IMAGE VIEW
        NSLayoutConstraint.activate([
            chevronImageView.centerYAnchor.constraint(equalTo: balanceStackView.centerYAnchor),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1)
            
        ])

    }
    
    private func makeFormattedBalance(dollars : String, cents: String ) -> NSMutableAttributedString {
        let dollarSignAttributes : [NSAttributedString.Key : Any] = [.font : UIFont.preferredFont(forTextStyle: .callout), .baselineOffset : 8]
        let dollarAttributes : [NSAttributedString.Key : Any] = [.font : UIFont.preferredFont(forTextStyle: .title1) ]
        let centAttributes : [NSAttributedString.Key : Any] = [.font : UIFont.preferredFont(forTextStyle: .callout), .baselineOffset : 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
}

extension AccountSummaryCell {
    func configure(with vm : ViewModel) {
        typeLabel.text = vm.accountType.rawValue
        nameLabel.text = vm.accountName
        balanceAmountLabel.attributedText = vm.balanceAsAttributedText
        
        switch vm.accountType {
            
        case .Banking:
            divider.backgroundColor = appColor
            balanceLabel.text = "Current Balance"
            
        case .CreditCard:
            divider.backgroundColor = .systemOrange
            balanceLabel.text = "Balance"

        case .Investment:
            divider.backgroundColor = .systemPurple
            balanceLabel.text = "Value"

        }
        
    }
}
