//
//  CLLocationCoordinate2D+Extensions.swift
//  away
//
//  Created by Дмитрий Пантелеев on 23.06.2024.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == lhs.longitude
    }
}
