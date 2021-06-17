//
//  StreakPointView.swift
//  Oktana
//
//  Created by Gratianus Martin on 13/06/21.
//

import UIKit

class StreakPointView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var totalStreakLabel: UILabel!
    @IBOutlet weak var totalPointLabel: UILabel!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("StreakPointView", owner: self, options: nil)
        
        contentView.layer.cornerRadius = 5
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.frame = self.bounds
        addSubview(contentView)
        
    }
    
    func setData(user: User){
        totalStreakLabel.text = "\(user.total_streaks) days"
        totalPointLabel.text = "\(user.energy_points)"
    }
    
    

}
