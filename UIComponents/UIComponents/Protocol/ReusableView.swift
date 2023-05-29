//
//  ReusableView.swift
//  UIComponents
//
//  Created by cihan on 22.05.23.
//

import Foundation
import UIKit
public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
