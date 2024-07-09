//
//  DateFormatters.swift
//  away
//
//  Created by Дмитрий Пантелеев on 09.07.2024.
//

import Foundation

struct DateFormatters {
    
    private init() {}
    
    static var shortDateTime: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.timeZone = .current
        return formatter
    }
}
