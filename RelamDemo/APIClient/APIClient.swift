//
//  APIClient.swift
//  RelamDemo
//
//  Created by Rohit Gupta on 26/02/20.
//  Copyright © 2020 Sahabe Alam. All rights reserved.
//

//import Foundation
import Alamofire

class APIClient{
    static func getSurveyList(urlString:String,completion:@escaping (SurveyList?)->Void){
        APIClient.callAPI(urlString: urlString, method: .get, param: nil) { (response) in
//              let responseData:NSData = response.data as NSData? ?? NSData()
    //          UserDefaultManager.saveProjectListData(listData: responseData)
                if let responseData = response.data{
                    let decoder = JSONDecoder()
                    do{
                        let jsondata = try decoder.decode(SurveyList.self, from: responseData)
                        completion(jsondata)
                    }
                    catch{
                        print("Error info: \(error)")
                        completion(nil)
                    }
                }
                else{
                 completion(nil)
            }
        }
    }
    
    static func callAPI (urlString:String,method:HTTPMethod,param:[String:String]?,completion:@escaping (AFDataResponse<Any>)->Void){
        let tokStr:String? = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjM1LCJpYXQiOjE1ODMzMTUzNzMsImV4cCI6MTU4MzQwMTc3M30.75RrwDuBuMqTWuKMHxNPNRwrb62yi9hsQHOt3yWdshs"
        if let url = URL(string: urlString) {
        if let params = param {
            
            var headers:HTTPHeaders? //= [String:String]?
            if(!url.absoluteString.contains("login")){
                guard let token = tokStr else{
                    return
                }
                print(token)
                headers = [
                    "x-access-token": token,
                    ]
            }
            AF.request(url.absoluteURL.absoluteString, method: method, parameters: params, encoding: JSONEncoding.default,headers: headers)
                .responseJSON { response in
                    completion(response)
                    
            }
        }
        else{
            guard let token = tokStr else{
                return
            }
            print(token)
            let headers:HTTPHeaders = [
                "x-access-token": token,
            ]
            AF.request(urlString, method: method, parameters: nil, encoding: JSONEncoding.default,headers: headers)
                .responseJSON { response in
                    completion(response)
                    
            }
        }
        
    }
    }
    
}
