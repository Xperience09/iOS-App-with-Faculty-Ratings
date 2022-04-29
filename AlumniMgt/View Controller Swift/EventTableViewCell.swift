
//
//  EventTableViewCell.swift
//  AlumniMgt
//
//  Created by Xperience 09 on 10/5/20.
//  Copyright © 2020 Xperience 09. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Details: UILabel!
    @IBOutlet weak var Time: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
