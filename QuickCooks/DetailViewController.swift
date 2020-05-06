//
//  DetailViewController.swift
//  QuickCooks
//
//  Created by Jada Grant on 5/4/20.
//  Copyright © 2020 Jada Grant. All rights reserved.
//

import UIKit
import Parse

class DetailViewController: UIViewController {
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemQuantity: UILabel!
    
    var foodItem: PFObject!
    var name: String!
    var address: String!
    var quantity: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.itemName.text = foodItem["item"] as! String
        self.itemDescription.text = foodItem["description"] as! String
        self.itemPrice.text = foodItem["price"] as! String
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func minusQuantity(_ sender: Any) {
        
    }
    
    @IBAction func plusQuantity(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cartVC = segue.destination as! CartViewController
        cartVC.itemCart.append(foodItem)
        cartVC.name = name
        cartVC.address = address
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
