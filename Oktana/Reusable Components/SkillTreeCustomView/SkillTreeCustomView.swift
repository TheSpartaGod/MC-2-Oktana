//
//  SkillTreeCustomView.swift
//  Oktana
//
//  Created by Gratianus Martin on 10/06/21.
//

import UIKit

class SkillTreeCustomView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var polygon: UIImageView!
    @IBOutlet weak var movementIcon: UIImageView!
    @IBOutlet weak var movementName: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SkillTreeCustomView", owner: self, options: nil)
        
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.frame = self.bounds
        addSubview(contentView)
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
