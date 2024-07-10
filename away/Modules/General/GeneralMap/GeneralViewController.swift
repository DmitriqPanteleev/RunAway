//
//  GeneralViewController.swift
//  away
//
//  Created by Дмитрий Пантелеев on 15.06.2024.
//

import UIKit
import CoreLocation

final class GeneralViewController: UIViewController {
    
    // MARK: Dependencies
    private let locationManager: LocationManager
    
    // MARK: Inits
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
    }
}

// MARK: - Setups
private extension GeneralViewController {
    func setupChildControllers() {
        let mapController = GeneralMapViewController(locationManager: locationManager)
        setupChildViewController(mapController) {
            mapController.view.translatesAutoresizingMaskIntoConstraints = false
            
            mapController.view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            mapController.view.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            mapController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            mapController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        
        let menuController = GeneralMenuViewController()
        setupChildViewController(menuController) {
            menuController.view.translatesAutoresizingMaskIntoConstraints = false
            
            menuController.view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            menuController.view.heightAnchor.constraint(equalToConstant: 54).isActive = true
            menuController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            menuController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
    }
}
