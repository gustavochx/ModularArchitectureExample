//
//  String+Util.swift
//  Core
//
//  Created by Gustavo Henrique Frota Soares on 08/04/21.
//

import Foundation


public extension String {
    /// Convert a String to a Date.
    /// - Parameter format: The date format of the string.
    func toDate(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: self)
    }
    
}
