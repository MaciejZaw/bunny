//
//  BunnyLabel.swift
//  Happy Bunny
//
//  Created by Maciej Zawiejski on 24/02/2020.
//  Copyright © 2020 Maciej Zawiejski. All rights reserved.
//

import Foundation
import UIKit

class BunnyLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {//convenience
        super.init(frame: frame)
    }
    
    //MARK: Set fucntions
    
    public func set(text: String, fontSize: CGFloat) {
        self.text = text
        self.textColor = .white
    
        font = UIFont(name: "System", size: fontSize)
        
        let heightConstraint = NSLayoutConstraint(
            item: self,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: fontSize + 2)
        addConstraints([heightConstraint])
    }
}
