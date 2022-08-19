//
//  LaunchTableCell.swift
//  SpaceX2
//
//  Created by Ernest Avagovich on 18.08.2022.
//

import UIKit

class LaunchTableCell: UITableViewCell {
    
    let url = ""

    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var launchNameLabel: UILabel!
    @IBOutlet weak var launchDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
