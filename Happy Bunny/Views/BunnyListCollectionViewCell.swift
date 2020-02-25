//
//  BunnyListCollectionViewCell.swift
//  Happy Bunny
//
//  Created by Maciej Zawiejski on 21/02/2020.
//  Copyright © 2020 Maciej Zawiejski. All rights reserved.
//

import Foundation
import UIKit

class BunnyListCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: Fields views
    
    private var imageView: UIImageView = UIImageView()
    
    //MARK: Fields
    
    private let margin: CGFloat = 16
    
    internal func setCell(view: UICollectionView, bunny: Bunny) {
        

    }
}
