//
//  ViewController.swift
//  PassDataBetweenVC
//
//  Created by Gülzade Karataş on 10.09.2022.
//

import UIKit

class ShoppingList: UIViewController, AddProductDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var shoppingList = [Product]() // create product list
    var product:Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
        
    }
    
    func addProduct(product: Product) {
        
        self.shoppingList.append(product) // we add products to our shopping list
        DispatchQueue.main.async {
            self.tableView.reloadData() //reload tableview
        }
        print("Product name: \(product.productName! )  Product weight: \(product.productWeight!)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddProduct" {
            let secondVC: AddProductViewController = segue.destination as! AddProductViewController
            secondVC.delegate = self
           
        }
    }
}



extension ShoppingList :  UITableViewDelegate, UITableViewDataSource {
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let plant = shoppingList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ShoppingListTableViewCell
        cell.productNameTextField.text = plant.productName!
        cell.productWeight.text = plant.productWeight!
        cell.productImageView.image = plant.productImage!
        print(plant.productName!,plant.productWeight!)
        
        return cell
    }
    
    
}


