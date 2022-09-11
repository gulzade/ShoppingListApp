//
//  Product.swift
//  PassDataBetweenVC
//
//  Created by Gülzade Karataş on 11.09.2022.
//

import Foundation
import UIKit

class Product { // Creat custom object
    
    var productName:String?
    var productWeight:String?
    var productImage : UIImage?
    
    init(productName: String, productWeight: String , productImage: UIImage) {
        self.productName = productName
        self.productWeight = productWeight
        self.productImage = productImage
    }
}
