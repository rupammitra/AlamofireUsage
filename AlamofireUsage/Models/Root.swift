//
//  Root.swift
//  AlamofireUsage
//
//  Created by Rupam Mitra on 30/10/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit
import ObjectMapper

class Root: Mappable {

    var results: [Track]!
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        results <- map["results"]
    }
}
