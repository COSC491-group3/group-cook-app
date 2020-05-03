//
//  MenuItemTableViewCell.swift
//  QuickCooks
//
//  Created by Jada Grant on 5/1/20.
//  Copyright © 2020 Jada Grant. All rights reserved.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {

    @IBOutlet weak var menuItem: UILabel!
    @IBOutlet weak var itemDesription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
