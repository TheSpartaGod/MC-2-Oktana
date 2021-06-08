//
//  MediumInfoCardView.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 08/06/21.
//

import UIKit

class MediumInfoCardView: UIView {

    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var cardIcon: UIImageView!
    @IBOutlet weak var cardValueLabel: UILabel!
    @IBOutlet weak var cardUnitLabel: UILabel!
    
    let nibName = "MediumInfoCardView"
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
    
    /*\
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
