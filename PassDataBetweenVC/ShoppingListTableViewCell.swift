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
     
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
