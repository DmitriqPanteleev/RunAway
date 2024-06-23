//
//  GeneralMenuButtonView.swift
//  away
//
//  Created by Дмитрий Пантелеев on 23.06.2024.
//

import UIKit

class GeneralMenuButtonView: UIButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.15) { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
        
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.15) { [weak self] in
            self?.transform = CGAffineTransform.identity
        }
        
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.15) { [weak self] in
            self?.transform = CGAffineTransform.identity
        }
        
        super.touchesCancelled(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.15) { [weak self] in
            self?.transform = CGAffineTransform.identity
        }
        
        super.touchesCancelled(touches, with: event)
    }
        
    func configure(title: String) {
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        
        backgroundColor = .white
        
        layer.cornerRadius = 20
    }
}
