//
//  MovementDetailTableViewCell.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 08/06/21.
//

import UIKit

class MovementDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var moveNameLabel: UILabel!
    @IBOutlet weak var moveIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
