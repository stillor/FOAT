//
//  DetailTableViewCell.swift
//  FOAT
//
//  Created by stiller on 15/12/7.
//  Copyright © 2015年 stiller. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet var info:UILabel?
    @IBOutlet var title:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
