//
//  HowToTableViewCell.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 09/06/21.
//

import UIKit

class HowToTableViewCell: UITableViewCell {

    @IBOutlet weak var stepDescription: UITextView!
    @IBOutlet weak var stepNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
