//
//  CartViewController.swift
//  QuickCooks
//
//  Created by Jada Grant on 5/4/20.
//  Copyright © 2020 Jada Grant. All rights reserved.
//

import UIKit
import Parse
class CartViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var chefName: UILabel!
    @IBOutlet weak var chefAddress: UILabel!
    @IBOutlet weak var table: UITableView!
    
    var itemCart = [PFObject]()
    var firstItem: PFObject!
    var name: String!
    var address: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.chefName.text = name
        self.chefAddress.text = address
        
        table.delegate = self
        table.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCart.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemCart[indexPath.section]
        let cell = table.dequeueReusableCell(withIdentifier: "CartTableViewCell") as! CartTableViewCell
        
        cell.itemName.text = item["item"] as? String
        cell.itemPrice.text = "$\(item["price"] as! String)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            itemCart.remove(at: indexPath.row)
            table.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func placeOrder(_ sender: Any) {
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
