//
//  StateRoot.swift
//  AlamofireUsage
//
//  Created by Rupam Mitra on 30/10/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit
import ObjectMapper

class StateRoot: Mappable {
    
    var state: State?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        state <- map["result"]
    }
}

class ResponseRoot: Mappable {
    
    var state: State?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        state <- map["RestResponse.result"]
    }
}
