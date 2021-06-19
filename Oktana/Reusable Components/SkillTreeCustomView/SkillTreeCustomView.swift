//
//  SkillTreeCustomView.swift
//  Oktana
//
//  Created by Gratianus Martin on 10/06/21.
//

import UIKit

protocol SkillTreeCustomViewDelegate {
    func didUnlock(data: MovementGenerate, _ sender: SkillTreeCustomView)
}

class SkillTreeCustomView: UIView {
    
    var delegate: SkillTreeCustomViewDelegate?
    
    var movementData: MovementGenerate?

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
        
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView(_:))))
        
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.frame = self.bounds
        addSubview(contentView)
        
    }
    
    @objc private func didTapView(_ sender: UITapGestureRecognizer){
        print("view tapped")
        guard let data = movementData else {
            print("no-data on the view")
            return
        }
        delegate?.didUnlock(data: data, self)

    }
    
    func setData(data: MovementGenerate, color: UIColor, iconColor: UIColor, icon: UIImage){
        
        movementData = data
        
        if let icon = UIImage(named: data.iconMovementGenerate){
            movementIcon.image = icon
        }
        movementName.text = data.namaMovementGenerate
        polygon.tintColor = color
        movementIcon.tintColor = iconColor
        movementIcon.image = icon
    }
}
