//
//  FindColorViewController.swift
//  Color Picker
//
//  Created by Mehrdad on 2020-07-26.
//  Copyright © 2020 Mehrdad. All rights reserved.
//

import UIKit
import CoreGraphics

class FindColorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    // MARK: Outlets
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet weak var imageContainingView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectedColorView: UIView!
    @IBOutlet weak var hexValueLabel: UILabel!
    @IBOutlet weak var rgbValueLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    // MARK: Properties
    

    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Gallery Button
        galleryButton.layer.cornerRadius = galleryButton.frame.size.width / 2
        galleryButton.clipsToBounds = true
        galleryButton.layer.borderWidth = 1.0
        galleryButton.layer.borderColor = UIColor.black.cgColor

        // Camera Button
        cameraButton.layer.cornerRadius = cameraButton.frame.size.width / 2
        cameraButton.clipsToBounds = true
        cameraButton.layer.borderWidth = 1.0
        cameraButton.layer.borderColor = UIColor.black.cgColor
        
        // Gesture Recognizer
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        activityIndicator.addGestureRecognizer(panGesture)
        panGesture.delegate = self
        
//        imageView.addSubview(activityIndicator)
        
        activityIndicator.center = CGPoint(x: imageContainingView.bounds.origin.x + (imageContainingView.bounds.size.width / 2), y: imageContainingView.bounds.origin.y + (imageContainingView.bounds.size.height / 2))
        
        // Navigation Bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearTapped))
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        imageView.addSubview(activityIndicator)
//        activityIndicator.center = CGPoint(x: imageContainingView.bounds.origin.x + (imageContainingView.bounds.size.width / 2), y: imageContainingView.bounds.origin.y + (imageContainingView.bounds.size.height / 2))
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    

    
    
    // MARK: Actions
    
    @IBAction func pickFromGallery(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func pickFromCamera(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func clearTapped() {
        hexValueLabel.text = "#FFFFFF"
        rgbValueLabel.text = "RGB Value"
        selectedColorView.backgroundColor = UIColor.white
        imageView.image = nil
    }
    
    
    // MARK: Helper Methods
    
    func createImageFromImageView() -> UIImage {
        UIGraphicsBeginImageContext(imageView.bounds.size)
        imageView.drawHierarchy(in: imageView.bounds, afterScreenUpdates: true)
        imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
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
    
    
    
    // MARK: UIImagePickerController Delegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            imageView.contentMode = .scaleAspectFit
            imageView.contentMode = .scaleAspectFill
            imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}



extension FindColorViewController: UIGestureRecognizerDelegate {
    
    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard gestureRecognizer != nil else {
            return
        }
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let point = gestureRecognizer.location(in: imageView)
//            startLocation = point.y
            
            let superBounds = CGRect(x: imageView.bounds.origin.x, y: imageView.bounds.origin.y, width: imageView.bounds.size.width, height: imageView.bounds.size.height)
            
            if (superBounds.contains(point)) {
                let translation = gestureRecognizer.translation(in: imageView)
//                dragOffset = CGSize(width: translation.x, height: translation.y)
//
//                circleViewY.constant -= translation.y
                
                gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
                
                let imageFromImageView = createImageFromImageView()
                let selectedColor = imageFromImageView.cgImage?.color(at: point)
                selectedColorView.backgroundColor = selectedColor
                
                if let selectedColor = selectedColor {
                    hexValueLabel.text = "#\(getHexValue(color: selectedColor))"
                    rgbValueLabel.text = getRGBValue(color: selectedColor)
                }
                
                gestureRecognizer.setTranslation(CGPoint.zero, in: imageView)
            }
        }
            
//        else if gestureRecognizer.state == .cancelled {
//            gestureRecognizer.setTranslation(CGPoint.zero, in: gestureRecognizer.view?.superview)
//        }
    }
}
