//
//  CartViewController.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    
    var foodList = [CartModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foodList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        cell.foodCartName.text = food.yemek_adi
        cell.foodCartPrice.text = "\(food.yemek_fiyat!)₺"
        cell.selectionStyle = .none
        return cell
    }
}
