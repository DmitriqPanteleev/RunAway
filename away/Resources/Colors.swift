//
//  Colors.swift
//  away
//
//  Created by Дмитрий Пантелеев on 24.06.2024.
//

import UIKit

extension UIColor {
    convenience init(_ name: ColorPalette) {
        self.init(named: name.rawValue)!
    }
}

enum ColorPalette: String {
    case primary
}
