//
//  AlamofireManager.swift
//  AlamofireUsage
//
//  Created by Rupam Mitra on 30/10/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import Foundation
import Reqres
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

func += <K, V> (left: inout [K:V], right: [K:V]) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}

class AlamofireManager: SessionManager {
    
    static let manager: AlamofireManager = {
        let configuration = Reqres.defaultSessionConfiguration()
        let manager = AlamofireManager(configuration: configuration)
        return manager
    }()
    
    private static let apiKey = ""
    private let baseURL = ""
    private let parameterEncoding: ParameterEncoding = URLEncoding.httpBody // for JSON encoding use JSONEncoding.default
    private var header: [String: String] = ["apiKey": apiKey]
    
    func getRequest(forEndpoint endpoint: String?, withHeaders headers: [String: String]?, forParameters parameters: [String: AnyObject]?, withSuccess success:@escaping (_ response: Any?) -> (), andFailure failure:@escaping (_ error: Error?) -> ()) {
        
        if headers != nil {
            header += headers!
        }
        
        let url: String?
        if endpoint != nil {
            url = baseURL + endpoint!
        }else {
            url = baseURL
        }
        
        AlamofireManager.manager.request(url!, method: .get, parameters: parameters, encoding: parameterEncoding, headers: header).validate().responseJSON { (response) in
            guard response.result.isSuccess else {
                failure(response.result.error)
                return
            }
            
            if let value = response.result.value {
                success(value)
            }
        }
    }
    
    func getRequestObject<T: Mappable>(forKeyPath keyPath: String?, forEndpoint endpoint: String?, withHeaders headers: [String: String]?, forParameters parameters: [String: AnyObject]?, withSuccess success:@escaping (_ response: T) -> (), andFailure failure:@escaping (_ error: Error?) -> ()) {
        
        if headers != nil {
            header += headers!
        }
        
        let url: String?
        if endpoint != nil {
            url = baseURL + endpoint!
        }else {
            url = baseURL
        }
        
        AlamofireManager.manager.request(url!, method: .get, parameters: parameters, encoding: parameterEncoding, headers: header).validate().responseObject(keyPath: keyPath) { (response: DataResponse<T>) in
            guard response.result.isSuccess else {
                failure(response.result.error)
                return
            }
            
            if let value = response.result.value {
                success(value)
            }
        }
    }
    
    func getRequestArray<T: Mappable>(forKeyPath keyPath: String?, forEndpoint endpoint: String?, withHeaders headers: [String: String]?, forParameters parameters: [String: AnyObject]?, withSuccess success:@escaping (_ response: [T]) -> (), andFailure failure:@escaping (_ error: Error?) -> ()) {
        
        if headers != nil {
            header += headers!
        }
        
        let url: String?
        if endpoint != nil {
            url = baseURL + endpoint!
        }else {
            url = baseURL
        }
        
        AlamofireManager.manager.request(url!, method: .get, parameters: parameters, encoding: parameterEncoding, headers: header).validate().responseArray(keyPath: keyPath) { (response: DataResponse<[T]>) in
            guard response.result.isSuccess else {
                failure(response.result.error)
                return
            }
            
            if let value = response.result.value {
                success(value)
            }
        }
    }
    
    func postRequest(forEndpoint endpoint: String?, withHeaders headers: [String: String]?, forParameters parameters: [String: AnyObject]?, withSuccess success:@escaping (_ response: Any?) -> (), andFailure failure:@escaping (_ error: Error?) -> ()) {
        
        if headers != nil {
            header += headers!
        }
        
        let url: String?
        if endpoint != nil {
            url = baseURL + endpoint!
        }else {
            url = baseURL
        }
        
        AlamofireManager.manager.request(url!, method: .post, parameters: parameters, encoding: parameterEncoding, headers: header).validate().responseJSON { (response) in
            guard response.result.isSuccess else {
                failure(response.result.error)
                return
            }
            
            if let value = response.result.value {
                success(value)
            }
        }
    }
    
    func postRequestObject<T: Mappable>(forKeyPath keyPath: String?, forEndpoint endpoint: String?, withHeaders headers: [String: String]?, forParameters parameters: [String: AnyObject]?, withSuccess success:@escaping (_ response: T) -> (), andFailure failure:@escaping (_ error: Error?) -> ()) {
        
        if headers != nil {
            header += headers!
        }
        
        let url: String?
        if endpoint != nil {
            url = baseURL + endpoint!
        }else {
            url = baseURL
        }
        
        AlamofireManager.manager.request(url!, method: .post, parameters: parameters, encoding: parameterEncoding, headers: header).validate().responseObject(keyPath: keyPath) { (response: DataResponse<T>) in
            guard response.result.isSuccess else {
                failure(response.result.error)
                return
            }
            
            if let value = response.result.value {
                success(value)
            }
        }
    }
    
    func postRequestArray<T: Mappable>(forKeyPath keyPath: String?, forEndpoint endpoint: String?, withHeaders headers: [String: String]?, forParameters parameters: [String: AnyObject]?, withSuccess success:@escaping (_ response: [T]) -> (), andFailure failure:@escaping (_ error: Error?) -> ()) {
        
        if headers != nil {
            header += headers!
        }
        
        let url: String?
        if endpoint != nil {
            url = baseURL + endpoint!
        }else {
            url = baseURL
        }
        
        AlamofireManager.manager.request(url!, method: .post, parameters: parameters, encoding: parameterEncoding, headers: header).validate().responseArray(keyPath: keyPath) { (response: DataResponse<[T]>) in
            guard response.result.isSuccess else {
                failure(response.result.error)
                return
            }
            
            if let value = response.result.value {
                success(value)
            }
        }
    }
}
