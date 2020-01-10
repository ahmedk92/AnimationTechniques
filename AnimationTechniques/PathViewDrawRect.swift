//
//  PathViewDrawRect.swift
//  AnimationTechniques
//
//  Created by Ahmed Khalaf on 1/10/20.
//  Copyright © 2020 com.ahmedkhalaf. All rights reserved.
//

import UIKit

class PathViewDrawRect: UIView {
    
    var endAngle: CGFloat = 0
    
    func animate() {
        displayLink.add(to: .main, forMode: .default)
    }
    
    @objc private func update() {
        guard endAngle < TARGET_END_ANGLE else {
            displayLink.invalidate()
            return
        }
        
        let frameDuration = displayLink.targetTimestamp - displayLink.timestamp
        let frameDurationShareOfTotalAnimationTime = frameDuration / ANIMATION_DURATION
        let amountOfRadiansToIncrement = CGFloat(frameDurationShareOfTotalAnimationTime) * TARGET_END_ANGLE
        
        endAngle += amountOfRadiansToIncrement
        setNeedsDisplay()
    }
    
    private lazy var displayLink: CADisplayLink = {
        let dl = CADisplayLink(target: self, selector: #selector(update))
        return dl
    }()
    
    override func draw(_ rect: CGRect) {
                
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setFillColor(UIColor.clear.cgColor)
        context.fill(rect)
        
        let pathInfo = makePathInfo(rect: rect, endAngle: endAngle)
        
        context.setLineWidth(pathInfo.lineWidth)
        context.addPath(pathInfo.path)
        context.setStrokeColor(UIColor.black.cgColor)
        context.strokePath()
        context.fillPath()

    }
}
