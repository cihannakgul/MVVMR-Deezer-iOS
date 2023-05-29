//
//  String+Extensions.swift
//  UIComponents
//
//  Created by cihan on 22.05.23.
//

import Foundation


public extension String {
    var convertUrl: URL? {
        let string = self.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        if let string = string {
            return URL(string: string)
        } else {
            return nil
        }
    }
}
