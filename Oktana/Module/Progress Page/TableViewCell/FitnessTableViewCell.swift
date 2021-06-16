//
//  FitnessTableViewCell.swift
//  Oktana
//
//  Created by Gratianus Martin on 15/06/21.
//

import UIKit

class FitnessTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var currentTest: UIProgressView!
    @IBOutlet weak var previousTest: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initVisual()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func initVisual(){
        //currentTest.transform = currentTest.transform.scaledBy(x: 1, y: 5)
        //previousTest.transform = previousTest.transform.scaledBy(x: 1, y: 5)
        view.layer.cornerRadius = 8
    }
    
}
