//
//  HomeCollectionViewCell.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    
    func showImage(imageName:String) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(imageName)") {
            DispatchQueue.main.async {
                self.foodImageView.kf.setImage(with: url)
            }
        }
    }
}
