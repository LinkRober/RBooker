//
//  RBUserService.swift
//  RBooker
//
//  Created by 夏敏 on 07/04/2017.
//  Copyright © 2017 夏敏. All rights reserved.
//

import UIKit

class RBUserService {
    
    static let shareService = RBUserService()
    
    
    func login(userName:String,passWord:String,complete:@escaping (String) -> ()) {
        
        var basicUrl = "http://localhost:8080"
        let model = "/login/"
        basicUrl = basicUrl.appending(model)
        let param = ["username":userName,"password":passWord]
        for key in param.keys {
            guard let value =  param[key] else {
                return
            }
            basicUrl.append("?" + key + "=" + value)
        }
        
        let url:URL = URL(string: "http://localhost:8080")!
        let session = URLSession.shared
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data,let _:URLResponse = response , error == nil else {
                print(error)
                return
            }
            
            let dataString = String.init(data: data, encoding: String.Encoding.utf8) ?? "error"
            complete(dataString)
        }
        task.resume()
    }
    
    
}
