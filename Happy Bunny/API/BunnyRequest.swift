//
//  BunnyRequest.swift
//  Happy Bunny
//
//  Created by Maciej Zawiejski on 24/02/2020.
//  Copyright © 2020 Maciej Zawiejski. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

public class BunnyRequest: BunnyResponse {
    
    //MARK: Get list of my bunny
    
    static func get(
        completion: @escaping (
            _ queryResult: QueryResult,
            _ result: [Bunny]) -> Void) {
        
        // executing request
        
        API.baseRequest("/bunnies", .get, nil, #file, #function) {
            queryResult, data in

            //TODO: remove test data
            if let data = testJSON.data(using: .utf8) {
                if let json = try? JSON(data: data) {
                    let bunniesList = getResponseList(json["data"].dictionaryValue)
                    completion(.success, bunniesList)
                }
            }
            
            //TODO: remove comment
//            if queryResult == .success {
//                let bunniesList = getResponseList(data)
//                completion(.success, bunniesList)
//            } else {
//                completion(.failure, [])
//            }
        }
    }
    
    //TODO: remove
    static let testJSON = """
{
  "data": {
    "bunny": [
      {
        "id": "b5b52d92-4dab-4f18-8e08-ad1960b0ce4d",
        "name": "Sese",
        "image": "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"
      },
      {
        "id": "0300e6f5-c0af-445c-916b-e95ccad8fca4",
        "name": "Pesia",
        "image": "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"
      }
    ]
  }
}
"""
}
