//
//  AdStatCell.swift
//  Dropspot
//
//  Created by Vincent Pilström Tipmung on 2022-10-19.
//

import UIKit

class AdStatCell: UITableViewCell {

    
    @IBOutlet var AdName:UILabel!
    @IBOutlet var AdImage:UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
