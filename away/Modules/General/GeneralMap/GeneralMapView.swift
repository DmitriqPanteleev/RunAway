//
//  MapView.swift
//  away
//
//  Created by Дмитрий Пантелеев on 15.06.2024.
//

import Foundation
import MapKit

protocol GeneralMapRepresentable: UIView {
    var delegate: MKMapViewDelegate? { get set }
    
    func configure()
    func set(type: MKMapType)
    func set(mode: MKUserTrackingMode, animated: Bool)
}

protocol GeneralMapControlable {
    func navigate(to coordinate: CLLocationCoordinate2D, animated: Bool)
}

final class GeneralMapView: MKMapView {
    private var annotation: UserAnnotation?
    
    private func setRegion(with coordinate: CLLocationCoordinate2D) {
        let center = coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: center, span: span)
        
        setRegion(region, animated: true)
    }
}

// MARK: - Setters
extension GeneralMapView: GeneralMapRepresentable {
    func configure() {
        mapType = .standard
        
        showsScale = false
        showsCompass = false
        showsTraffic = false
        showsUserLocation = false
        showsLargeContentViewer = false
    }
    
    func set(type: MKMapType) {
        mapType = type
    }
    
    func set(mode: MKUserTrackingMode, animated: Bool = true) {
        setUserTrackingMode(mode, animated: animated)
    }
    
    func setDelegate(_ delegate: MKMapViewDelegate) {
        self.delegate = delegate
    }
}

// MARK: - Map controls
extension GeneralMapView: GeneralMapControlable {
    func navigate(to coordinate: CLLocationCoordinate2D, animated: Bool) {
        defer { setCenter(coordinate, animated: animated) }
        
        if let _annotation = annotation {
            _annotation.coordinate = coordinate
        } else {
            annotation = UserAnnotation(coordinate: coordinate)
            addAnnotation(annotation!)
        }
        
        setRegion(with: coordinate)
    }
}


