//
//  ColorCodesViewController.swift
//  Color Picker
//
//  Created by Mehrdad on 2020-06-23.
//  Copyright © 2020 Mehrdad. All rights reserved.
//

import UIKit

class ColorCodesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lowerBoundRedInt.text = "0.50"
        higherBoundRedInt.text = "128"
        
        lowerBoundGreenInt.text = "0.50"
        higherBoundGreenInt.text = "128"
        
        lowerBoundBlueInt.text = "0.50"
        higherBoundBlueInt.text = "128"
        
        view.backgroundColor = UIColor(red: 0.50, green: 0.50, blue: 0.50, alpha: 1.0)
        
        hexValueLabel.text = "#" + String(format: "%02X", Int(128)) + String(format: "%02X", Int(128)) + String(format: "%02X", Int(128))

        // Do any additional setup after loading the view.
    }
    
    // MARK: Outlets
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var lowerBoundRedInt: UILabel!
    @IBOutlet weak var higherBoundRedInt: UILabel!
    
    @IBOutlet weak var lowerBoundGreenInt: UILabel!
    @IBOutlet weak var higherBoundGreenInt: UILabel!
    
    @IBOutlet weak var lowerBoundBlueInt: UILabel!
    @IBOutlet weak var higherBoundBlueInt: UILabel!
    
    @IBOutlet weak var hexValueLabel: UILabel!
    
    
    @IBAction func changeBackgroundColor(sender: UISlider) {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        let redValue = Int(red >= 1.0 ? 255: red * 256.0)
        lowerBoundRedInt.text = String(format: "%.2f", red)
        higherBoundRedInt.text = "\(redValue)"
        
        let greenValue = Int(green >= 1.0 ? 255: green * 256.0)
        lowerBoundGreenInt.text = String(format: "%.2f", green)
        higherBoundGreenInt.text = "\(greenValue)"
        
        let blueValue = Int(blue >= 1.0 ? 255: blue * 256.0)
        lowerBoundBlueInt.text = String(format: "%.2f", blue)
        higherBoundBlueInt.text = "\(blueValue)"
        
        let hexValue = String(format: "%02X", Int(redValue)) + String(format: "%02X", Int(greenValue)) + String(format: "%02X", blueValue)
        hexValueLabel.text = "#\(hexValue)"
        
    }

}



public extension UIColor {
    var redValue: CGFloat {
        return CIColor(color: self).red
    }
    
    var greenValue: CGFloat {
        return CIColor(color: self).green
    }
    
    var blueValue: CGFloat {
        return CIColor(color: self).blue
    }
    
    var alphaValue: CGFloat {
        return CIColor(color: self).alpha
    }
}
