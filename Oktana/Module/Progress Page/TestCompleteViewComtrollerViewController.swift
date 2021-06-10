//
//  TestCompleteViewComtrollerViewController.swift
//  Oktana
//
//  Created by Deven Nathanael on 10/06/21.
//

import UIKit

class TestCompleteViewComtrollerViewController: UIViewController {

    @IBOutlet weak var checklistImage: UIView!
    @IBOutlet weak var jumpJackView: LongMediumInfoCardView!
    @IBOutlet weak var pushUpView: MediumInfoCardView!
    @IBOutlet weak var sitUpView: MediumInfoCardView!
    @IBOutlet weak var squatView: LongMediumInfoCardView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configElements()
        // Do any additional setup after loading the view.
    }
    
    func configElements(){
        jumpJackView.cardTitleLabel.text = "Jumping Jack"
//        jumpJackView.cardIcon.image = UIImage(systemName: "stopwatch")
        jumpJackView.cardValueLabel.text = "20"
        jumpJackView.layer.cornerRadius = 8
        jumpJackView.clipsToBounds = true

        pushUpView.cardTitleLabel.text = "Push Up"
        //pushUpView.cardIcon.image = UIImage(systemName: "stopwatch")
        pushUpView.cardValueLabel.text = "20"
        pushUpView.layer.cornerRadius = 8
        pushUpView.clipsToBounds = true
        
        sitUpView.cardTitleLabel.text = "Sit Up"
//        sitUpView.cardIcon.image = UIImage(systemName: "stopwatch")
        sitUpView.cardValueLabel.text = "20"
        sitUpView.layer.cornerRadius = 8
        sitUpView.clipsToBounds = true
        
        //pushUpView.cardIcon.image = UIImage(systemName: "stopwatch")
        pushUpView.cardValueLabel.text = "20"
        pushUpView.layer.cornerRadius = 8
        pushUpView.clipsToBounds = true
        
        checklistImage.layer.cornerRadius = checklistImage.frame.size.width/2
        checklistImage.layer.borderColor = CGColor(red: 168/255, green: 221/255, blue: 76/255, alpha: 1)
        checklistImage.layer.borderWidth = 10
        doneButton.layer.cornerRadius = 15

    }

}
