//
//  ListCell.swift
//  RelamDemo
//
//  Created by Rohit Gupta on 17/02/20.
//  Copyright © 2020 Sahabe Alam. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var lable1: UILabel!
    @IBOutlet weak var lable2: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
