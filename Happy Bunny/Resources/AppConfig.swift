//
//  AppConfig.swift
//  Happy Bunny
//
//  Created by Maciej Zawiejski on 25/02/2020.
//  Copyright © 2020 Maciej Zawiejski. All rights reserved.
//

import Foundation

public class AppConfig {
    
    //MARK: FONTS
    
    internal static let normalFont = "Rockwell-Regular"
    internal static let boldFont = "Rockwell-Bold"
    
    //MARK: ICONS
    
    internal static let addingPlusIcon = UIImage(named: "plus")?.setIconColor(.green) ?? UIImage()
}
