//
//  CurrencyFormatter.swift
//  Bankey
//
//  Created by admin on 13/03/2023.
//

import Foundation
import UIKit

struct CurrencyFormatter {
    
    func makeAttributedCurrency(_ amount: Decimal) -> NSMutableAttributedString {
        let tuple = breakInToDollarsAndCents(amount)
        return makeFormattedBalance(dollar: tuple.0, cent: tuple.1)
    }
    
    func breakInToDollarsAndCents(_ amount: Decimal) -> (String,String) {
        let tuple = modf(amount.doubleValue)
        let dollars = convertDollars(tuple.0)
        let cents = convertCents(tuple.1)
        return (dollars, cents)
    }
    
    private func convertDollars(_ dollarPart: Double) -> String {
        let dollarsWithDecimal = dollarsFormatted(dollarPart) // "$929,466.00"
        let formatter = NumberFormatter()
        let decimalSeparator = formatter.decimalSeparator! // "."
        let dollarComponents = dollarsWithDecimal.components(separatedBy: decimalSeparator) // "$929,466" "00"
        var dollars = dollarComponents.first! // "$929,466"
        dollars.removeFirst() // "929,466"

        return dollars
    }
    
    // Convert 0.23 > 23
    private func convertCents(_ centPart: Double) -> String {
        let cents: String
        if centPart == 0 {
            cents = "00"
        } else {
            cents = String(format: "%.0f", centPart * 100)
        }
        return cents
    }
    
    // Converts 929466 > $929,466.00
    func dollarsFormatted(_ dollars: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        
        if let result = formatter.string(from: dollars as NSNumber) {
            return result
        }
        return ""
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
