//
//  Decimal+Utils.swift
//  Bankey
//
//  Created by admin on 13/03/2023.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
