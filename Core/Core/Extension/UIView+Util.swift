//
//  UIView+Util.swift
//  Core
//
//  Created by Gustavo Henrique Frota Soares on 16/04/21.
//

import UIKit


public protocol LayoutGuiding {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: LayoutGuiding {}
extension UILayoutGuide: LayoutGuiding {}

public extension UIView {
    var compatibleSafeAreaLayoutGuide: LayoutGuiding {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide
        } else {
            return self
        }
    }
}
