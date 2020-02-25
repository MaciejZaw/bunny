//
//  ColorPallet.swift
//  Happy Bunny
//
//  Created by Maciej Zawiejski on 23/02/2020.
//  Copyright © 2020 Maciej Zawiejski. All rights reserved.
//

import Foundation
import UIKit

internal class ColorPallet {
    
    internal static let appBackgraund = UIColor(0xeeeeee)
    
    internal static func createGradientLayerForBunny(view: UIView) {
        var gradientLayer: CAGradientLayer!

        let colorLeft = UIColor(0x000000, alpha: 0).cgColor
        let colorRight = UIColor(0x000000, alpha: 0.5).cgColor
        
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorLeft, colorRight]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        view.backgroundColor = .clear
        let backgroundLayer = gradientLayer
        
        backgroundLayer?.frame = CGRect(
            x: view.frame.width / 2,
            y: 0,
            width: view.frame.size.width / 2,
            height: view.frame.size.height)
        
        backgroundLayer?.cornerRadius = 32
        
        view.layer.insertSublayer(backgroundLayer!, at: 0)
    }
}
