//
//  GeneralViewController.swift
//  away
//
//  Created by Дмитрий Пантелеев on 15.06.2024.
//

import UIKit
import CoreLocation

final class GeneralMapViewController: UIViewController {
    // MARK: Views
    lazy var mapView: GeneralMapRepresentable & GeneralMapControlable = GeneralMapView()
    
    // MARK: Dependencies
    private var locationManager: Locatable = LocationManager()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupViews()
        setupObervers()
    }
}

// MARK: - UI
private extension GeneralMapViewController {
    func setupViews() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        mapView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mapView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mapView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        mapView.configure()
    }
    
    func setupDelegates() {
        locationManager.delegate = self
    }
    
    func setupObervers() {
        when(.appWillEnterForeground) { [weak self] _ in
            guard let coordinate = self?.locationManager.currentCoordinate else { return }
            self?.mapView.navigate(to: coordinate, animated: true)
        }
    }
}

// MARK: - LocationManagerDelegate Conformance
extension GeneralMapViewController: LocatableDelegate {
    func manager(didUpdate location: CLLocation) {
        print("didUpdate \(location)")
        mapView.navigate(to: location.coordinate, animated: true)
    }
}
