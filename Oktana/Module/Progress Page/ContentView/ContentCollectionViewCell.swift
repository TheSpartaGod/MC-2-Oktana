//
//  CollectionViewCell.swift
//  Oktana
//
//  Created by Gratianus Martin on 14/06/21.
//

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var thisWeekDataLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setVisual()
    }
    
    private func setVisual(){
        view.layer.cornerRadius = 8
    }

}
