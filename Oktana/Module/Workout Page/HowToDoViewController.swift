//
//  HowToDoViewController.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 09/06/21.
//

import UIKit

class HowToDoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  

    @IBOutlet weak var howToStepsTableView: UITableView!
    @IBOutlet weak var howToImage: UIImageView!
    @IBOutlet weak var movementTitle: UILabel!
    var selectedRow : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        movementTitle.text = MovementQueue.MovementList.data[selectedRow-1].namaMovementGenerate
        howToStepsTableView.delegate = self
        howToStepsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovementQueue.MovementList.data[selectedRow-1].instructionsGenerate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = howToStepsTableView.dequeueReusableCell(withIdentifier: "HowToTableViewCell") as! HowToTableViewCell
        cell.stepDescription.text = MovementQueue.MovementList.data[selectedRow-1].instructionsGenerate[indexPath.row].instructions
        cell.stepNumber.text = "Step " + String(indexPath.row + 1)
    
        return cell
        
    }
 
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = true
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
