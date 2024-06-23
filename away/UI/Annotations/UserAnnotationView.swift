//
//  UserAnnotationView.swift
//  away
//
//  Created by Дмитрий Пантелеев on 15.06.2024.
//

import Foundation
import MapKit

final class UserAnnotationView: MKAnnotationView {
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        image = AnnotationImageBuilder.buildForUser()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct AnnotationImageBuilder {
    static func buildForUser() -> UIImage {
        let bounds = CGRect(origin: .zero, size: CGSize(width: 24, height: 24))
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        let image = renderer.image { context in
            UIColor.black.setFill()
            UIColor.white.setStroke()
            
            context.cgContext.fillEllipse(in: bounds)
            context.cgContext.strokeEllipse(in: bounds)
        }
        
        return image
    }
}
