//
//  Locatable.swift
//  away
//
//  Created by Дмитрий Пантелеев on 10.07.2024.
//

import Foundation
import CoreLocation

protocol Locatable {
    var currentCoordinate: CLLocationCoordinate2D? { get }
    var delegate: LocatableDelegate? { get set }
    
    func change(mode: LocationManager.Mode)
}
