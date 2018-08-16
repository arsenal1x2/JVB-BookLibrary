//
//  Constant.swift
//  JVB-BookLibrary
//
//  Created by Admin on 8/2/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
struct Constant{
    struct API {
        static let URL = "http://pharma.hatoq.com:6666/LibraryAPI/"
        static let LOGIN = URL + "/user/login/"
        static let REGISTER = URL + "/user/register/"
    }
    struct FONTNAME {
        static let FUTURA = "Futura"
    }
}
enum Icon:String{
    case CHECKED = "icons8-tick-box"
    case UNCHECKED = "icons8-unchecked-checkbox-filled"
}
