//
//  LastBoardingPageViewController.swift
//  Oktana
//
//  Created by Gratianus Martin on 15/06/21.
//

import UIKit

class LastBoardingPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButton(_ sender: Any) {
        CoreDataManager.shared.saveUser()
        let basicMovementID = [9, 10, 11, 12, 13, 14, 18, 19, 20, 21, 23, 24, 25]
        for i in basicMovementID{
            CoreDataManager.shared.addMovementtoUser(user: CoreDataManager.shared.fetchUser()!, movementID: i)
        }//nambahin basic move ke user
        if MovementQueue.demoMode == true{
            CoreDataManager.shared.updatePointUser(user: CoreDataManager.shared.fetchUser() ?? User(), point: 1000)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
