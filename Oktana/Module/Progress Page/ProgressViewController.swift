//
//  ProgressViewController.swift
//  Oktana
//
//  Created by Deven Nathanael on 11/06/21.
//

import UIKit

class ProgressViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var progressTableView: UITableView!
    @IBOutlet weak var fitnessTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressTableView.dataSource = self
        fitnessTableView.dataSource = self
        
        let progressNib = UINib(nibName: "\(MediumProgressCardViewCell.self)", bundle: nil)
        progressTableView.register(progressNib, forCellReuseIdentifier: "progressCell")
        
        let fitnessNib = UINib(nibName: "\(LargeProgressCardViewCell.self)", bundle: nil)
        fitnessTableView.register(fitnessNib, forCellReuseIdentifier: "fitnessCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

}
