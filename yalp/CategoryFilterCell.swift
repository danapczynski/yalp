//
//  FilterCell.swift
//  yalp
//
//  Created by Daniel Apczynski on 2/14/15.
//  Copyright (c) 2015 Dan Apczynski. All rights reserved.
//

import UIKit

protocol CategoryFilterCellDelegate : class {
    func categoryFilterCell(categoryFilterCell: CategoryFilterCell, didChangeSwitchValue value: Bool)
}

class CategoryFilterCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categorySwitch: UISwitch!
    weak var delegate: CategoryFilterCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        categorySwitch.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func switchValueChanged(){
        delegate?.categoryFilterCell(self, didChangeSwitchValue: categorySwitch.on)
    }

}
 