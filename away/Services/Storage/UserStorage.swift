//
//  UserStorage.swift
//  away
//
//  Created by Дмитрий Пантелеев on 09.07.2024.
//

import Foundation


struct UserStorage {
    
    private let defaults = UserDefaults.standard
    
    static let shared = UserStorage()
    
    private init() {}
    
    // MARK: Storable variables
    var accentColor: String? {
        get {
            defaults.string(forKey: Keys.accentColor.rawValue)
        }
        set {
            defaults.setValue(newValue, forKey: Keys.accentColor.rawValue)
        }
    }
}

extension UserStorage {
    enum Keys: String {
        case accentColor
    }
}
