//
//  ProgressContentTableViewCell.swift
//  Oktana
//
//  Created by Gratianus Martin on 14/06/21.
//

import UIKit

class ProgressContentTableViewCell: UITableViewCell  {
    
    

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

        // Configure the view for the selected state
    }
    
    func getCellSize() -> CGSize {
        let paddingSpace = sectionInsets.left + sectionInsets.right
        let availableWidth = ContentCollectionView.frame.width - paddingSpace - 5
        let itemWidth = availableWidth / 2
        return CGSize(width: itemWidth, height: 120)
    }
    
}


extension ProgressContentTableViewCell:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ContentCollectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as! ContentCollectionViewCell
        
        return cell
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
