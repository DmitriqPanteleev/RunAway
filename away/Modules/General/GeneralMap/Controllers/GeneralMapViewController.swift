//
//  GeneralMapViewController.swift
//  away
//
//  Created by Дмитрий Пантелеев on 23.06.2024.
//

import UIKit
import MapKit
import CoreLocation

final class GeneralMapViewController: UIViewController {
    
    // MARK: Dependencies
    private var locationManager: Locatable = LocationManager()
    
    // MARK: Views
    private lazy var mapView: GeneralMapRepresentable & GeneralMapControlable = GeneralMapView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        
        setupViews()
    }
}

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
        mapView.navigate(to: location.coordinate, animated: true)
    }
}

// MARK: - MKMapViewDelegate Conformance
extension GeneralMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let userAnnotation = annotation as? UserAnnotation else { return nil }
        return UserAnnotationView(annotation: userAnnotation, reuseIdentifier: "userAnnotation")
    }
}

