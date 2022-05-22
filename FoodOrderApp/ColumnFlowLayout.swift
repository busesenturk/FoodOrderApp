//
//  ColumnFlowLayout.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout {
    let numberOfColumns : Int
    var heightRatio : CGFloat = (2.5 / 2.0)
    
    init(numberOfColumns : Int, minColumnSpacing : CGFloat = 0, minLineSpacing : CGFloat = 0) {
        self.numberOfColumns = numberOfColumns
        super.init()
        self.minimumInteritemSpacing = minColumnSpacing
        self.minimumLineSpacing = minLineSpacing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else {return}
        let intervals = collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(numberOfColumns-1)
        let elementWidth = ((collectionView.bounds.size.width - intervals) / CGFloat(numberOfColumns)).rounded(.down)
        let elementHeight = elementWidth * heightRatio
        itemSize = CGSize(width: elementWidth, height: elementHeight)
    }
}
