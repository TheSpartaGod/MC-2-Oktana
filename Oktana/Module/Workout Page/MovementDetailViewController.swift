//
//  MovementDetailViewController.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 08/06/21.
//

import UIKit

class MovementDetailViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
 

    @IBOutlet weak var movementDetailTableView: UITableView!
    @IBOutlet weak var readyWorkoutButton: UIView!
    var selectedRow = 0
    
    @objc func didTapView(_ sender: UITapGestureRecognizer){//MOVE TO WORKOUT VIEW
        performSegue(withIdentifier: "startWorkoutMode", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        
        movementDetailTableView.delegate = self
        movementDetailTableView.dataSource = self
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.66, green: 0.87, blue: 0.30, alpha: 1.00)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.18, green: 0.17, blue: 0.17, alpha: 1.00)
        readyWorkoutButton.layer.cornerRadius = 10
        readyWorkoutButton.addGestureRecognizer(tapGestureRecognizer)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.tabBarController?.tabBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        //create a movement list from MovementQueue class
        MovementQueue.queueMovementList()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovementQueue.selectedMoves[section].count //EDIT THIS BASED ON NUMBER OF ROWS IN EACH SECTOIN
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4//EDIT THIS BASED ON NUMBER OF SECTIONS IN THE TABLEVIEW
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {//For custom header (black background, white text)
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.14, green: 0.14, blue: 0.14, alpha: 1.00)
        let headerTitle = UILabel()
        headerTitle.text = "Category" //EDIT THIS BASED ON SECTION NO.
        headerTitle.frame = CGRect(x: 25, y: 5, width: 100, height: 20)
        headerTitle.textColor = .white
        view.addSubview(headerTitle)
    
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = movementDetailTableView.dequeueReusableCell(withIdentifier: "MovementCell") as! MovementDetailTableViewCell
        let movementList = Movements()
        
        cell.moveNameLabel.text = movementList.data[MovementQueue.selectedMoves[indexPath.section][indexPath.row]-1].namaMovementGenerate
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedRow = MovementQueue.MovementList.data[MovementQueue.selectedMoves[indexPath.section][indexPath.row]-1].movementIDGenerate
       performSegue(withIdentifier: "showHowTo", sender: nil)
        print(indexPath)
        print(selectedRow)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHowTo"{
        let destinationController = segue.destination as! HowToDoViewController
        destinationController.selectedRow = selectedRow
        }
        else if segue.identifier == "startWorkoutMode"{
            let destinationController = segue.destination as! WorkoutModeViewController
        }
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
