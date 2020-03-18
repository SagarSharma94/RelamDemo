//
//  NetworkManager.swift
//  RelamDemo
//
//  Created by Rohit Gupta on 17/02/20.
//  Copyright © 2020 Sahabe Alam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkManager: NSObject {
    static let sharedInstance = NetworkManager()

    func networkCall(header :[String:String],url:String,method:HTTPMethod,parameters : [String:Any]?,completionHandler:@escaping (JSON?,Any?)->Void) {
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        
        manager.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            print(url)
            print("Request: \(response.request!)")
            print("Response: \(response.response?.statusCode)")
            print("Error: \(response.error)")
            print(response.result)
            if(response.error != nil){
                if let data = response.value{
                    let json = JSON(data)
                    print(json)
                    completionHandler(json,response.response?.statusCode)
                    return
                }
            }else{
                completionHandler(nil,response.error?.localizedDescription)
            }
        }
    }
    
}
