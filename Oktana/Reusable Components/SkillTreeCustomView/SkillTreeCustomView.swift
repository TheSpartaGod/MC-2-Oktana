//
//  SkillTreeCustomView.swift
//  Oktana
//
//  Created by Gratianus Martin on 10/06/21.
//

import UIKit

protocol SkillTreeCustomViewDelegate {
    func didUnlock(name: String, icon: UIImage)
}

class SkillTreeCustomView: UIView {
    
    var delegate: SkillTreeCustomViewDelegate?
    

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
        guard let nameData = movementName.text, let iconData = movementIcon.image else {
            print("no-data on the view")
            return
        }
        delegate?.didUnlock(name: nameData, icon: iconData)

    }
    
    func setData(data: MovementGenerate){
        
        if let icon = UIImage(named: data.iconMovementGenerate){
            movementIcon.image = icon
        }
        movementName.text = data.namaMovementGenerate
        polygon.tintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    }

}
