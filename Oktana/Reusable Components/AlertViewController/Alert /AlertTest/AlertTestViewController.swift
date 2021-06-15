//
//  AlertTestViewController.swift
//  Oktana
//
//  Created by Gratianus Martin on 11/06/21.
//

import UIKit

class AlertTestViewController: UIViewController {
    
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var movementTitleLabel: UILabel!
    @IBOutlet weak var totalRepetition: UITextField!
    @IBOutlet weak var positiveButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    
    var titleText: String = ""
    var messageText: String = ""
    var icon: UIImage? = nil
    var positiveText: String? = ""
    var positiveCompletion: ((_ text: String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    @IBAction func positiveActionHandler(_ sender: Any) {
        dismiss(animated: true) {
            [weak self] in
            self?.positiveCompletion?(self?.totalRepetition.text ?? "no repetition data")
        }
    }
}

extension AlertTestViewController{
    func bindView() {
        movementTitleLabel.text = titleText
        iconImage.image = icon
        contentView.layer.cornerRadius = 10
        positiveButton.layer.cornerRadius = 10
    }
    
    static func showAlert(from viewController: UIViewController, movementTitle: String, image: UIImage? = nil, positiveAction: ((_ text: String) -> Void)? = nil){
        let controller = AlertTestViewController.init(nibName: "AlertTestViewController", bundle: nil)
        
        controller.titleText = movementTitle
        controller.icon = image
        controller.positiveCompletion = positiveAction
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        controller.hidesBottomBarWhenPushed = true
        
        viewController.navigationController?.modalPresentationStyle = .overCurrentContext
        viewController.present(controller, animated: true, completion: nil)
    }
}
