//
//  TableViewCell.swift
//  AlumniMgt
//
//  Created by Xperience 09 on 10/4/20.
//  Copyright © 2020 Xperience 09. All rights reserved.
//

import UIKit

var facultyName=""

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
    //facultyName=Name.text
    //@IBOutlet weak var Review: UILabel!
    //@IBOutlet weak var Rating: UILabel!
    
    
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
