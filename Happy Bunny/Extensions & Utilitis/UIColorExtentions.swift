//
//  UIColorExtentions.swift
//  Happy Bunny
//
//  Created by Maciej Zawiejski on 23/02/2020.
//  Copyright © 2020 Maciej Zawiejski. All rights reserved.
//

import Foundation

extension UIColor {
    convenience init(_ value: Int, alpha: CGFloat = 1.0){
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
