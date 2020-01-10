//
//  Commons.swift
//  AnimationTechniques
//
//  Created by Ahmed Khalaf on 1/10/20.
//  Copyright © 2020 com.ahmedkhalaf. All rights reserved.
//

import UIKit

let ANIMATION_DURATION: CFTimeInterval = 10
let TARGET_END_ANGLE: CGFloat = .pi * 2

func makePathInfo(rect: CGRect, endAngle: CGFloat = TARGET_END_ANGLE) -> (path: CGPath, lineWidth: CGFloat) {
    let radius = min(rect.width, rect.height) / 3
    
    let path = UIBezierPath(
        arcCenter: CGPoint(x: rect.midX, y: rect.midY),
        radius: radius,
        startAngle: 0,
        endAngle: endAngle,
        clockwise: true
    ).cgPath
    
    return (path, radius * 0.1)
}
