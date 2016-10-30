//
//  Track.swift
//  AlamofireUsage
//
//  Created by Rupam Mitra on 30/10/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit
import ObjectMapper

class Track: Mappable {
    
    var trackID: Int?
    var trackName: String?
    var previewURL: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        trackID <- map["trackId"]
        trackName <- map["trackName"]
        previewURL <- map["previewUrl"]
    }
    
    func description() {
        print("Track ID: \(trackID!)\nTrack Name: \(trackName!)\nPreview URL: \(previewURL!)")
    }
}
