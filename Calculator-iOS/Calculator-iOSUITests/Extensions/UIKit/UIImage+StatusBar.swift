//
//  UIImage+StatusBar.swift
//  Calculator-iOSUITests
//
//  Created by Serhii Liamtsev on 4/9/22.
//  Copyright © 2022 Grid Dynamics. All rights reserved.
//

import UIKit

extension UIImage {

    var removingStatusBar: UIImage? {
        guard let cgImage = cgImage else {
            return nil
        }
        
        var yOffset: CGFloat = 0
        
        switch UIDevice.current.type {
        case .iPhoneSE, .iPhone7, .iPhone8, .iPhoneSE2:
            yOffset = 40
        case .iPhone7Plus, .iPhone8Plus:
            yOffset = 54
        case .iPhoneXR, .iPhone11, .iPhone12, .iPhone13, .iPhone12Mini, .iPhone13Mini:
            yOffset = 88
        case .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhone11Pro, .iPhone11ProMax, .iPhone12Pro, .iPhone12ProMax, .iPhone13Pro, .iPhone13ProMax:
            yOffset = 132
        default:
            yOffset = 40
        }

        let rect = CGRect(
            x: 0,
            y: Int(yOffset),
            width: cgImage.width,
            height: cgImage.height - Int(yOffset)
        )

        if let croppedCGImage = cgImage.cropping(to: rect) {
            return UIImage(cgImage: croppedCGImage, scale: scale, orientation: imageOrientation)
        }

        return nil
    }
    
}
