//
//  CartTableViewCell.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 23.05.2022.
//

import UIKit
import Kingfisher

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var foodCartImageView: UIImageView!
    @IBOutlet weak var foodCartName: UILabel!
    @IBOutlet weak var foodCartPrice: UILabel!
    @IBOutlet weak var totalCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func showImage(imageName:String) {
        if let url = URL(string:"http://kasimadalan.pe.hu/yemekler/resimler/\(imageName)") {
            DispatchQueue.main.async {
                self.foodCartImageView.kf.setImage(with: url)
            }
        }
    }
}
