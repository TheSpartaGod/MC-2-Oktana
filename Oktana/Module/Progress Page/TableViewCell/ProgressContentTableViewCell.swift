//
//  ProgressContentTableViewCell.swift
//  Oktana
//
//  Created by Gratianus Martin on 14/06/21.
//

import UIKit

class ProgressContentTableViewCell: UITableViewCell  {
    
    

    @IBOutlet weak var ContentCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ContentCollectionView.dataSource = self
        ContentCollectionView.delegate = self
        
        let nibCell = UINib(nibName: "ContentCollectionViewCell", bundle: nil)
        ContentCollectionView.register(nibCell, forCellWithReuseIdentifier: "contentCell")
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension ProgressContentTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ContentCollectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as! ContentCollectionViewCell
        
        return cell
    }
    
}
