//
//  Book.swift
//  JVB-BookLibrary
//
//  Created by Admin on 8/2/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class Book {
    var id:NSNumber!
    var name:String!
    var author:String!
    var categories:String!
    var language:String!
    var pageNumber:NSNumber!
    var amount:NSNumber!
    var price:NSNumber!
    var descrip:String!
    var image:String!
    var status:Int!
    var deleted:Int!
    var updated:String!
    var created:String!
    init?(data:NSDictionary?) {
        guard let data = data else {return nil}
        self.id = data["id"] as! NSNumber
        self.name = data["name"] as! String
        self.author = data["author"] as! String
        self.categories = data["type_id"] as! String
        self.language = data["language"] as! String
        self.pageNumber = data["page_number"] as! NSNumber
        self.amount = data["amount"] as! NSNumber
        self.price = data["price"] as! NSNumber
        self.descrip = data["description"] as! String
        if let image = data["image"] as? String {
            self.image = image
        }else{
            self.image = "Dac-nhan-tam"
        }
        self.status = data["status"] as! Int
        self.deleted = data["deleted"] as! Int
        self.updated = data["updated"] as! String
        self.created = data["created"] as! String
    }
}
