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
    
    @IBOutlet weak var bunnyCurrentCollectionView: UICollectionView!
    @IBOutlet weak var bunnyListCollectionView: UICollectionView!
    
    //MARK: FIELDS
    
    private var bunniesList: [Bunny] = []
    
    //MARK: LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionViewRegister()
        bunnyCurrentCollectionView.delegate = self
        bunnyCurrentCollectionView.dataSource = self
        bunnyListCollectionView.delegate = self
        bunnyListCollectionView.dataSource = self
        
        BunnyRequest.get() {
            [weak self] (queryResult, result: [Bunny]) in
            
            if queryResult == .success {
                self?.bunniesList = result
                self?.bunnyCurrentCollectionView.reloadData()
                self?.bunnyListCollectionView.reloadData()
            }
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
            return CGSize() //TODO
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
            return bunniesList.count
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
            let callBunnyList = collectionView.dequeueReusableCell(
                withReuseIdentifier: "BunnyListCollectionViewCell",
                for: indexPath) as! BunnyListCollectionViewCell
            
            
            let bunny = bunniesList[indexPath.row]
            
            //TODO: implement function
            callBunnyList.setCell(view: collectionView, bunny: bunny)
            
            return callBunnyList
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
}

