//
//  LoginForm.swift
//  JVB-BookLibrary
//
//  Created by Admin on 8/2/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

struct LoginForm{
    let username:String
    let password:String
    var errorString:String?
    init(username:String, password:String) {
        self.username = username
        self.password = password
    }
    mutating func validate() -> Bool {
        if username.count == 0 {
            self.errorString = "Username is required."
            return false
        }
        
        if password.count < 6 {
            self.errorString = "Password must be greater than 6 characters."
            return false
        }
        
        return true
    }
}
