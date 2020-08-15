//
//  userList.swift
//  GithubDemoApp
//
//  Created by Nitin Auti on 03/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation

/// Precheckout data struct, holds the card and shipping address of the user
/// Product Object, handles the product basic properties

class userList : NSObject, NSCoding {
   
    
    // MARK: Variables
    
    /// list identifier
    var list =  NSArray()
    
    /// Singleton instance
    static let sharedInstance : userList = {

      if let instance = userList().getUserData(){
             return instance
         }
         return userList()
      }()

    //MARK: Initializers
    /// Base Initializer
    override init() {
        super.init()
    }
    
   
    //MARK: NSCoding
    
    /// NSCoding Initializer
    ///
    /// - Parameters:
    ///   - coder: NSCoder instance
    required init(coder aDecoder: NSCoder) {
        self.list = aDecoder.decodeObject(forKey:"list") as? NSArray ?? []
          
    }
    
    /// NSCoding Method
    ///
    /// - Parameter aCoder: NSCoder instance
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.list, forKey: "list")
    }
    
    
    func saveUserData(){
           do {
           try UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: userList.sharedInstance, requiringSecureCoding: false), forKey: "userList")
           } catch {
           print("Can't encode data: \(error)")
        }
    }

           /// get data
          
    func getUserData() -> userList? {
       let ud = UserDefaults.standard
      
     if let decodedNSData = ud.object(forKey:"userList") as? NSData{
     do {
        if let user =  try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decodedNSData as Data) as? userList {
           return user
         }
       }catch{
       fatalError("Can't decode data: \(error)")
         }
        }
       return nil
    }

}
