//
//  YalpTableViewCell.swift
//  yalp
//
//  Created by Daniel Apczynski on 2/10/15.
//  Copyright (c) 2015 Dan Apczynski. All rights reserved.
//

import UIKit

class YalpTableViewCell: UITableViewCell {

    @IBOutlet weak var resultNameLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultRatingImage: UIImageView!
    @IBOutlet weak var reviewsCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
