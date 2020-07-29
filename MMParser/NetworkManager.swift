//
//  NetworkManager.swift
//  MMParser
//
//  Created by Mahsa Mo on 5/6/1399 AP.
//  Copyright © 1399 Mahsa Mo. All rights reserved.
//

import Foundation

class NetworkManager:BaseRequest{
    
    static let sharedInstance = NetworkManager()
    let mapper = Mapper.init()
    func startDownloadTask(request:URLRequest ,completion: @escaping (_ data: Any?) -> Void) {
        
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error ?? "try again")
            } else {
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
                let result = self.mapper.mapp(jsString: responseString as! String)
                completion(result)
            }
        })
        
        dataTask.resume()
    }
}











class BaseRequest  {
    
    init() {
        
    }
    func defaultRequestHeaders() -> [String: String] {
        let headers = [
            "x-rapidapi-host": "restcountries-v1.p.rapidapi.com",
            "x-rapidapi-key": "432d4e5b88msh307290e7ce97588p1fff49jsnf41765bb8e44"
        ]
        return headers
    }
}
