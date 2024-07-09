//
//  Strings.swift
//  away
//
//  Created by Дмитрий Пантелеев on 07.07.2024.
//

import Foundation

enum Language: String {
    case ru
}

enum Strings: String {
    case run
}

extension Strings {
    func l(_ language: Language = .ru, with comment: String? = nil) -> String {
        let table = "Localizable(\(language.rawValue))"
        return NSLocalizedString(rawValue, tableName: table, comment: comment ?? .plain)
    }
}
