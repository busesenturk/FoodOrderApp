//
//  CartTableViewCell.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 23.05.2022.
//

import UIKit
import Kingfisher

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var foodCartImageView: NSLayoutConstraint!
    @IBOutlet weak var foodCartName: UILabel!
    @IBOutlet weak var foodCartPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
