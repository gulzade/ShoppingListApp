//
//  AddProductViewController.swift
//  PassDataBetweenVC
//
//  Created by Gülzade Karataş on 11.09.2022.
//

import UIKit


protocol AddProductDelegate {  //custom protocol for product passing
    func addProduct(product: Product)
        
    
}

class AddProductViewController: UIViewController {

    @IBOutlet weak var plantName: UITextField!
    @IBOutlet weak var plantWeight: UITextField!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    
    var delegate: AddProductDelegate? = nil // Delegate variable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Recognizers
        
        productImageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        productImageView.addGestureRecognizer(imageTapRecognizer)
        
        backgroundView.layer.cornerRadius = 40
    }
 
    @objc func selectImage (){
        let picker = UIImagePickerController()
                picker.delegate = self
                picker.sourceType = .photoLibrary
                picker.allowsEditing = true
                present(picker, animated: true, completion: nil)
    }
    
    @IBAction func addProduct(_ sender: Any) {
        if self.delegate != nil && self.plantName.text != nil &&  self.plantWeight.text != nil { //Check if the delegate is not nil. If the delegate is nil then that means its not yet authorized to use this function to send data.
        if let planetName = plantName.text, let plantWeight = plantWeight.text {
            let product = Product(productName: planetName, productWeight: plantWeight, productImage: productImageView.image! )
            delegate?.addProduct(product: product) //We pass the data to our delegate which in turn uses the function to pass it to another view controller. 
            print(product.productName!, product.productWeight!)
          
        }
    }
        // create the alert
               let alert = UIAlertController(title: "Successful", message: "Profduct added!", preferredStyle: UIAlertController.Style.alert)

               // add the actions
               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

               // show the alert
               self.present(alert, animated: true, completion: nil)
        
        plantName.text = ""
        plantWeight.text = ""
    }
    
}

extension AddProductViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        productImageView.image = image
    }
}
