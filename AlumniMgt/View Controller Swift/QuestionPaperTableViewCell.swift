//
//  QuestionPaperTableViewCell.swift
//  AlumniMgt
//
//  Created by Xperience 09 on 10/24/20.
//  Copyright © 2020 Xperience 09. All rights reserved.
//

import UIKit

class QuestionPaperTableViewCell: UITableViewCell {
    @IBOutlet weak var QuestionPaper: UIImageView!
    var subj = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
