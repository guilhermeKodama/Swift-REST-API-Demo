//
//  Product.swift
//  RestAPIDemo
//
//  Created by Guilherme Kenji Kodama on 10/08/15.
//  Copyright © 2015 Guilherme Kenji Kodama. All rights reserved.
//

import Foundation
class Product {
    
    var id = String()
    var name = String()
    
    init(){}
    
    init(id:String,name:String){
        self.id = id
        self.name = name
    }
    
}