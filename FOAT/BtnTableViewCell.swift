//
//  BtnTableViewCell.swift
//  FOAT
//
//  Created by stiller on 15/12/9.
//  Copyright © 2015年 stiller. All rights reserved.
//

import UIKit

class BtnTableViewCell: UITableViewCell {
    
    @IBOutlet var btn:UILabel?
    @IBOutlet var img:UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
