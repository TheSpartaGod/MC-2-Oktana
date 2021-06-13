//
//  SkillTreeViewController.swift
//  Oktana
//
//  Created by Gratianus Martin on 10/06/21.
//

import UIKit

class SkillTreeViewController: UIViewController {
    
    
    
    @IBOutlet weak var move01: SkillTreeCustomView!
    @IBOutlet weak var move02: SkillTreeCustomView!
    @IBOutlet weak var move03: SkillTreeCustomView!
    @IBOutlet weak var move04: SkillTreeCustomView!
    @IBOutlet weak var move05: SkillTreeCustomView!
    @IBOutlet weak var move06: SkillTreeCustomView!
    @IBOutlet weak var move07: SkillTreeCustomView!
    @IBOutlet weak var move08: SkillTreeCustomView!
    
    
    
    var dummyData: [MovementGenerate] = [MovementGenerate(movementIDGenerate: "01", iconMovementGenerate: "skill-tree-icon", animationMovementGenerate: [AnimationGenerate(animationFrame: "")], namaMovementGenerate: "jumping jack", instructionsGenerate: [InstructionsGenerate(instructions: "")], calorieBurnGenerate: 200, costEPGenerate: 20)
    ]

    @IBOutlet weak var skill01: SkillTreeCustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let outletCollection: [SkillTreeCustomView] = [move01, move02, move03, move04, move05, move06, move07, move08]
        
        
        viewSetup(outlets: outletCollection)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func show(_ sender: Any) {
        AlertUnlockViewController.showAlert(from: self, title: "juduk", reqEP: 30)
        
    }
    
    func viewSetup(outlets: [SkillTreeCustomView]){
        
        for outlet in outlets {
            outlet.delegate = self
            outlet.setData(data: dummyData[0], color: #colorLiteral(red: 0.6620671749, green: 0.8666118979, blue: 0.297517091, alpha: 1))
        }
    }
}

extension SkillTreeViewController: SkillTreeCustomViewDelegate{
    func didUnlock(name: String, icon: UIImage) {
        AlertUnlockViewController.showAlert(from: self, title: "movementname", reqEP: 30)

    }
    
    
}
