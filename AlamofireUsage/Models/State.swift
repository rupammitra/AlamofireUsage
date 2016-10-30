//
//  State.swift
//  AlamofireUsage
//
//  Created by Rupam Mitra on 30/10/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit
import ObjectMapper

class State: Mappable {
    
    var country: String?
    var name: String?
    var abbr: String?
    var capital: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        country <- map["country"]
        name <- map["name"]
        abbr <- map["abbr"]
        capital <- map["capital"]
    }
    
    func description() {
        print("State: \(name!)\nCountry: \(country!)\nCapital: \(capital!)")
    }
}
