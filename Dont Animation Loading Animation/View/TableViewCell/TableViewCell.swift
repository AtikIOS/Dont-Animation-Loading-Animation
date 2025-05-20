//
//  TableViewCell.swift
//  Dont Animation Loading Animation
//
//  Created by Atik Hasan on 5/20/25.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblAnimationName : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
