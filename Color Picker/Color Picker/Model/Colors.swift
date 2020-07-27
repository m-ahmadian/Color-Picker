//
//  Colors.swift
//  Color Picker
//
//  Created by Mehrdad on 2020-07-02.
//  Copyright © 2020 Mehrdad. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    static let chartreuseGreen = UIColor(red: 0.5, green: 1.0, blue: 0.0, alpha: 1.0)
    static let springGreen = UIColor(red: 0.0, green: 1.0, blue: 0.5, alpha: 1.0)
    static let azure = UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0)
    static let violet = UIColor(red: 0.93, green: 0.51, blue: 0.93, alpha: 1.0)
    static let rose = UIColor(red: 1.0, green: 0.0, blue: 0.5, alpha: 1.0)
    }

let mainColorsArray = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, Colors.chartreuseGreen.cgColor, UIColor.green.cgColor, Colors.springGreen.cgColor, UIColor.cyan.cgColor, Colors.azure.cgColor, UIColor.blue.cgColor, Colors.violet.cgColor, UIColor.magenta.cgColor, Colors.rose.cgColor]


public extension UIColor {
    
    convenience init?(hex: String) {
        let r, g, b: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: 1.0)
                    return
                }
            }
        }
        return nil
    }
    
    
    // Red Shades
    static let red1 = UIColor(hex: "#FFEBEE")!
    static let red2 = UIColor(hex: "#FFCDD2")!
    static let red3 = UIColor(hex: "#EF9A9A")!
    static let red4 = UIColor(hex: "#E57373")!
    static let red5 = UIColor(hex: "#EF5350")!
    static let red6 = UIColor(hex: "#F44336")!
    static let red7 = UIColor(hex: "#E53935")!
    static let red8 = UIColor(hex: "#D32F2F")!
    static let red9 = UIColor(hex: "#C62828")!
    static let red10 = UIColor(hex: "#B71C1C")!
    
    // Pink Shades
    static let pink1 = UIColor(hex: "#FCE4EC")!
    static let pink2 = UIColor(hex: "#F8BBD0")!
    static let pink3 = UIColor(hex: "#F48FB1")!
    static let pink4 = UIColor(hex: "#F06292")!
    static let pink5 = UIColor(hex: "#EC407A")!
    static let pink6 = UIColor(hex: "#E91E63")!
    static let pink7 = UIColor(hex: "#D81B60")!
    static let pink8 = UIColor(hex: "#C2185B")!
    static let pink9 = UIColor(hex: "#AD1457")!
    static let pink10 = UIColor(hex: "#880E4F")!
    
    // Purple Shades
    static let purple1 = UIColor(hex: "#F3E5F5")!
    static let purple2 = UIColor(hex: "#E1BEE7")!
    static let purple3 = UIColor(hex: "#CE93D8")!
    static let purple4 = UIColor(hex: "#BA68C8")!
    static let purple5 = UIColor(hex: "#AB47BC")!
    static let purple6 = UIColor(hex: "#9C27B0")!
    static let purple7 = UIColor(hex: "#8E24AA")!
    static let purple8 = UIColor(hex: "#7B1FA2")!
    static let purple9 = UIColor(hex: "#6A1B9A")!
    static let purple10 = UIColor(hex: "#4A148C")!
    
    // Deep Purple Shades
    static let deepPurple1 = UIColor(hex: "#EDE7F6")!
    static let deepPurple2 = UIColor(hex: "#D1C4E9")!
    static let deepPurple3 = UIColor(hex: "#B39DDB")!
    static let deepPurple4 = UIColor(hex: "#9575CD")!
    static let deepPurple5 = UIColor(hex: "#7E57C2")!
    static let deepPurple6 = UIColor(hex: "#673AB7")!
    static let deepPurple7 = UIColor(hex: "#5E35B1")!
    static let deepPurple8 = UIColor(hex: "#512DA8")!
    static let deepPurple9 = UIColor(hex: "#4527A0")!
    static let deepPurple10 = UIColor(hex: "#311B92")!
    
    // Indigo Shades
    static let indigo1 = UIColor(hex: "#E8EAF6")!
    static let indigo2 = UIColor(hex: "#C5CAE9")!
    static let indigo3 = UIColor(hex: "#9FA8DA")!
    static let indigo4 = UIColor(hex: "#7986CB")!
    static let indigo5 = UIColor(hex: "#5C6BC0")!
    static let indigo6 = UIColor(hex: "#3F51B5")!
    static let indigo7 = UIColor(hex: "#3949AB")!
    static let indigo8 = UIColor(hex: "#303F9F")!
    static let indigo9 = UIColor(hex: "#283593")!
    static let indigo10 = UIColor(hex: "#1A237E")!
    
    // Blue Shades
    static let blue1 = UIColor(hex: "#E3F2FD")!
    static let blue2 = UIColor(hex: "#BBDEFB")!
    static let blue3 = UIColor(hex: "#90CAF9")!
    static let blue4 = UIColor(hex: "#64B5F6")!
    static let blue5 = UIColor(hex: "#42A5F5")!
    static let blue6 = UIColor(hex: "#2196F3")!
    static let blue7 = UIColor(hex: "#1E88E5")!
    static let blue8 = UIColor(hex: "#1976D2")!
    static let blue9 = UIColor(hex: "#1565C0")!
    static let blue10 = UIColor(hex: "#0D47A1")!
    
    // Light Blue Shades
    static let lightBlue1 = UIColor(hex: "#E1F5FE")!
    static let lightBlue2 = UIColor(hex: "#B3E5FC")!
    static let lightBlue3 = UIColor(hex: "#81D4FA")!
    static let lightBlue4 = UIColor(hex: "#4FC3F7")!
    static let lightBlue5 = UIColor(hex: "#29B6F6")!
    static let lightBlue6 = UIColor(hex: "#03A9F4")!
    static let lightBlue7 = UIColor(hex: "#039BE5")!
    static let lightBlue8 = UIColor(hex: "#0288D1")!
    static let lightBlue9 = UIColor(hex: "#0277BD")!
    static let lightBlue10 = UIColor(hex: "#01579B")!
    
    // Cyan Shades
    static let cyan1 = UIColor(hex: "#E0F7FA")!
    static let cyan2 = UIColor(hex: "#B2EBF2")!
    static let cyan3 = UIColor(hex: "#80DEEA")!
    static let cyan4 = UIColor(hex: "#4DD0E1")!
    static let cyan5 = UIColor(hex: "#26C6DA")!
    static let cyan6 = UIColor(hex: "#00BCD4")!
    static let cyan7 = UIColor(hex: "#00ACC1")!
    static let cyan8 = UIColor(hex: "#0097A7")!
    static let cyan9 = UIColor(hex: "#00838F")!
    static let cyan10 = UIColor(hex: "#006064")!
    
    // Teal Shades
    static let teal1 = UIColor(hex: "#E0F2F1")!
    static let teal2 = UIColor(hex: "#B2DFDB")!
    static let teal3 = UIColor(hex: "#80CBC4")!
    static let teal4 = UIColor(hex: "#4DB6AC")!
    static let teal5 = UIColor(hex: "#26A69A")!
    static let teal6 = UIColor(hex: "#009688")!
    static let teal7 = UIColor(hex: "#00897B")!
    static let teal8 = UIColor(hex: "#00796B")!
    static let teal9 = UIColor(hex: "#00695C")!
    static let teal10 = UIColor(hex: "#004D40")!
    
    // Green Shades
    static let green1 = UIColor(hex: "#E8F5E9")!
    static let green2 = UIColor(hex: "#C8E6C9")!
    static let green3 = UIColor(hex: "#A5D6A7")!
    static let green4 = UIColor(hex: "#81C784")!
    static let green5 = UIColor(hex: "#66BB6A")!
    static let green6 = UIColor(hex: "#4CAF50")!
    static let green7 = UIColor(hex: "#43A047")!
    static let green8 = UIColor(hex: "#388E3C")!
    static let green9 = UIColor(hex: "#2E7D32")!
    static let green10 = UIColor(hex: "#1B5E20")!
    
    // Light Green Shades
    static let lightGreen1 = UIColor(hex: "#F1F8E9")!
    static let lightGreen2 = UIColor(hex: "#DCEDC8")!
    static let lightGreen3 = UIColor(hex: "#C5E1A5")!
    static let lightGreen4 = UIColor(hex: "#AED581")!
    static let lightGreen5 = UIColor(hex: "#9CCC65")!
    static let lightGreen6 = UIColor(hex: "#8BC34A")!
    static let lightGreen7 = UIColor(hex: "#7CB342")!
    static let lightGreen8 = UIColor(hex: "#689F38")!
    static let lightGreen9 = UIColor(hex: "#558B2F")!
    static let lightGreen10 = UIColor(hex: "#33691E")!
    
    // Lime Shades
    static let lime1 = UIColor(hex: "#F9FBE7")!
    static let lime2 = UIColor(hex: "#F0F4C3")!
    static let lime3 = UIColor(hex: "#E6EE9C")!
    static let lime4 = UIColor(hex: "#DCE775")!
    static let lime5 = UIColor(hex: "#D4E157")!
    static let lime6 = UIColor(hex: "#CDDC39")!
    static let lime7 = UIColor(hex: "#C0CA33")!
    static let lime8 = UIColor(hex: "#AFB42B")!
    static let lime9 = UIColor(hex: "#9E9D24")!
    static let lime10 = UIColor(hex: "#827717")!
    
    // Yellow Shades
    static let yellow1 = UIColor(hex: "#FFFDE7")!
    static let yellow2 = UIColor(hex: "#FFF9C4")!
    static let yellow3 = UIColor(hex: "#FFF59D")!
    static let yellow4 = UIColor(hex: "#FFF176")!
    static let yellow5 = UIColor(hex: "#FFEE58")!
    static let yellow6 = UIColor(hex: "#FFEB3B")!
    static let yellow7 = UIColor(hex: "#FDD835")!
    static let yellow8 = UIColor(hex: "#FBC02D")!
    static let yellow9 = UIColor(hex: "#F9A825")!
    static let yellow10 = UIColor(hex: "#F57F17")!
    
    // Amber Shades
    static let amber1 = UIColor(hex: "#FFF8E1")!
    static let amber2 = UIColor(hex: "#FFECB3")!
    static let amber3 = UIColor(hex: "#FFE082")!
    static let amber4 = UIColor(hex: "#FFD54F")!
    static let amber5 = UIColor(hex: "#FFCA28")!
    static let amber6 = UIColor(hex: "#FFC107")!
    static let amber7 = UIColor(hex: "#FFB300")!
    static let amber8 = UIColor(hex: "#FFA000")!
    static let amber9 = UIColor(hex: "#FF8F00")!
    static let amber10 = UIColor(hex: "#FF6F00")!
    
    // Orange Shades
    static let orange1 = UIColor(hex: "#FFF3E0")!
    static let orange2 = UIColor(hex: "#FFE0B2")!
    static let orange3 = UIColor(hex: "#FFCC80")!
    static let orange4 = UIColor(hex: "#FFB74D")!
    static let orange5 = UIColor(hex: "#FFA726")!
    static let orange6 = UIColor(hex: "#FF9800")!
    static let orange7 = UIColor(hex: "#FB8C00")!
    static let orange8 = UIColor(hex: "#F57C00")!
    static let orange9 = UIColor(hex: "#EF6C00")!
    static let orange10 = UIColor(hex: "#E65100")!
    
    // Deep Orange Shades
    static let deepOrange1 = UIColor(hex: "#FBE9E7")!
    static let deepOrange2 = UIColor(hex: "#FFCCBC")!
    static let deepOrange3 = UIColor(hex: "#FFAB91")!
    static let deepOrange4 = UIColor(hex: "#FF8A65")!
    static let deepOrange5 = UIColor(hex: "#FF7043")!
    static let deepOrange6 = UIColor(hex: "#FF5722")!
    static let deepOrange7 = UIColor(hex: "#F4511E")!
    static let deepOrange8 = UIColor(hex: "#E64A19")!
    static let deepOrange9 = UIColor(hex: "#D84315")!
    static let deepOrange10 = UIColor(hex: "#BF360C")!
    
    // Brown Shades
    static let brown1 = UIColor(hex: "#EFEBE9")!
    static let brown2 = UIColor(hex: "#D7CCC8")!
    static let brown3 = UIColor(hex: "#BCAAA4")!
    static let brown4 = UIColor(hex: "#A1887F")!
    static let brown5 = UIColor(hex: "#8D6E63")!
    static let brown6 = UIColor(hex: "#795548")!
    static let brown7 = UIColor(hex: "#6D4C41")!
    static let brown8 = UIColor(hex: "#5D4037")!
    static let brown9 = UIColor(hex: "#4E342E")!
    static let brown10 = UIColor(hex: "#3E2723")!
    
    // Grey Shades
    static let grey1 = UIColor(hex: "#FAFAFA")!
    static let grey2 = UIColor(hex: "#F5F5F5")!
    static let grey3 = UIColor(hex: "#EEEEEE")!
    static let grey4 = UIColor(hex: "#E0E0E0")!
    static let grey5 = UIColor(hex: "#BDBDBD")!
    static let grey6 = UIColor(hex: "#9E9E9E")!
    static let grey7 = UIColor(hex: "#757575")!
    static let grey8 = UIColor(hex: "#616161")!
    static let grey9 = UIColor(hex: "#424242")!
    static let grey10 = UIColor(hex: "#212121")!
    
    // Blue Grey Shades
    static let blueGrey1 = UIColor(hex: "#ECEFF1")!
    static let blueGrey2 = UIColor(hex: "#CFD8DC")!
    static let blueGrey3 = UIColor(hex: "#B0BEC5")!
    static let blueGrey4 = UIColor(hex: "#90A4AE")!
    static let blueGrey5 = UIColor(hex: "#78909C")!
    static let blueGrey6 = UIColor(hex: "#607D8B")!
    static let blueGrey7 = UIColor(hex: "#546E7A")!
    static let blueGrey8 = UIColor(hex: "#455A64")!
    static let blueGrey9 = UIColor(hex: "#37474F")!
    static let blueGrey10 = UIColor(hex: "#263238")!
    
    
    static let chartreuseGreen = UIColor(red: 0.5, green: 1.0, blue: 0.0, alpha: 1.0)
    static let springGreen = UIColor(red: 0.0, green: 1.0, blue: 0.5, alpha: 1.0)
    static let azure = UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0)
    static let violet = UIColor(red: 0.93, green: 0.51, blue: 0.93, alpha: 1.0)
    static let rose = UIColor(red: 1.0, green: 0.0, blue: 0.5, alpha: 1.0)
    
    // Some Interesting Colors
    static let ceriseRed = UIColor(red: 0.90, green: 0.22, blue: 0.43, alpha: 1.0)
    static let RynFlesh = UIColor(red: 0.97, green: 0.94, blue: 0.93, alpha: 1.0)
    static let TurquoiseSea = UIColor(red: 0.33, green: 0.81, blue: 0.92, alpha: 1.0)
    static let blueSapphire = UIColor(red: 0.15, green: 0.28, blue: 0.63, alpha: 1.0)
    static let preciousPink = UIColor(red: 0.98, green: 0.70, blue: 0.71, alpha: 1.0)
    static let pinkDiminishing = UIColor(red: 1.00, green: 0.96, blue: 0.96, alpha: 1.0)
    static let powderPink = UIColor(red: 0.99, green: 0.83, blue: 0.89, alpha: 1.0)
    static let schaussPink = UIColor(red: 1.00, green: 0.56, blue: 0.70, alpha: 1.0)
    static let astorathRed = UIColor(red: 0.89, green: 0.29, blue: 0.17, alpha: 1.0)
    static let goldenCrest = UIColor(red: 0.97, green: 0.78, blue: 0.40, alpha: 1.0)
    
    
    // Color Pallete
    
    // Column 1
    static let r1c1 = UIColor(red: 0.97, green: 0.92, blue: 0.92, alpha: 1.0) // HEX: #F9EBEA   RGB: 249, 235, 234, HSL: 6, 54%, 95%
    static let r2c1 = UIColor(red: 0.95, green: 0.84, blue: 0.83, alpha: 1.0) // HEX: #F2D7D5   RGB: 242, 215, 213, HSL: 6, 54%, 89%
    static let r3c1 = UIColor(red: 0.90, green: 0.69, blue: 0.67, alpha: 1.0) // HEX: #E6B0AA   RGB: 230, 176, 170, HSL: 6, 54%, 78%
    static let r4c1 = UIColor(red: 0.85, green: 0.53, blue: 0.50, alpha: 1.0) // HEX: #D98880   RGB: 217, 136, 128, HSL: 6, 54%, 68%
    static let r5c1 = UIColor(red: 0.80, green: 0.38, blue: 0.34, alpha: 1.0) // HEX: #CD6155   RGB: 205, 97, 85, HSL: 6, 54%, 57%
    static let r6c1 = UIColor(red: 0.75, green: 0.22, blue: 0.17, alpha: 1.0) // HEX: #C0392B   RGB: 192, 57, 43, HSL: 6, 63%, 46%
    static let r7c1 = UIColor(red: 0.66, green: 0.20, blue: 0.15, alpha: 1.0) // HEX: #A93226   RGB: 169, 50, 38, HSL: 6, 63%, 41%
    static let r8c1 = UIColor(red: 0.57, green: 0.17, blue: 0.13, alpha: 1.0) // HEX: #922B21   RGB: 146, 43, 33, HSL: 6, 63%, 35%
    static let r9c1 = UIColor(red: 0.48, green: 0.14, blue: 0.11, alpha: 1.0) // HEX: #7B241C   RGB: 123, 36, 28, HSL: 6, 63%, 29%
    static let r10c1 = UIColor(red: 0.39, green: 0.12, blue: 0.09, alpha: 1.0) // HEX: #641E16   RGB: 100, 30, 22, HSL: 6, 63%, 24%
    
    
    
    // Column 2
    static let r1c2 = UIColor(red: 0.99, green: 0.93, blue: 0.92, alpha: 1.0)  // HEX: #FDEDEC   RGB: 253, 237, 236, HSL: 6, 78%, 96%
    static let r2c2 = UIColor(red: 0.98, green: 0.86, blue: 0.85, alpha: 1.0)  // HEX: #FADBD8   RGB: 250, 219, 216, HSL: 6, 78%, 91%
    static let r3c2 = UIColor(red: 0.96, green: 0.72, blue: 0.69, alpha: 1.0)  // HEX: #F5B7B1   RGB: 245, 183, 177, HSL: 6, 78%, 83%
    static let r4c2 = UIColor(red: 0.94, green: 0.58, blue: 0.54, alpha: 1.0)  // HEX: #F1948A   RGB: 241, 148, 138, HSL: 6, 78%, 74%
    static let r5c2 = UIColor(red: 0.92, green: 0.44, blue: 0.39, alpha: 1.0)  // HEX: #EC7063   RGB: 236, 112, 99, HSL: 6, 78%, 66%
    static let r6c2 = UIColor(red: 0.90, green: 0.30, blue: 0.24, alpha: 1.0)  // HEX: #E74C3C   RGB: 231, 76, 60, HSL: 6, 78%, 57%
    static let r7c2 = UIColor(red: 0.80, green: 0.26, blue: 0.21, alpha: 1.0)  // HEX: #CB4335   RGB: 203, 67, 53, HSL: 6, 59%, 50%
    static let r8c2 = UIColor(red: 0.69, green: 0.23, blue: 0.18, alpha: 1.0)  // HEX: #B03A2E   RGB: 176, 58, 46, HSL: 6, 59%, 43%
    static let r9c2 = UIColor(red: 0.58, green: 0.19, blue: 0.15, alpha: 1.0)  // HEX: #943126   RGB: 148, 49, 38, HSL: 6, 59%, 37%
    static let r10c2 = UIColor(red: 0.47, green: 0.16, blue: 0.12, alpha: 1.0)  // HEX: #78281F   RGB: 120, 40, 31, HSL: 6, 59%, 30%
    
    // Column 3
    static let r1c3 = UIColor(red: 0.96, green: 0.93, blue: 0.97, alpha: 1.0)  // HEX: #F5EEF8   RGB: 245, 238, 248, HSL: 283, 39%, 95%
    
    // Column 4
    static let r1c4 = UIColor(red: 0.95, green: 0.92, blue: 0.97, alpha: 1.0)  // HEX: #F4ECF7   RGB: 244, 236, 247, HSL: 282, 39%, 95%
    
    // Column 5
    static let r1c5 = UIColor(red: 0.92, green: 0.95, blue: 0.97, alpha: 1.0)  // HEX: #EAF2F8   RGB: 234, 242, 248, HSL: 204, 51%, 94%
    
    // Column 6
    static let r1c6 = UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1.0)  // HEX: #EBF5FB   RGB: 235, 245, 251, HSL: 204, 70%, 95%
    
    // Column 7
    
}

