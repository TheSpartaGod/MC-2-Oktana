//
//  focusedView.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 11/06/21.
//

import UIKit

class FocusedView: UIView {
   
    @IBOutlet weak var dimmedBackground: UIView!
    @IBOutlet weak var focusedBackground: UIView!
    @IBOutlet var lowerButton: UIButton!
    @IBOutlet var entryTextField: UITextField!
    @IBOutlet var activityTitle: UILabel!
    @IBOutlet var activityImageView: UIImageView!
    @IBOutlet var focusMessage: UITextView!
    @IBOutlet var upperButton: UIButton!
    var viewModeKey : String!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
    }
    //Custom initializer
    init(frame: CGRect, viewMode: String, activityTitleText: String, focusMessageText : String, activityImage: UIImage) {
        super.init(frame:frame)
        commonInit(viewMode: viewMode, activityTitleText: activityTitleText, focusMessageText: focusMessageText, activityImage: activityImage)
    }
    
    @IBAction func unlockSkillButtonPressed(_ sender: Any) {
        //UNLOCK SKILL HERE
        print("unlockSKill")
    }
    @IBAction func bottomButtonPressed(_ sender: Any) {
        //bottom button is based on what view mode it is
        switch viewModeKey {
        case "TestEntry":
            //submit test data
        print("data submit")
            
        case "SkillTree":
            //cancel skill tree purchase
        print("canceled skill tree purchase")
            
        default:
            print("You didn't set the correct view mode key.")
        }
    }
    
    
    func commonInit(viewMode: String, activityTitleText: String, focusMessageText: String, activityImage: UIImage){
        //initialize view
        viewModeKey = viewMode
        activityTitle.text = activityTitleText
        focusMessage.text = focusMessageText
        activityImageView.image = activityImage
        focusedBackground.layer.cornerRadius = 15
        
        //initialize view elements based on view mode, skill tree or text entry, gua buat switch biar bisa dipake buat view lagi yg laen
        switch(viewMode){
        case "TestEntry":
            upperButton.isHidden = true
            lowerButton.backgroundColor = UIColor(red: 0.66, green: 0.87, blue: 0.30, alpha: 1.00)
            lowerButton.titleLabel?.text = "Submit"
            
        case "SkillTree":
            entryTextField.isHidden = true
            upperButton.layer.cornerRadius = 10
            lowerButton.layer.cornerRadius = 10
            
        default: print("Error: you didn't put the correct key for the view mode")
        }
        
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
