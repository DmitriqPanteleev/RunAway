//
//  GeneralViewController.swift
//  away
//
//  Created by Дмитрий Пантелеев on 15.06.2024.
//

import UIKit
import CoreLocation

final class GeneralViewController: UIViewController {
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
    }
}

// MARK: - Setups
private extension GeneralViewController {
    func setupChildControllers() {
        let mapController = GeneralMapViewController()
        setupChildViewController(mapController) {
            mapController.view.translatesAutoresizingMaskIntoConstraints = false
            
            mapController.view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            mapController.view.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            mapController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            mapController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
    }
}
