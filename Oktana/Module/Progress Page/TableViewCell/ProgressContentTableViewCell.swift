//
//  ProgressContentTableViewCell.swift
//  Oktana
//
//  Created by Gratianus Martin on 14/06/21.
//

import UIKit

class ProgressContentTableViewCell: UITableViewCell  {
    
    var workoutData: [Workout]? {
        didSet {
            ContentCollectionView.reloadData()
        }
    }
    
    

    @IBOutlet weak var ContentCollectionView: UICollectionView!
    let sectionInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ContentCollectionView.dataSource = self
        ContentCollectionView.delegate = self
        
        let nibCell = UINib(nibName: "ContentCollectionViewCell", bundle: nil)
        ContentCollectionView.register(nibCell, forCellWithReuseIdentifier: "contentCell")
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func getCellSize() -> CGSize {
        let paddingSpace = sectionInsets.left + sectionInsets.right
        let availableWidth = ContentCollectionView.frame.width - paddingSpace - 5
        let itemWidth = availableWidth / 2
        return CGSize(width: itemWidth, height: 140)
    }
     
    
}


extension ProgressContentTableViewCell:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            var total: Int = 0
            if let data = workoutData {
                total = data.count
            }
            
            let cell = ContentCollectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as! ContentCollectionViewCell
                    cell.title = "Workout"
                    cell.numbers = "\(total)x"
                    cell.thisweek = "\(total)"
                    cell.image = UIImage(named: "workout")
                    return cell
        case 1:
            
            var total: Float = 0
            if let data = workoutData {
                for workout in data {
                    total += Float(workout.totalTime)
                }
                total = total/60
            }
            
            let cell = ContentCollectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as! ContentCollectionViewCell
                    cell.title = "Time"
                    cell.numbers = "\(String(format: "%.1f", total))min"
                    cell.thisweek = "\(String(format: "%.1f", total))"
                    cell.image = UIImage(named: "time")
                    return cell
        case 2:
            var total: Int = 0
            if let data = workoutData {
                for workout in data {
                    total += Int(workout.totalCalories)
                }
            }
            
            let cell = ContentCollectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as! ContentCollectionViewCell
                    cell.title = "Calories"
                    cell.numbers = "\(total)kcal"
                    cell.thisweek = "\(total)"
                    cell.image = UIImage(named: "calories")
                    return cell
        case 3:
            var total: Int = 0
            if let data = workoutData {
                for workout in data {
                    total += Int(workout.avgHeartRate)
                }
                total = total / data.count
            }
            
            let cell = ContentCollectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as! ContentCollectionViewCell
                    cell.title = "Avg Heart Rate"
                    cell.numbers = "\(total)bpm"
                    cell.thisweek = "\(total)"
                    cell.image = UIImage(named: "hearrate")
                    return cell
        default:
            let cell = ContentCollectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as! ContentCollectionViewCell
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getCellSize()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
