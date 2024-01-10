//
//  DecimalUtility.swift
//  Bankey
//
//  Created by Irfan Khan on 10/01/24.
//

import UIKit

extension Decimal {
    var doubleValue : Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
