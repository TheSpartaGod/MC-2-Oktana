//
//  ProgressViewController.swift
//  Oktana
//
//  Created by Deven Nathanael on 11/06/21.
//

import UIKit

class ProgressViewController: UIViewController {
    
    @IBOutlet weak var progressTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TitleTableViewCell", bundle: nil)
        let nibContentProgress = UINib(nibName: "ProgressContentTableViewCell", bundle: nil)
        let nibFitness = UINib(nibName: "FitnessTableViewCell", bundle: nil)
        self.progressTableView.register(nib, forCellReuseIdentifier: "titleCell")
        self.progressTableView.register(nibContentProgress, forCellReuseIdentifier: "progressCell")
        self.progressTableView.register(nibFitness, forCellReuseIdentifier: "fitnessView")
    }
}

extension ProgressViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell") as! TitleTableViewCell
            cell.title = "Progess"
            cell.isTestButtonExist = true
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell") as! ProgressContentTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell") as! TitleTableViewCell
            cell.title = "Your Fitness"
            cell.isTestButtonExist = false
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fitnessView") as! FitnessTableViewCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fitnessView") as! FitnessTableViewCell
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fitnessView") as! FitnessTableViewCell
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fitnessView") as! FitnessTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell") as! ProgressContentTableViewCell
            return cell
        }
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 1 {
            return 280
        } else if indexPath.row > 2 {
            return 180
        } else {
            return 44
        }
    }
    
    
}
