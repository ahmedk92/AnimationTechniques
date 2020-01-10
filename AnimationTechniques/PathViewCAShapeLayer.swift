//
//  PathViewCAShapeLayer.swift
//  AnimationTechniques
//
//  Created by Ahmed Khalaf on 1/10/20.
//  Copyright © 2020 com.ahmedkhalaf. All rights reserved.
//

import UIKit

class PathViewCAShapeLayer: UIView {
    
    func animate() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = ANIMATION_DURATION
        animation.fromValue = 0
        animation.toValue = 1
        shapeLayer.add(animation, forKey: "strokeAnimation")
    }
    
    private lazy var shapeLayer: CAShapeLayer = {
        let sl = CAShapeLayer()
        sl.fillColor = UIColor.clear.cgColor
        sl.strokeColor = UIColor.red.cgColor
        layer.addSublayer(sl)
        return sl
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let rect = layer.bounds
        shapeLayer.frame = rect
        let pathInfo = makePathInfo(rect: rect)
        shapeLayer.path = pathInfo.path
        shapeLayer.lineWidth = pathInfo.lineWidth

    }
}
