//
//  ViewController.swift
//  Project-Sunday-005_Bounce-Button
//
//  Created by Virata Yindeeyoungyeon on 8/6/17.
//  Copyright © 2017 ObjV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bounceButton = BounceButton.init(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        bounceButton.center = self.view.center
        bounceButton.setTitle("Click Here", for: .normal)
        bounceButton.setTitleColor(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), for: .normal)
        bounceButton.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        bounceButton.layer.borderWidth = 4
        
        bounceButton.btnColor = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)
        bounceButton.shrinkedScale = 0.3
        self.view.addSubview(bounceButton)
    }

}

