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
    
    internal func setCell(view: UICollectionView, image: UIImage) {
        
        imageView.frame = CGRect(
            x: 8,
            y: 8,
            width: view.frame.height - 16,
            height: view.frame.height - 16)
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.contentMode = .scaleToFill
        imageView.image = image
        imageView.layoutIfNeeded()
        
        self.addSubview(imageView)
    }
    
    internal func setCellWhitAddButton(view: UICollectionView) {
        setCell(
            view: view,
            image: AppConfig.addingPlusIcon)
    }
}
