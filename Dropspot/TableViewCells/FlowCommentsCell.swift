//
//  FlowCommentsCell.swift
//  Dropspot
//
//  Created by Vincent Pilström Tipmung on 2022-10-27.
//

import UIKit

class FlowCommentsCell: UITableViewCell {

    @IBOutlet weak var commentText: UILabel!
    
    
    @IBOutlet weak var commentImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
