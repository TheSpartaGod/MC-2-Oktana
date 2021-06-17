//
//  SkillTreeViewController.swift
//  Oktana
//
//  Created by Gratianus Martin on 10/06/21.
//

import UIKit
import youtue

class SkillTreeViewController: UIViewController {
    
    let movementData = Movements().data
    let userMovement = CoreDataManager.shared.fetchAvailableMovement()
    var skillTreeMovement: [MovementGenerate]? = nil
    
    @IBOutlet weak var move01: SkillTreeCustomView!
    @IBOutlet weak var move02: SkillTreeCustomView!
    @IBOutlet weak var move03: SkillTreeCustomView!
    @IBOutlet weak var move04: SkillTreeCustomView!
    @IBOutlet weak var move05: SkillTreeCustomView!
    @IBOutlet weak var move06: SkillTreeCustomView!
    @IBOutlet weak var move07: SkillTreeCustomView!
    @IBOutlet weak var move08: SkillTreeCustomView!
    @IBOutlet weak var userData: StreakPointView!
    
    
    var dummyData: [MovementGenerate] = [MovementGenerate(movementIDGenerate: 4, category: 1, iconMovementGenerate: "skill-tree-icon", animationMovementGenerate: [AnimationGenerate(animationFrame: "")], namaMovementGenerate: "jumping jack", instructionsGenerate: [InstructionsGenerate(instructions: "")], calorieBurnGenerate: 200, costEPGenerate: 20)
    ]

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let outletCollection: [SkillTreeCustomView] = [move01, move02, move03, move04, move05, move06, move07, move08]
        
        
        viewSetup(outlets: outletCollection)
        
        userPointView()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func show(_ sender: Any) {
        AlertUnlockViewController.showAlert(from: self, title: "juduk", reqEP: 30)
        
    }
    
    func viewSetup(outlets: [SkillTreeCustomView]){
        
        
        if let unlockedMovement = userMovement {
            for x in 0...7 {
                outlets[x].delegate = self
                outlets[x].setData(data: movementData[x], color: #colorLiteral(red: 0.2548763454, green: 0.2549183369, blue: 0.2548671067, alpha: 1), iconColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), icon: UIImage(named: "skill-tree-locked")!)
                for unlocked in unlockedMovement {
                    if unlocked.movementId == movementData[x].movementIDGenerate{
                        outlets[x].setData(data: movementData[x], color: #colorLiteral(red: 0.656878829, green: 0.8667349219, blue: 0.2977412045, alpha: 1), iconColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), icon: UIImage(named: "\(movementData[x].iconMovementGenerate)")!)
                    }
                }
            }
        }
    }
    
    func userPointView(){
        guard let user = CoreDataManager.shared.fetchUser() else {
            return
        }
        userData.setData(user: user)
        
    }
}

extension SkillTreeViewController: SkillTreeCustomViewDelegate{
    func didUnlock(data: MovementGenerate) {
        guard let user = CoreDataManager.shared.fetchUser() else {
            return
        }
        AlertUnlockViewController.showAlert(from: self, title: data.namaMovementGenerate, reqEP: data.costEPGenerate, image: nil) {
            guard let user = CoreDataManager.shared.fetchUser() else {
                return
            }
            
            var currentPoint = Int(user.energy_points)
            if currentPoint >  data.costEPGenerate {
                currentPoint = currentPoint - data.costEPGenerate
                CoreDataManager.shared.addMovementtoUser(user: user, movementID: data.movementIDGenerate)
                CoreDataManager.shared.updatePointUser(user: user, point: currentPoint)
            } else {
                print("point tidak cukup")
            }
            
    }
    }
    
    
}
