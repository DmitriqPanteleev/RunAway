//
//  GeneralMenuViewController.swift
//  away
//
//  Created by Дмитрий Пантелеев on 23.06.2024.
//

import UIKit

final class GeneralMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }

    private func setupButtons() {
        let buttonWidth = (view.bounds.width - 48) / 2
        
        let runButton = GeneralMenuButtonView(frame: .init(origin: .init(x: 16, y: .zero), size: .init(width: buttonWidth, height: 54)))
        runButton.configure(title: "Бежать")
        runButton.addTarget(self, action: #selector(runButtonTapped), for: .touchUpInside)
        view.addSubview(runButton)
        
        let profileButton = GeneralMenuButtonView(frame: .init(origin: .init(x: buttonWidth + 32, y: .zero), size: .init(width: buttonWidth, height: 54)))
        profileButton.configure(title: "Профиль")
        profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        view.addSubview(profileButton)
    }
}

private extension GeneralMenuViewController {
    @objc func runButtonTapped(sender: UIButton!) {
        print("runButtonTapped")
    }
    
    @objc func profileButtonTapped(sender: UIButton!) {
        print("profileButtonTapped")
    }
}
