//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by admin on 10/03/2023.
//
import UIKit

class AccountSummaryCell: UITableViewCell {
    let typeLable = UILabel()
    let underLine = UIView()
    let nameLabel = UILabel()
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    let chevronImageView = UIImageView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 100
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
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
        typeLable.translatesAutoresizingMaskIntoConstraints = false
        typeLable.adjustsFontForContentSizeCategory = true
        typeLable.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLable.text = "Acount type"
        
        underLine.translatesAutoresizingMaskIntoConstraints = false
        underLine.backgroundColor = appColor
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.text = "No-Free All-In Chequing"
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.adjustsFontForContentSizeCategory = true
        balanceLabel.text = "Current balance"
        balanceLabel.textAlignment = .right
        
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.textAlignment = .center
//        balanceAmountLabel.text = "$929,466.63"
        balanceLabel.attributedText = makeFormattedBalance(dollar: "929,466", cent: "63")
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        let chevronImage = UIImage(systemName: "chevron.right")!.withTintColor(appColor, renderingMode: .alwaysOriginal)
        chevronImageView.image = chevronImage
    }
    
    private func layout() {
    
        contentView.addSubview(typeLable)
        contentView.addSubview(underLine)
        contentView.addSubview(nameLabel)
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        contentView.addSubview(balanceStackView)
        contentView.addSubview(chevronImageView)
        
        NSLayoutConstraint.activate([
            typeLable.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLable.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            underLine.topAnchor.constraint(equalToSystemSpacingBelow: typeLable.bottomAnchor, multiplier: 1),
            underLine.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            underLine.widthAnchor.constraint(equalToConstant: 60),
            underLine.heightAnchor.constraint(equalToConstant: 4),
            
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underLine.bottomAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: underLine.bottomAnchor, multiplier: 1),
            balanceStackView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 4),
            
            chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: underLine.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1),
            
        ])
    }
    
    private func makeFormattedBalance(dollar: String, cent: String) -> NSMutableAttributedString {
        
        let dollarSignAtrributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAtrributes)
        let dollarString = NSMutableAttributedString(string: dollar, attributes: dollarAttributes)
        let centString = NSMutableAttributedString(string: cent, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
        
    }
}
