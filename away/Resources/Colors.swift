//
//  Colors.swift
//  away
//
//  Created by Дмитрий Пантелеев on 24.06.2024.
//

import UIKit

extension UIColor {
    convenience init(name: ColorPalette) {
        self.init(named: name.rawValue)!
    }
}

enum ColorPalette: String {
    case primary
    case secondary
}

extension UIColor {
    static let primary = UIColor(name: .primary)
    static let secondary = UIColor(name: .secondary)
}
