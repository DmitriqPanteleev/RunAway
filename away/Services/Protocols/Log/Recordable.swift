//
//  Recordable.swift
//  away
//
//  Created by Дмитрий Пантелеев on 09.07.2024.
//

import Foundation

protocol Recordable {
    func log(message: String)
    func log(error: Error)
}
