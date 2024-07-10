//
//  AccentColorManager.swift
//  away
//
//  Created by Дмитрий Пантелеев on 09.07.2024.
//

import UIKit

final class AccentColorManager {
    
    // MARK: External dependencies
    static var value: UIColor {
        if let cachedName = UserStorage.shared.accentColor, let colorName = ColorPalette(rawValue: cachedName) {
            return UIColor(name: colorName)
        } else {
            return UIColor.accentFirst
        }
    }
    
    private init() {}
}
