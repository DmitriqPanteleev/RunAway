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
    
    private static let imageSize: CGFloat = 32
    private static let strokeSize: CGFloat = 24
    
    static func buildForUser() -> UIImage {
        let fillBounds = CGRect(origin: .init(x: strokeSize / 4, y: strokeSize / 4),
                                size: CGSize(width: strokeSize - 4, height: strokeSize - 4))
        
        let strokeBounds = CGRect(origin: .init(x: strokeSize / 6, y: strokeSize / 6),
                                  size: CGSize(width: strokeSize, height: strokeSize))
        
        let renderer = UIGraphicsImageRenderer(bounds: CGRect(origin: .zero,
                                                              size: CGSize(width: imageSize, height: imageSize)))
        
        let image = renderer.image { context in
            
            if let gradient = buildGradient() {
                context.cgContext.drawRadialGradient(gradient,
                                                     startCenter: .init(x: imageSize / 2, y: imageSize / 2),
                                                     startRadius: .zero,
                                                     endCenter: .init(x: imageSize / 2, y: imageSize / 2),
                                                     endRadius: imageSize / 2,
                                                     options: [])
            }
            
            UIColor.white.setFill() // TODO: зависимость от темы
            context.cgContext.fillEllipse(in: strokeBounds)
            
            AccentColorManager.value.setFill()
            context.cgContext.fillEllipse(in: fillBounds)
        }
        
        return image
    }
    
    private static func buildGradient() -> CGGradient? {
        let startColor = UIColor.white.withAlphaComponent(0.8)
        let endColor = UIColor.white.withAlphaComponent(0.0)
        
        let colors = [startColor.cgColor, endColor.cgColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: locations)
        return gradient
    }
}
