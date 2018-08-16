//
//  User.swift
//  JVB-BookLibrary
//
//  Created by Admin on 8/2/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
class User{
    var id:NSNumber!
    var username:String!
    var password:String!
    var name:String!
    var email:String!
    var token:String!
    init(id:NSNumber,username:String,password:String,name:String,email:String) {
        self.id = id
        self.username = username
        self.password = password
        self.name = name
        self.email = email
    }
    init?(data:NSDictionary?) {
        guard let data = data else{return nil}
        self.id = data["id"] as! NSNumber
        self.email = data["mail"] as! String
        self.name = data["name"] as! String
        self.password = data["password"] as! String
        self.token = data["token"] as! String
        self.username = data["username"] as! String
        
    }
    func changePassword(password: String) -> (success:Bool,meesage:String) {
        return (true,"Password is Changed")
    }
}
