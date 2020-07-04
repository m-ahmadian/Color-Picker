//
//  ColorSwatchesViewController.swift
//  Color Picker
//
//  Created by Mehrdad on 2020-06-28.
//  Copyright © 2020 Mehrdad. All rights reserved.
//

import UIKit
import CoreGraphics


class ColorSwatchesViewController: UIViewController {

    @IBOutlet weak var hueView: UIView!
    
    // Properties
    let mainColorsArray = [ColorArrays.rose.cgColor, UIColor.magenta.cgColor, ColorArrays.violet.cgColor, UIColor.blue.cgColor, ColorArrays.azure.cgColor, UIColor.cyan.cgColor, ColorArrays.springGreen.cgColor, UIColor.green.cgColor, ColorArrays.chartreuseGreen.cgColor, UIColor.yellow.cgColor, UIColor.orange.cgColor, UIColor.red.cgColor]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        createGradientView()
    }

    
    func createGradientView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.hueView.bounds
        gradientLayer.colors = mainColorsArray
        
        self.hueView.layer.addSublayer(gradientLayer)
    }
    
}



struct ColorArrays {
    static let chartreuseGreen = UIColor(red: 0.5, green: 1.0, blue: 0.0, alpha: 1.0)
    static let springGreen = UIColor(red: 0.0, green: 1.0, blue: 0.5, alpha: 1.0)
    static let azure = UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0)
    static let violet = UIColor(red: 0.93, green: 0.51, blue: 0.93, alpha: 1.0)
    static let rose = UIColor(red: 1.0, green: 0.0, blue: 0.5, alpha: 1.0)
    
//    let hueMainColors = [rose.cgColor, UIColor.magenta.cgColor]
}
