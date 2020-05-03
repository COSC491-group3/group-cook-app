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
    var chefSelected = PFObject(className: "Chefs")
    var menuItems = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        print(chefSelected)
        let query = PFQuery(className: "Menu")
        query.findObjectsInBackground { (menuItems, error) in
            if menuItems != nil{
                self.menuItems = menuItems!
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(menuItems.count);
        return menuItems.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = menuItems[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemTableViewCell") as! MenuItemTableViewCell
        
        cell.menuItem.text = item["item"] as? String
        cell.itemDesription.text = item["description"] as? String
        cell.itemPrice.text = item["price"] as? String
        
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
