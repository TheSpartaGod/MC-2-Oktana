//
//  FitnessTableViewCell.swift
//  Oktana
//
//  Created by Gratianus Martin on 15/06/21.
//

import UIKit

class FitnessTableViewCell: UITableViewCell {
    
    
    var fitnessData: fitnessProgressGenerate?{
        didSet{
            titleLabel.text = fitnessData?.title
            if let benchmark = fitnessData?.benchmark {
                previousTest.progress = Float(fitnessData?.previousTestData ?? 0) / benchmark
                lastTestLabel.text = "Last test: \(fitnessData?.previousTestData ?? 0) reps"
                currenTestLabel.text = "\(Int(fitnessData?.currentTestData ?? 0)) reps"
                currentTest.progress = Float(fitnessData?.currentTestData ?? 0) / benchmark
            }
            
        }
    }
    
        
    var title: String = ""{
        didSet {
            titleLabel.text = title
        }
    }
    
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var currentTest: UIProgressView!
    @IBOutlet weak var previousTest: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lastTestLabel: UILabel!
    @IBOutlet weak var currenTestLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initVisual()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func initVisual(){
        view.layer.cornerRadius = 8
    }
    
}
