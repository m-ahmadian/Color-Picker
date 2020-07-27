//
//  ColorSwatchesViewController.swift
//  Color Picker
//
//  Created by Mehrdad on 2020-06-28.
//  Copyright © 2020 Mehrdad. All rights reserved.
//

import UIKit
import CoreGraphics


class ColorPaletteCell: UICollectionViewCell {
    @IBOutlet weak var colorViewLabel: UILabel!
}

class ColorSwatchesViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var colorPaletteCollectionView: UICollectionView!
    @IBOutlet weak var selectedColorView: UIView!
    @IBOutlet weak var selectedColorLabel: UILabel!
    @IBOutlet weak var hexValueLabel: UILabel!
    @IBOutlet weak var rgbValueLabel: UILabel!
    
    
    
    // MARK: Properties
    let reuseIdentifier = "colorCell"
    let columns: CGFloat = 10.0
    let rows: CGFloat = 19.0
    let itemsPerRow: CGFloat = 5
    let spacing: CGFloat = 0.0
    
    let mainColorsArray: [UIColor] = [UIColor.red1, UIColor.red2, UIColor.red3, UIColor.red4, UIColor.red5, UIColor.red6, UIColor.red7, UIColor.red8, UIColor.red9, UIColor.red10,
                                      
        UIColor.pink1, UIColor.pink2, UIColor.pink3, UIColor.pink4, UIColor.pink5, UIColor.pink6, UIColor.pink7, UIColor.pink8, UIColor.pink9, UIColor.pink10,
        
        UIColor.purple1, UIColor.purple2, UIColor.purple3, UIColor.purple4, UIColor.purple5, UIColor.purple6, UIColor.purple7, UIColor.purple8, UIColor.purple9, UIColor.purple10,
        
        UIColor.deepPurple1, UIColor.deepPurple2, UIColor.deepPurple3, UIColor.deepPurple4, UIColor.deepPurple5, UIColor.deepPurple6, UIColor.deepPurple7, UIColor.deepPurple8, UIColor.deepPurple9, UIColor.deepPurple10,
        
        UIColor.indigo1, UIColor.indigo2, UIColor.indigo3, UIColor.indigo4, UIColor.indigo5, UIColor.indigo6, UIColor.indigo7, UIColor.indigo8, UIColor.indigo9, UIColor.indigo10,
        
        UIColor.blue1, UIColor.blue2, UIColor.blue3, UIColor.blue4, UIColor.blue5, UIColor.blue6, UIColor.blue7, UIColor.blue8, UIColor.blue9, UIColor.blue10,
        
        UIColor.lightBlue1, UIColor.lightBlue2, UIColor.lightBlue3, UIColor.lightBlue4, UIColor.lightBlue5, UIColor.lightBlue6, UIColor.lightBlue7, UIColor.lightBlue8, UIColor.lightBlue9, UIColor.lightBlue10,
        
        UIColor.cyan1, UIColor.cyan2, UIColor.cyan3, UIColor.cyan4, UIColor.cyan5, UIColor.cyan6, UIColor.cyan7, UIColor.cyan8, UIColor.cyan9, UIColor.cyan10,
        
        UIColor.teal1, UIColor.teal2, UIColor.teal3, UIColor.teal4, UIColor.teal5, UIColor.teal6, UIColor.teal7, UIColor.teal8, UIColor.teal9, UIColor.teal10,
        
        UIColor.green1, UIColor.green2, UIColor.green3, UIColor.green4, UIColor.green5, UIColor.green6, UIColor.green7, UIColor.green8, UIColor.green9, UIColor.green10,
        
        UIColor.lightGreen1, UIColor.lightGreen2, UIColor.lightGreen3, UIColor.lightGreen4, UIColor.lightGreen5, UIColor.lightGreen6, UIColor.lightGreen7, UIColor.lightGreen8, UIColor.lightGreen9, UIColor.lightGreen10,
        
        UIColor.lime1, UIColor.lime2, UIColor.lime3, UIColor.lime4, UIColor.lime5, UIColor.lime6, UIColor.lime7, UIColor.lime8, UIColor.lime9, UIColor.lime10,
        
        UIColor.yellow1, UIColor.yellow2, UIColor.yellow3, UIColor.yellow4, UIColor.yellow5, UIColor.yellow6, UIColor.yellow7, UIColor.yellow8, UIColor.yellow9, UIColor.yellow10,
        
        UIColor.amber1, UIColor.amber2, UIColor.amber3, UIColor.amber4, UIColor.amber5, UIColor.amber6, UIColor.amber7, UIColor.amber8, UIColor.amber9, UIColor.amber10,
        
        UIColor.orange1, UIColor.orange2, UIColor.orange3, UIColor.orange4, UIColor.orange5, UIColor.orange6, UIColor.orange7, UIColor.orange8, UIColor.orange9, UIColor.orange10,
        
        UIColor.deepOrange1, UIColor.deepOrange2, UIColor.deepOrange3, UIColor.deepOrange4, UIColor.deepOrange5, UIColor.deepOrange6, UIColor.deepOrange7, UIColor.deepOrange8, UIColor.deepOrange9, UIColor.deepOrange10,
        
        UIColor.brown1, UIColor.brown2, UIColor.brown3, UIColor.brown4, UIColor.brown5, UIColor.brown6, UIColor.brown7, UIColor.brown8, UIColor.brown9, UIColor.brown10,
        
        UIColor.grey1, UIColor.grey2, UIColor.grey3, UIColor.grey4, UIColor.grey5, UIColor.grey6, UIColor.grey7, UIColor.grey8, UIColor.grey9, UIColor.grey10,
        
        UIColor.blueGrey1, UIColor.blueGrey2, UIColor.blueGrey3, UIColor.blueGrey4, UIColor.blueGrey5, UIColor.blueGrey6, UIColor.blueGrey7, UIColor.blueGrey8, UIColor.blueGrey9, UIColor.blueGrey10
                           ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorPaletteCollectionView.delegate = self
        colorPaletteCollectionView.dataSource = self
        
        colorPaletteCollectionView.reloadData()
//        view.bringSubviewToFront(selectedColorView)
//        selectedColorView.bringSubviewToFront(selectedColorLabel)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        selectedColorView.bringSubviewToFront(selectedColorLabel)
        view.bringSubviewToFront(selectedColorView)
        
    }
    
    // MARK: Helper Methods
    func getHexValue(color: UIColor) -> String {
        let red = color.redValue
        let green = color.greenValue
        let blue = color.blueValue
        
        let redValue = Int(red >= 1.0 ? 255: red * 256.0)
        let greenValue = Int(green >= 1.0 ? 255: green * 256.0)
        let blueValue = Int(blue >= 1.0 ? 255: blue * 256.0)
        
        let hexValue = String(format: "%02X", Int(redValue)) + String(format: "%02X", Int(greenValue)) + String(format: "%02X", blueValue)
        return hexValue
    }
    
    func getRGBValue(color: UIColor) -> String {
        let red = color.redValue
        let green = color.greenValue
        let blue = color.blueValue
        
        let redValue = Int(red >= 1.0 ? 255: red * 256.0)
        let greenValue = Int(green >= 1.0 ? 255: green * 256.0)
        let blueValue = Int(blue >= 1.0 ? 255: blue * 256.0)
        
        return "RGB(\(redValue), \(greenValue), \(blueValue))"
    }
}


extension ColorSwatchesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainColorsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colorPaletteCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ColorPaletteCell
        
        let colorToDisplay = mainColorsArray[(indexPath as NSIndexPath).row]
        
        cell.backgroundColor = colorToDisplay
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let colorToDisplay = mainColorsArray[(indexPath as NSIndexPath).row]
        DispatchQueue.main.async {
            self.selectedColorView.backgroundColor = colorToDisplay
//            self.selectedColorView.tintColorDidChange()
//            self.selectedColorView.tintColor = colorToDisplay
//            self.selectedColorLabel.backgroundColor = colorToDisplay
        }
//        selectedColorLabel.backgroundColor = colorToDisplay
//        titleLabel.backgroundColor = colorToDisplay
        hexValueLabel.text = "#\(getHexValue(color: colorToDisplay))"
        rgbValueLabel.text = getRGBValue(color: colorToDisplay)
    }
    
    // MARK: Flow Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(colorPaletteCollectionView.frame.width / columns)
        let height = Int(colorPaletteCollectionView.frame.height / rows)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
}
