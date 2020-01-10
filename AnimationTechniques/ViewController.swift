//
//  ViewController.swift
//  AnimationTechniques
//
//  Created by Ahmed Khalaf on 1/10/20.
//  Copyright © 2020 com.ahmedkhalaf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var pathViewDrawRect: PathViewDrawRect!
    @IBOutlet private weak var pathViewCAShapeLayer: PathViewCAShapeLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pathViewDrawRect.animate()
        pathViewCAShapeLayer.animate()
    }


}

