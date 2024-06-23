//
//  UserAnnotation.swift
//  away
//
//  Created by Дмитрий Пантелеев on 16.06.2024.
//

import Foundation
import MapKit

final class UserAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
