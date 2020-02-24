//
//  API.swift
//  Happy Bunny
//
//  Created by Maciej Zawiejski on 23/02/2020.
//  Copyright © 2020 Maciej Zawiejski. All rights reserved.
//
import Foundation
import SwiftyJSON
import SystemConfiguration
import Alamofire

internal class API {
    
    //MARK: UNIFIRM RESOURCE LOCATOR ADDRESSES
    
    private static let url = "server url" //TODO: find correct address
    private static func getBaseAddress(_ api: String) -> String {
        return url + api
    }
    
    //MARK: alamofire HEADER
    
    private static let requestHeader = [
        "Content-Type": "application/json"]
    
    //MARK: alamofire PARAMETERS
    
    private static func getParameters(_ parameters: Parameters? = Parameters()) -> Parameters! {
        if parameters?.count == 0
            || parameters == nil {
            
            return nil
        }
        
        return parameters
    }
    
    //MARK: alamofire REQUESTS
    
    internal static func baseRequest(
        _ api: String,
        _ method: HTTPMethod,
        _ parameters: Parameters? = Parameters(),
        _ file: String,
        _ function: String,
        completion: @escaping (
            _ queryResult: QueryResult,
            _ data: [String : SwiftyJSON.JSON]) -> Void) {
        
        // check for internet connection
        
        if !getInternetStatus() {
            
            completion(QueryResult.noInternet, [String : SwiftyJSON.JSON]())
            return
        }
        
        // run request
        
        Alamofire.request(
            getBaseAddress(api),
            method: method,
            parameters: getParameters(parameters),
            encoding: JSONEncoding.default,
            headers: requestHeader)
                .responseJSON { response in

                // get data from response
                
                let data = getResult(response)
                
                // error check
                
                if response.response?.statusCode != 200 {
                    let error = data["error"]?.stringValue
                    
                    Log.apiQueryError(
                        "\(file), \(function) ",
                        error ?? "",
                        (response.response?.statusCode) ?? 0)
                    
                    completion(QueryResult.failure, [String : SwiftyJSON.JSON]())
                    return
                }
                
                if data.count == 0 {
                    Log.apiQueryError(
                        "\(file), \(function) ",
                        "No data",
                        (response.response!.statusCode))
                }
                
                // finish as success
                
                Log.apiQuerySuccess(
                    "\(file), \(function) ",
                    response)
                
                completion(QueryResult.success, data)
        }
    }
    
    //MARK: alamofire RESULT
    
    private static func getResult(_ dataResponse: Any) -> [String : SwiftyJSON.JSON] {
        if let response = dataResponse as? DataResponse<Any> {
            if response.result.value != nil && response.result.value is NSDictionary {
                let json = JSON(response.result.value! as! [String: Any])
                let data = json.dictionaryValue
                
                return data
            }
        }
        
        return [String : SwiftyJSON.JSON]()
    }
    
    //MARK: getInternetStatus
    
    private static func getInternetStatus() -> Bool {
        let isReachable = NetworkReachabilityManager()?.isReachable
        
        if !isReachable! {
            Log.apiQueryError(
                "\(#file), \(#function) ",
                "No internet",
                0)
        }
        
        return isReachable!
    }
}


