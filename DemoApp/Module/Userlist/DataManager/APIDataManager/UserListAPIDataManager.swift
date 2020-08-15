//
//  UserListListAPIDataManager.swift
//  MoovetShop
//
//  Created by Nitin Auti on 27/07/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import Alamofire

/// UserListAPIDataManager implements the UserListAPIDataManagerProtocol protocol, if data needs to be saved/retrieved from the server, all the implentation should be done here
class UserListAPIDataManager:UserListAPIDataManagerProtocol {
   
        
    /// Makes an removeAddressItemFromList against networkingService
    ///
    ///  - completionHandler: block of code to execute after networkingService response
    func getUserList(completionHandler: @escaping (NSDictionary?, Error?) -> ()) {
   
      Alamofire.request(Constants.APIRoutes.getProducts,method:.get,parameters:nil,encoding:JSONEncoding.default ,headers:nil).responseJSON { response in
            
        var responseDict = Dictionary<String,Any>()
      
        switch response.result {
        case .success(let JSON):
                responseDict["status"] = (JSON as? Dictionary<String,Any> ?? [:])["status"] ?? Constants.status.OK
                responseDict["data"] = JSON as Any
                completionHandler(responseDict as NSDictionary, nil)
     
        case .failure(let error):
            responseDict["status"] =  Constants.status.NOK
            responseDict["data"] = NSNull()
            completionHandler(responseDict as NSDictionary, error)
         }
        }
       }
    
}
    

