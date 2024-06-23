//
//  UIViewController+Extensions.swift
//  away
//
//  Created by Дмитрий Пантелеев on 23.06.2024.
//

import UIKit

extension UIViewController {
    func setupChildViewController(_ childVC: UIViewController, layoutBlock: Closure) {
        addChild(childVC)
        self.view.addSubview(childVC.view)
        layoutBlock()
        childVC.didMove(toParent: self)
    }
}
