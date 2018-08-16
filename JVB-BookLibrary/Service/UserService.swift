//
//  UserService.swift
//  JVB-BookLibrary
//
//  Created by Admin on 8/2/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import Alamofire
class UserService {
    static let sharedInstance = UserService()
    private var manager: SessionManager
    
    private init() {
        self.manager = Alamofire.SessionManager.default
    }
    
   
}
