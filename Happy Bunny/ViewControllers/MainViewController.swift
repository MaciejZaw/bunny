//
//  MainViewController.swift
//  Happy Bunny
//
//  Created by Maciej Zawiejski on 21/02/2020.
//  Copyright © 2020 Maciej Zawiejski. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {

    //MARK: OUTLET
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var bunnyCurrentCollectionView: UICollectionView!
    @IBOutlet weak var bunnyListCollectionView: UICollectionView!
    
    //MARK: FIELDS
    
    private var bunniesList: [Bunny] = []
    
    //MARK: LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Collection View
        
        setCollectionViewRegister()
        bunnyCurrentCollectionView.delegate = self
        bunnyCurrentCollectionView.dataSource = self
        bunnyListCollectionView.delegate = self
        bunnyListCollectionView.dataSource = self
        
        // Geting data form server
        
        BunnyRequest.get() {
            [weak self] (queryResult, result: [Bunny]) in
            
            if queryResult == .success {
                self?.bunniesList = result
                self?.bunnyCurrentCollectionView.reloadData()
                self?.bunnyListCollectionView.reloadData()
            }
        }
        
        // Setting up UI
        
        setupUI()
    }
    
    private func setupUI() {
        
        mainView.backgroundColor = ColorPallet.appBackgraund
        
        bunnyCurrentCollectionView.backgroundColor = .clear
        bunnyCurrentCollectionView.isPagingEnabled = true
        if let layout = bunnyCurrentCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        bunnyListCollectionView.backgroundColor = .clear
        if let layout = bunnyListCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    //MARK: COLECTION VIEW
    
    internal func setCollectionViewRegister() {
        bunnyCurrentCollectionView.register(
            BunnyCollectionViewCell.self,
            forCellWithReuseIdentifier: "BunnyCollectionViewCell")
        
        bunnyListCollectionView.register(
            BunnyListCollectionViewCell.self,
            forCellWithReuseIdentifier: "BunnyListCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // CURRENT bunny
        
        if collectionView == bunnyCurrentCollectionView {
            return CGSize(
                width: bunnyCurrentCollectionView.bounds.width,
                height: bunnyCurrentCollectionView.bounds.height)
        }
        
        // LIST of bunnys
        
        if collectionView == bunnyListCollectionView {
            return CGSize(
                width: bunnyListCollectionView.bounds.height,
                height: bunnyListCollectionView.bounds.height)
        }
        
        return CGSize()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // CURRENT bunny
        
        if collectionView == bunnyCurrentCollectionView {
            return bunniesList.count
        }
        
        // LIST of bunnys
        
        if collectionView == bunnyListCollectionView {
            return bunniesList.count + 1
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // CURRENT bunny
        
        if collectionView == bunnyCurrentCollectionView {
            let cellBunny = collectionView.dequeueReusableCell(
                withReuseIdentifier: "BunnyCollectionViewCell",
                for: indexPath) as! BunnyCollectionViewCell
            
            
            let bunny = bunniesList[indexPath.row]
            
            cellBunny.setCell(view: collectionView, bunny: bunny)
            
            return cellBunny
        }
        
        // LIST of bunnies
        
        if collectionView == bunnyListCollectionView {
            
             var cellImage: UIImage = UIImage()
            
            let cellBunnyList = collectionView.dequeueReusableCell(
                withReuseIdentifier: "BunnyListCollectionViewCell",
                for: indexPath) as! BunnyListCollectionViewCell
            
           
            if indexPath.row >= bunniesList.count {
                // Adding "New bunny button" to the end of collection
                cellBunnyList.setCellWhitAddButton(view: collectionView)
            } else {
                // Normal "LIST of bunnies" cell
                cellImage = bunniesList[indexPath.row].image
                cellBunnyList.setCell(view: collectionView, image: cellImage)
            }

            return cellBunnyList
            
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == bunnyListCollectionView {
            if indexPath.row >= bunniesList.count {
                //TODO: Open Add bunny screen
            } else {
                bunnyCurrentCollectionView.selectItem(
                    at: indexPath,
                    animated: true,
                    scrollPosition: .centeredHorizontally)
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
}

