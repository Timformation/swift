//
//  FullNameTableViewCell.swift
//  PlayGround
//
//  Created by Timothy Sirchuk on 5/25/17.
//  Copyright © 2017 TIMOTHY SIRCHUK. All rights reserved.
//

import UIKit

class FullNameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var firstNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
