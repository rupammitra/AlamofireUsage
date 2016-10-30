//
//  ViewController.swift
//  AlamofireUsage
//
//  Created by Rupam Mitra on 30/10/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit

let iTunesURL = "http://itunes.apple.com/search?term=bollywood&country=in&entity=song"
let stateURL = "http://services.groupkt.com/state/get/IND/WB"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        requestToWebService()
//        requestToWebServiceForResponseObject()
//        requestToWebServiceForResponseObjectOne()
//        requestToWebServiceForResponseObjectTwo()
        requestToWebServiceForResponseObjectThree()
//        requestToWebServiceForResponseArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestToWebService() {
        let someParam = "param"
        AlamofireManager.manager.getRequest(forEndpoint: iTunesURL, withHeaders: ["param": someParam], forParameters: ["rupam": someParam as AnyObject], withSuccess: {(response) in
            
        }, andFailure: { (error) in
            
        })
    }
    
    func requestToWebServiceForResponseObject() {
        AlamofireManager.manager.getRequestObject(forKeyPath: nil, forEndpoint: stateURL, withHeaders: nil, forParameters: nil, withSuccess: {(response: ResponseRoot) in
            response.state!.description()
        }, andFailure: {(error) in
            
        })
    }
    
    func requestToWebServiceForResponseObjectOne() {
        AlamofireManager.manager.getRequestObject(forKeyPath: "RestResponse", forEndpoint: stateURL, withHeaders: nil, forParameters: nil, withSuccess: {(response: StateRoot) in
            response.state!.description()
        }, andFailure: {(error) in
            
        })
    }
    
    func requestToWebServiceForResponseObjectTwo() {
        AlamofireManager.manager.getRequestObject(forKeyPath: "RestResponse.result", forEndpoint: stateURL, withHeaders: nil, forParameters: nil, withSuccess: {(response: State) in
            response.description()
        }, andFailure: {(error) in
            
        })
    }
    
    func requestToWebServiceForResponseObjectThree() {
        AlamofireManager.manager.getRequestObject(forKeyPath: nil, forEndpoint: iTunesURL, withHeaders: nil, forParameters: nil, withSuccess: {(response: Root) in
            for track: Track in response.results {
                print(track.description())
            }
        }, andFailure: {(error) in
            
        })
    }
    
    func requestToWebServiceForResponseArray() {
        AlamofireManager.manager.getRequestArray(forKeyPath: "results", forEndpoint: iTunesURL, withHeaders: nil, forParameters: nil, withSuccess: { (response: [Track]) in
            for track: Track in response {
                print(track.description())
            }
        }, andFailure: {(error) in
            
        })
    }
}

