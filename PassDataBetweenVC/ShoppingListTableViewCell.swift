//
//  ShoppingListTableViewCell.swift
//  PassDataBetweenVC
//
//  Created by Gülzade Karataş on 11.09.2022.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameTextField: UILabel!
    @IBOutlet weak var productWeight: UILabel!
    
    var shoppingProduct:Product?
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView?.layer.cornerRadius = 40
        imageView?.layer.borderColor = UIColor.yellow.cgColor
        imageView?.layer.borderWidth = 3.0
        imageView?.layer.borderColor = UIColor.gray.cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
