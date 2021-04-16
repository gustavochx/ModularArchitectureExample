//
//  Color+Util.swift
//  Core
//
//  Created by Gustavo Henrique Frota Soares on 16/04/21.
//

import UIKit

public extension UIColor {

    private static var bundle: Bundle? { return Bundle(identifier: "br.com.example.Core") }

    static var primary: UIColor? {
        guard let bundle = bundle else { return nil }
        return UIColor(named: "Primary", in: bundle, compatibleWith: .current)
    }
    static var secondary: UIColor? {
        guard let bundle = bundle else { return nil }
        return UIColor(named: "Secondary", in: bundle, compatibleWith: .current)
    }
    static var tertiary: UIColor? {
        guard let bundle = bundle else { return nil }
        return UIColor(named: "Tertiary", in: bundle, compatibleWith: .current)
    }
    static var quaternary: UIColor? {
        guard let bundle = bundle else { return nil }
        return UIColor(named: "Quaternary", in: bundle, compatibleWith: .current)
    }
}
