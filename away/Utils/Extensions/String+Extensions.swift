//
//  String+Extensions.swift
//  away
//
//  Created by Дмитрий Пантелеев on 07.07.2024.
//

import Foundation

// MARK: - convinience static props
extension Optional where Wrapped == String {
    var orEmpty: String {
        self ?? ""
    }
}

extension String {
    static var plain: String {
        ""
    }
}
