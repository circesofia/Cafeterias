//
//  item.swift
//  Cafeterias
//
//  Created by erick eduardo on 05/08/21.
//

import Foundation
import FirebaseStorage
import FirebaseStorageUI
class product{
    var name: String
    var price: Int
    var image: String
    init(name: String, price: Int, image:String) {
        self.name = name
        self.price = price
        self.image = image
    }
}
