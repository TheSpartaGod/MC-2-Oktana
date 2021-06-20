//
//  TitleTableViewCell.swift
//  Oktana
//
//  Created by Gratianus Martin on 14/06/21.
//

import UIKit

protocol TitleTableViewCellDelegate {
    func takeTestButtonAction()
}

class TitleTableViewCell: UITableViewCell {
    
    var delegate: TitleTableViewCellDelegate?

    @IBOutlet weak var takeTestButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String? = "" {
        didSet {
            titleLabel.text = title
        }
    }
    var isTestButtonExist: Bool = true {
        didSet {
            takeTestButton.isHidden = isTestButtonExist
        }
    }
    
    
    @IBAction func takeTest(_ sender: Any) {
        print("button tapper")
        MovementQueue.queueFitnessList()
        delegate?.takeTestButtonAction()
        
          //start test
        
        
    }
    
    override func awakeFromNib() {
        cellInit()
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func cellInit(){
        takeTestButton.layer.cornerRadius = 5
    }
    
}
