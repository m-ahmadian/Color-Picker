//
//  CreateColorViewController.swift
//  Color Picker
//
//  Created by Mehrdad on 2020-06-26.
//  Copyright © 2020 Mehrdad. All rights reserved.
//

import UIKit
import CoreGraphics


class CreateColorViewController: UIViewController {
    
    
    // MARK: Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var hueView: UIView!
    @IBOutlet weak var saturationBrightnessView: UIView!
    
    
    // MARK: Properties
  
    var hueColors: [CGColor] = {
        var colorArray: [UIColor] = []
        
        for i in stride(from: 0.0 as CGFloat, to: 359.0 as CGFloat, by: 1.0) {
            let color = UIColor(hue: CGFloat(i) / 359.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
            colorArray.append(color)
        }
        let cgColors: [CGColor] = colorArray.map({
            $0.cgColor
        })
        return cgColors
    }()
    
    
    var redSaturations: [CGColor] = {
        var redArray: [UIColor] = []
        
        for i in stride(from: 0.0 as CGFloat, to: 359.0 as CGFloat, by: 1.0) {
            let redColor = UIColor(hue: 0.0, saturation: CGFloat(i) / 359.0, brightness: 1.0, alpha: 1.0)
            redArray.append(redColor)
        }
        let redColors: [CGColor] = redArray.map({
            $0.cgColor
        })
        return redColors
    }()
    
    
    var blackBrightness: [CGColor] = {
        var blackArray: [UIColor] = []
        
        for i in stride(from: 0.0 as CGFloat, to: 359.0 as CGFloat, by: 1.0) {
            let blackColor = UIColor(hue: 0.0, saturation: 0.0, brightness: 0.0, alpha: CGFloat(i) / 359.0)
            blackArray.append(blackColor)
        }
        let blackColors: [CGColor] = blackArray.map({
            $0.cgColor
        })
        return blackColors
    }()
    
    
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.activityIndicator.addGestureRecognizer(gestureRecognizer)
        gestureRecognizer.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        createHueGradientView()
        createSaturationBrightnessView()
    }
    
    
    // MARK: Helper Methods
    func createHueGradientView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.hueView.bounds
        gradientLayer.colors = hueColors
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        self.hueView.layer.addSublayer(gradientLayer)
    }
    
    
    func createSaturationBrightnessView() {
        
        let whiteLayer = CALayer()
        whiteLayer.backgroundColor = UIColor.white.cgColor
        
        let gradientSaturation = CAGradientLayer()
        gradientSaturation.frame = self.saturationBrightnessView.bounds
        gradientSaturation.colors = redSaturations
        gradientSaturation.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientSaturation.endPoint = CGPoint(x: 1.0, y: 0.5)
//        gradientSaturation.opacity = 0.5
        
        let gradientBrightness = CAGradientLayer()
        gradientBrightness.frame = self.saturationBrightnessView.bounds
        gradientBrightness.colors = blackBrightness
        gradientBrightness.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientBrightness.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        self.saturationBrightnessView.layer.addSublayer(whiteLayer)
        whiteLayer.addSublayer(gradientSaturation)
        gradientSaturation.addSublayer(gradientBrightness)
    }

}



extension CreateColorViewController: UIGestureRecognizerDelegate {
    
    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard gestureRecognizer.view != nil else {
            return
        }
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            let point = gestureRecognizer.location(in: gestureRecognizer.view!.superview)
            
            if let superview = gestureRecognizer.view!.superview {
                let restrictByPoint: CGFloat = 1.0
                let superBounds = CGRect(x: superview.bounds.origin.x + restrictByPoint, y: superview.bounds.origin.y + restrictByPoint, width: superview.bounds.size.width - 2*restrictByPoint, height: superview.bounds.size.height - 2*restrictByPoint)
                
                if (superBounds.contains(point)) {
                    let translation = gestureRecognizer.translation(in: gestureRecognizer.view!.superview)
                    
                    gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
                    
                    gestureRecognizer.setTranslation(CGPoint.zero, in: gestureRecognizer.view!.superview)
                }
                
            }
            
        }
        
    }
    
}
