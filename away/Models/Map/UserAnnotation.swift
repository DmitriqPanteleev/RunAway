//
//  UserAnnotation.swift
//  away
//
//  Created by Дмитрий Пантелеев on 16.06.2024.
//

import Foundation
import MapKit

final class UserAnnotation: NSObject, MKAnnotation {
    var isActive: Bool
    dynamic var coordinate: CLLocationCoordinate2D
    
    init(isActive: Bool = false, coordinate: CLLocationCoordinate2D) {
        self.isActive = isActive
        self.coordinate = coordinate
    }
}
