//
//  Date+Utility.swift
//  Bankey
//
//  Created by Irfan Khan on 22/01/24.
//

import Foundation

extension Date {
    static var bankeyDateFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "MDT")
        
        return formatter
    }
    
    var monthDayYearString : String {
        let dateFormatter = Date.bankeyDateFormatter
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}
