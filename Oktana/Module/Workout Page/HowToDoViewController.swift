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
    override func viewDidLoad() {
        super.viewDidLoad()
     
        howToStepsTableView.delegate = self
        howToStepsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = howToStepsTableView.dequeueReusableCell(withIdentifier: "HowToTableViewCell") as? HowToTableViewCell ?? UITableViewCell()
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
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
