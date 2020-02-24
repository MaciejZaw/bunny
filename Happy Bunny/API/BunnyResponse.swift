//
//  BunnyResponse.swift
//  Happy Bunny
//
//  Created by Maciej Zawiejski on 24/02/2020.
//  Copyright © 2020 Maciej Zawiejski. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

public class BunnyResponse {

    static func getResponseList(_ data: [String : SwiftyJSON.JSON]) -> [Bunny] {
        var bunniesList = [Bunny]()
        
        let result = data["bunny"]!.arrayValue
        

        for bunny in result {
            
            let newBunny = Bunny(
                id: bunny["id"].stringValue,
                name: bunny["name"].stringValue,
                image: UIImage(data: Data(base64Encoded: bunny["image"].stringValue, options: .ignoreUnknownCharacters) ??  Data())!)
            
            // check if valid
            
            if newBunny.id == "" {
        
                continue
        
            } else {
                        
                bunniesList.append(newBunny)
                        
            }
        }
        
        return bunniesList
    }
}
