//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by admin on 10/03/2023.
//
import UIKit

class AccountSummaryCell: UITableViewCell {
    let typeLable = UILabel()
    
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
    }
    
    private func layout() {
    
        contentView.addSubview(typeLable)
        
        NSLayoutConstraint.activate([
            typeLable.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLable.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1)
        ])
    }
}
