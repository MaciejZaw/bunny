//
//  Bunny.swift
//  Happy Bunny
//
//  Created by Maciej Zawiejski on 21/02/2020.
//  Copyright © 2020 Maciej Zawiejski. All rights reserved.
//

import Foundation
import UIKit

struct Bunny {
    private let _id: String
    private let _name: String
    private let _image: UIImage
    
    init(id: String, name: String, image: UIImage) {
        _id = id
        _name = name
        _image = image
    }
    
    internal var id: String {
        get {
            return _id
        }
    }
    
    internal var name: String {
        get {
            return _name
        }
    }
    
    internal var image: UIImage {
        get {
            return _image
        }
    }
}
