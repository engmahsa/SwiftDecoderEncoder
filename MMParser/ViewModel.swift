//
//  ViewModel.swift
//  MMParser
//
//  Created by Mahsa Mo on 5/8/1399 AP.
//  Copyright © 1399 Mahsa Mo. All rights reserved.
//

import Foundation

protocol ViewModelProtocol {
    func DataReceived(result: Any)
}

struct ViewModel {
    var viewModelMDelegate: ViewModelProtocol?
    let networkManager = NetworkManager.sharedInstance
    let baseRq = BaseRequest.init()
    
    
    func getCountryByCode(code:String) {
        
        let url = String(format: "%@%@",  AppConstants.countryByCodeURL,code)
        let request = NSMutableURLRequest(url: NSURL(string:url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = baseRq.defaultRequestHeaders()
        networkManager.startDownloadTask(request: request as URLRequest) { (data) in
            self.viewModelMDelegate?.DataReceived(result: data)
        }
    }
    
}
