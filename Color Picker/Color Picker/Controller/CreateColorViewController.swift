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
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var selectedColorView: UIView!
    @IBOutlet weak var hexValueLabel: UILabel!
    @IBOutlet weak var RGBValueLabel: UILabel!
    @IBOutlet weak var circleViewY: NSLayoutConstraint!
    @IBOutlet weak var activityIndicatorX: NSLayoutConstraint!
    @IBOutlet weak var activityIndicatorY: NSLayoutConstraint!
    
    
    // MARK: Properties
    var startLocation: CGFloat = 0.0
    var dragOffset: CGSize = .zero
    
    var chosenColor: UIColor?
    
    var currentColor: UIColor? {
        return UIColor.init(hue: CGFloat(1.0 - (normalizeGesture() / self.hueView.bounds.height)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
    
    func normalizeGesture() -> CGFloat {
        let offset: CGFloat = startLocation + dragOffset.height
        let maxY: CGFloat = max(0.0, offset)
        let minY: CGFloat = min(maxY, self.hueView.bounds.height)
        
        return minY
    }

    
    
    
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
        
        
        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(handleDrag(_:)))
//        self.hueView.addGestureRecognizer(dragGesture)
        circleView.addGestureRecognizer(dragGesture)
        dragGesture.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.hueView.addGestureRecognizer(tapGesture)
        tapGesture.delegate = self
        
        
        // Circle View
        circleView.layer.cornerRadius = circleView.frame.size.width / 2
        circleView.clipsToBounds = true

        circleView.layer.borderWidth = 1.0
        circleView.layer.borderColor = UIColor.black.cgColor
        circleView.backgroundColor = currentColor
        
        hueView.addSubview(circleView)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createHueGradientView()
        createSaturationBrightnessView(redSaturations)
        circleView.superview?.bringSubviewToFront(circleView)

        saturationBrightnessView.addSubview(activityIndicator)
        activityIndicator.superview?.bringSubviewToFront(activityIndicator)
        
        makeColorForView()
        
        saturationBrightnessView.addSubview(activityIndicator)
        activityIndicator.center = CGPoint(x: saturationBrightnessView.bounds.origin.x + saturationBrightnessView.bounds.size.width / 2, y: saturationBrightnessView.bounds.origin.y + saturationBrightnessView.bounds.size.height / 2)
        
        circleView.center = CGPoint(x: hueView.bounds.origin.x + hueView.frame.size.width / 2, y: hueView.bounds.origin.y + hueView.bounds.size.height - circleView.frame.size.height / 2)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
    
    
    func createSaturationBrightnessView(_ colors: [CGColor]) {
        
        let whiteLayer = CALayer()
        whiteLayer.backgroundColor = UIColor.white.cgColor
        
        let gradientSaturation = CAGradientLayer()
        gradientSaturation.frame = self.saturationBrightnessView.bounds
        gradientSaturation.colors = colors
        gradientSaturation.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientSaturation.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        let gradientBrightness = CAGradientLayer()
        gradientBrightness.frame = self.saturationBrightnessView.bounds
        gradientBrightness.colors = blackBrightness
        gradientBrightness.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientBrightness.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        self.saturationBrightnessView.layer.addSublayer(whiteLayer)
        whiteLayer.addSublayer(gradientSaturation)
        gradientSaturation.addSublayer(gradientBrightness)
        
        activityIndicator.superview?.bringSubviewToFront(activityIndicator)
        self.saturationBrightnessView.reloadInputViews()
    }
    
    
    func makeColorForView() {
        var colorArray: [UIColor] = []
        
        for i in stride(from: 0.0 as CGFloat, to: 359.0 as CGFloat, by: 1.0) {
            let ourColor = UIColor(hue: CGFloat(1.0 - (normalizeGesture() / self.hueView.bounds.height)), saturation: CGFloat(i) / 359.0, brightness: 1.0, alpha: 1.0)
            colorArray.append(ourColor)
        }
        let theColors: [CGColor] = colorArray.map({
            $0.cgColor
        })
        createSaturationBrightnessView(theColors)
    }
    
    
    func createImageFromSaturationBrightnessView() -> UIImage {
        UIGraphicsBeginImageContext(saturationBrightnessView.bounds.size)
        saturationBrightnessView.drawHierarchy(in: saturationBrightnessView.bounds, afterScreenUpdates: true)
        saturationBrightnessView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    
    func displaydColorInfo(color: UIColor?) {

        if let color = color {
            let redValue = Int(color.redValue >= 1.0 ? 255: color.redValue * 256.0)

            let greenValue = Int(color.greenValue >= 1.0 ? 255: color.greenValue * 256.0)

            let blueValue = Int(color.blueValue >= 1.0 ? 255: color.blueValue * 256.0)

            let hexValue = String(format: "%02X", Int(redValue)) + String(format: "%02X", Int(greenValue)) + String(format: "%02X", blueValue)
            hexValueLabel.text = "#\(hexValue)"
            RGBValueLabel.text = "\(redValue)  \(greenValue)  \(blueValue)"
        } else {
            hexValueLabel.text = "#FFFFFF"
            RGBValueLabel.text = "00  00  00"
        }
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
                    
                    activityIndicatorX.constant = point.x - (activityIndicator.frame.size.width / 2)
                    
                    activityIndicatorY.constant = saturationBrightnessView.bounds.size.height - (point.y + (activityIndicator.frame.size.height / 2))
                    
                    gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
                    
                    let image = createImageFromSaturationBrightnessView()
                    
                    
                    let selectedColor = image.cgImage?.color(at: point)
                    selectedColorView.backgroundColor = selectedColor

                    self.displaydColorInfo(color: selectedColor)
                    
                    gestureRecognizer.setTranslation(CGPoint.zero, in: gestureRecognizer.view!.superview)
                }
                
            }
            
        }
        
    }
    
    
    @objc func handleDrag(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard gestureRecognizer.view != nil else {
            return
        }
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let point = gestureRecognizer.location(in: gestureRecognizer.view?.superview)
            startLocation = point.y
            
            let superBounds = CGRect(x: hueView.bounds.origin.x, y: hueView.bounds.origin.y, width: hueView.bounds.size.width, height: hueView.bounds.size.height)
            
            if (superBounds.contains(point)) {
                let translation = gestureRecognizer.translation(in: gestureRecognizer.view?.superview)
                dragOffset = CGSize(width: translation.x, height: translation.y)
                
                circleViewY.constant -= translation.y
                
                gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x, y: gestureRecognizer.view!.center.y + translation.y)
                
                circleView.backgroundColor = currentColor
                makeColorForView()
                
                gestureRecognizer.setTranslation(CGPoint.zero, in: gestureRecognizer.view?.superview)
            }
        }
        
        else if gestureRecognizer.state == .cancelled {
            self.startLocation = 0.0
            self.dragOffset = .zero
            gestureRecognizer.setTranslation(CGPoint.zero, in: gestureRecognizer.view?.superview)
        }
    }
    
    
    
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        guard gestureRecognizer.view != nil else {
            return
        }
        
        if gestureRecognizer.state == .ended {
            gestureRecognizer.numberOfTapsRequired = 1
            let point = gestureRecognizer.location(in: gestureRecognizer.view)
            startLocation = point.y
            
            let superbounds = CGRect(x: hueView.bounds.origin.x, y: hueView.bounds.origin.y, width: hueView.bounds.size.width, height: hueView.bounds.size.height)
            
            if (superbounds.contains(point)) {
                circleViewY.constant = hueView.bounds.size.height - (point.y + (circleView.frame.size.height / 2))
                
                circleView.center = CGPoint(x: circleView.center.x, y: point.y)
                
                circleView.backgroundColor = currentColor
                makeColorForView()
            }
        }
        
    }
    
    
}




public extension CGImage {
    
    func color(at pixel: CGPoint) -> UIColor? {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bytesPerPixel = 4
        let bitsPerComponent = 8
        let bytesPerRow = width * bytesPerPixel
        let bitmapInfo: UInt32 = CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue
        
        let x = pixel.x
        let y = pixel.y
        
        guard let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo), let ptr = context.data?.assumingMemoryBound(to: UInt8.self) else {
            return nil
        }
        
        context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        
        let pixelInfo = bytesPerRow * Int(y) + bytesPerPixel * Int(x)
        
//        let i = bytesPerRow * Int(at.y) + bytesPerPixel * Int(at.x)
        
        let red = CGFloat(ptr[pixelInfo]) / 255.0
        let green = CGFloat(ptr[(pixelInfo + 1)]) / 255.0
        let blue = CGFloat(ptr[(pixelInfo + 2)]) / 255.0
        let alpha = CGFloat(ptr[pixelInfo + 3]) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
