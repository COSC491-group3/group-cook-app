//
//  MenuViewController.swift
//  QuickCooks
//
//  Created by Jada Grant on 4/26/20.
//  Copyright © 2020 Jada Grant. All rights reserved.
//

import UIKit
import Parse

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chefName: UILabel!
    @IBOutlet weak var chefCuisine: UILabel!
    @IBOutlet weak var chefAddress: UILabel!
    
    var chefSelected: PFObject?
    var chefMenuItems = [PFObject]()
    var name: String!
    var address: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MENU VC")
        self.chefName.text = name
        self.chefAddress.text = address
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        let query = PFQuery(className: "Menu")
        query.whereKey("chef", equalTo: chefSelected!)
        query.findObjectsInBackground { (menuItems, error) in
            if menuItems != nil{
                self.chefMenuItems = menuItems!
                self.tableView.reloadData()
                print(self.chefMenuItems)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(chefMenuItems.count)
        return chefMenuItems.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = chefMenuItems[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemTableViewCell") as! MenuItemTableViewCell
        
        cell.menuItem.text = item["item"] as? String
        cell.itemPrice.text = "$\(item["price"] as? String)"
        return cell
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
