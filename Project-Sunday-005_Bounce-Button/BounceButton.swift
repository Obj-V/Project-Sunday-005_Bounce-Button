//
//  BounceButton.swift
//  Project-Sunday-005_Bounce-Button
//
//  Created by Virata Yindeeyoungyeon on 8/6/17.
//  Copyright © 2017 ObjV. All rights reserved.
//

import UIKit

@IBDesignable
class BounceButton: UIButton {
    
    //MARK: init methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //MARK: public vars
    @IBInspectable var btnColor:UIColor = UIColor.clear {
        didSet {
            innerBtn.fillColor = btnColor.cgColor
        }
    }
    
    @IBInspectable var shrinkedScale:CGFloat = 1.0
    
    override var isHighlighted: Bool {
        didSet(oldHighlightState) {
            guard oldHighlightState != isHighlighted else {return};
            animateButtonHighlight()
        }
    }
    
    //MARK: private var
    private var innerBtn:CAShapeLayer!
    
    //MARK: private methods
    private func setup() {
        backgroundColor = UIColor.clear
        setTitleColor(UIColor.clear, for: .highlighted)
        
        innerBtn = CAShapeLayer()
        innerBtn.frame = bounds
        innerBtn.path = UIBezierPath(rect: bounds).cgPath
        innerBtn.fillColor = btnColor.cgColor
        layer.addSublayer(innerBtn)
    }
    
    private func animateButtonHighlight() {
        guard shrinkedScale != 1.0 else {return}
        
        let animationDuration = 0.2
        
        let initialScaleValue:CGFloat = 1.0
        let initialValueX = bounds.width
        let initialValueY = bounds.height
        
        let shrinkedValueX = initialValueX * shrinkedScale
        let shrinkedValueY = initialValueY * shrinkedScale
        let finalShrinkedValue = shrinkedValueX > shrinkedValueY ? shrinkedValueY : shrinkedValueX
        
        let shrinkedScaleX = 1 - (finalShrinkedValue/initialValueX)
        let shrinkedScaleY = 1 - (finalShrinkedValue/initialValueY)
        
        let animateBtnX = CABasicAnimation(keyPath: "transform.scale.x")
        animateBtnX.duration = animationDuration
        animateBtnX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        let animateBtnY = CABasicAnimation(keyPath: "transform.scale.y")
        animateBtnY.duration = animationDuration
        animateBtnY.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        if isHighlighted {
            animateBtnX.fromValue = initialScaleValue
            animateBtnX.toValue = shrinkedScaleX
            animateBtnX.isRemovedOnCompletion = false
            animateBtnX.fillMode = kCAFillModeForwards
            innerBtn.add(animateBtnX, forKey: "scale.x")
            
            animateBtnY.fromValue = initialScaleValue
            animateBtnY.toValue = shrinkedScaleY
            animateBtnY.isRemovedOnCompletion = false
            animateBtnY.fillMode = kCAFillModeForwards
            innerBtn.add(animateBtnY, forKey: "scale.y")
        } else {
            animateBtnX.fromValue = shrinkedScaleX
            animateBtnX.toValue = initialScaleValue
            innerBtn.add(animateBtnX, forKey: "scale.x")
            
            animateBtnY.fromValue = shrinkedScaleY
            animateBtnY.toValue = initialScaleValue
            innerBtn.add(animateBtnY, forKey: "scale.y")
        }
    }
    
}
