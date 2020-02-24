//
//  BunnyCollectionViewCell.swift
//  Happy Bunny
//
//  Created by Maciej Zawiejski on 21/02/2020.
//  Copyright © 2020 Maciej Zawiejski. All rights reserved.
//

import UIKit

class BunnyCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: FIELDS VIEWS
    
    private var imageView: UIImageView = UIImageView()
    private var detailsView: UIView = UIView()
    private var tableView: UITableView = UITableView()
    
    private var titleLabel: BunnyTitleLabel = BunnyTitleLabel()
    private var infoLabel: BunnyLabel = BunnyLabel()
    
    //MARK: FIELDS
    
    private let margin: CGFloat = 16
    private let tableViewCellHeight: CGFloat = 32
    
    internal func setCell(view: UICollectionView, bunny: Bunny) {
        
        // imageView
        
        self.addSubview(imageView)
        
        
        imageView.frame = CGRect(
            x: 16,
            y: 16,
            width: view.frame.width - 32,
            height: view.frame.height - 32)
        imageView.layer.cornerRadius = 32
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.contentMode = .scaleToFill
        imageView.image = bunny.image
        imageView.layoutIfNeeded()
        
        // detailsView
        
        imageView.addSubview(detailsView)
        
        detailsView.frame = CGRect(
            x: imageView.bounds.width / 2,
            y: imageView.bounds.origin.y,
            width: imageView.bounds.width / 2,
            height: imageView.bounds.height)
        detailsView.layer.cornerRadius = 32
        ColorPallet.createGradientLayerForBunny(view: detailsView)
        
        // titleLabel
        
        detailsView.addSubview(titleLabel)
        
        titleLabel.frame = CGRect(
            x: detailsView.bounds.origin.x + 16,
            y: detailsView.bounds.origin.y + 16,
            width: detailsView.bounds.width - 32,
            height: 16)
        
        titleLabel.set(text: "lbl_bunny_name".localized(), fontSize: 16)
        
        // infoLabel
        
        detailsView.addSubview(infoLabel)
        
        infoLabel.frame = CGRect(
        x: 16,
        y: 48,
        width: self.frame.width - 32,
        height: 16)
        
        infoLabel.set(text: bunny.name, fontSize: 10)
        
    }
}
