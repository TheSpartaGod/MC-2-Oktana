//
//  AlertStandardViewController.swift
//  Oktana
//
//  Created by Gratianus Martin on 11/06/21.
//

import UIKit

class AlertStandardViewController: UIViewController {
    
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var positiveButton: UIButton!
    @IBOutlet weak var negativeButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    var titleText: String = ""
    var messageText: String = ""
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



extension AlertStandardViewController{
    func bindView() {
        titleLabel.text = titleText
        messageLabel.text = messageText
        positiveButton.setTitle(positiveText, for: .normal)
        
        
        contentView.layer.cornerRadius = 10
        positiveButton.layer.cornerRadius = 10
        negativeButton.layer.cornerRadius = 10
    }
    
    static func showAlert(from viewController: UIViewController, title: String, message: String, positiveMessage: String? = nil, positiveAction: (() -> Void)? = nil){
        let controller = AlertStandardViewController.init(nibName: "AlertStandardViewController", bundle: nil)
        
        controller.titleText = title
        controller.messageText = message
        controller.positiveText = positiveMessage
        controller.positiveCompletion = positiveAction
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        controller.hidesBottomBarWhenPushed = true
        
        
        viewController.navigationController?.modalPresentationStyle = .overCurrentContext
        viewController.present(controller, animated: true, completion: nil)
    }
}
