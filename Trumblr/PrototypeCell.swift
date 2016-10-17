//
//  PrototypeCell.swift
//  Trumblr
//
//  Created by Chenran Gong on 10/16/16.
//  Copyright © 2016 Chenran Gong. All rights reserved.
//

import UIKit

class PrototypeCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
