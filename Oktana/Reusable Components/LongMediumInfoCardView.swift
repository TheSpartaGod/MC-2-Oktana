//
//  LongMediumCardView.swift
//  Oktana
//
//  Created by Deven Nathanael on 09/06/21.
//

import UIKit

class LongMediumInfoCardView: UIView {

    
    @IBOutlet weak var cardIcon: UIImageView!
    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var cardValueLabel: UILabel!
    
    let nibName = "LongMediumInfoCardView"
    var contentView : UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
     
    }
    func commonInit(){
        
        guard let view = loadViewFromNib() else {return}
        view.frame = self.bounds
        self.addSubview(view)
        
    }
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
