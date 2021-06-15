//
//  AlertViewController.swift
//  Oktana
//
//  Created by Gratianus Martin on 11/06/21.
//

import UIKit

class AlertUnlockViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var polygon: UIImageView!
    @IBOutlet weak var movementIcon: UIImageView!
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var alertMessage: UILabel!
    @IBOutlet weak var positiveButton: UIButton!
    @IBOutlet weak var negativeButton: UIButton!
    
    
    var titleText: String = ""
    var messageText: String = ""
    var requiredEP: Int = 0
    var icon: UIImage? = nil
    var positiveText: String? = ""
    var negativeText: String? = ""
    var positiveCompletion: (() -> Void)?
    var negativeCompletion: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    @IBAction func positiveActionHandler(_ sender: Any) {
        dismiss(animated: true) {
            [weak self] in
            self?.positiveCompletion?()
        }
    }
    
    @IBAction func negativeActionHandler(_ sender: Any) {
        dismiss(animated: true) {
            [weak self] in
            self?.negativeCompletion?()
        }
    }
}

extension AlertUnlockViewController {
    func bindView() {
        alertTitle.text = titleText
        alertMessage.text = "Do you want to unlock this movement for \(requiredEP)⚡️"
        
        if let icon = icon {
            movementIcon.image = icon
        }
        
        contentView.layer.cornerRadius = 10
        positiveButton.layer.cornerRadius = 10
        negativeButton.layer.cornerRadius = 10
        
    }
    
    static func showAlert(from viewController: UIViewController, title: String, reqEP: Int, image: UIImage? = nil, positiveAction: (() -> Void)? = nil){
        let controller = AlertUnlockViewController.init(nibName: "AlertUnlockViewController", bundle: nil)
        
        controller.titleText = title
        controller.requiredEP = reqEP
        controller.icon = image
        controller.positiveCompletion = positiveAction
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        controller.hidesBottomBarWhenPushed = true
        viewController.navigationController?.modalPresentationStyle = .overCurrentContext
        viewController.present(controller, animated: true, completion: nil)
    }
}
