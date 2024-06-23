//
//  LocationManager.swift
//  away
//
//  Created by Дмитрий Пантелеев on 15.06.2024.
//

import Foundation
import CoreLocation

protocol Locatable {
    var currentCoordinate: CLLocationCoordinate2D? { get }
    var delegate: LocatableDelegate? { get set }
    
    func change(mode: LocationManager.Mode)
}

protocol LocatableDelegate: AnyObject {
    func manager(didUpdate location: CLLocation)
}

final class LocationManager: NSObject, Locatable {
    
    // MARK: Private fields
    private var manager = CLLocationManager()
    private var mode: Mode = .waiting
    
    // MARK: Public fields
    private(set) var currentCoordinate: CLLocationCoordinate2D?
    weak var delegate: LocatableDelegate?
    
    // MARK: Init
    override init() {
        super.init()
        setupManager()
        requestAuth()
    }
}

// MARK: - Manager settings
private extension LocationManager {
    func setupManager() {
        manager.delegate = self
        
        manager.distanceFilter = mode.distanceFilter
        manager.desiredAccuracy = mode.accuracy
        
        manager.activityType = mode.activity
        
        manager.allowsBackgroundLocationUpdates = mode.allowsBackgroundUpdates
        manager.showsBackgroundLocationIndicator = mode.showsBackgroundIndicator
        
        manager.startUpdatingLocation()
    }
    
    func requestAuth() {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorized:
            break
        case .authorizedWhenInUse:
            manager.requestAlwaysAuthorization()
        case .denied, .restricted, .notDetermined:
            manager.requestWhenInUseAuthorization()
        @unknown default:
            break
        }
    }
}

// MARK: - Public methods
extension LocationManager {
    func change(mode: Mode) {
        self.mode = mode
        setupManager()
    }
}

// MARK: - Delegate Conformance
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("HUETA | \(locations.first?.coordinate)")
        let sortedLocations = locations.sorted { $0.horizontalAccuracy < $1.horizontalAccuracy }
        guard let bestLocation = sortedLocations.first else { return }
        currentCoordinate = bestLocation.coordinate
        delegate?.manager(didUpdate: bestLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("LOCATION MANAGER FAILS") // TODO: - logger
    }
}

extension LocationManager {
    enum Mode {
        case waiting
        case running
        
        var accuracy: CLLocationAccuracy {
            self == .running ? kCLLocationAccuracyBest : kCLLocationAccuracyHundredMeters
        }
        
        var distanceFilter: CLLocationDistance {
            self == .running ? .zero : 10
        }
        
        var activity: CLActivityType {
            self == .running ? .fitness : .otherNavigation
        }
        
        var showsBackgroundIndicator: Bool {
            self == .running
        }
        
        var allowsBackgroundUpdates: Bool {
            self == .running
        }
    }
}
