//
//  Log.swift
//  Happy Bunny
//
//  Created by Maciej Zawiejski on 23/02/2020.
//  Copyright © 2020 Maciej Zawiejski. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import SystemConfiguration

class Log {

    private static let separator = "======================================="
    private static let tab = "=========="
    
    internal static func apiQueryError(_ location: String, _ error: Any, _ code: Int) {
        #if DEBUG
        print("\(separator)\n\(tab) ERROR \(code) in \(location.uppercased())\n\(tab) MESSAGE: \(error)\n")
        #endif
    }
    
    internal static func apiQuerySuccess(_ location: String, _ result: Any) {
        #if DEBUG
        print("\(separator)\n\(tab) Query has executed successfully\n\(tab) IN: \(location)\n\(tab) Result:\n \(result)\n")
        #endif
    }
}

