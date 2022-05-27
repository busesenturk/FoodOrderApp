//
//  CartViewController.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import UIKit
import Firebase

class CartViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalCartPriceLabel: UILabel!
    
    var foodList = [CartModel]()
    var cartPresenterObject: ViewToPresenterCartPageProtocol?
    let cellSpacingHeight: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.separatorColor = UIColor(white: 0, alpha: 1)
        CartRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartPresenterObject?.getFood(kullanici_adi:"\(Auth.auth().currentUser?.email ?? "")")
        getTotal()
    }
    
    func getTotal() {
        var total = 0
        for food in foodList {
            total += Int(food.yemek_siparis_adet!)! * Int(food.yemek_fiyat!)!
        }
        totalCartPriceLabel.text = "💸 Toplam tutar: \(String(total)) ₺"
    }
}

extension CartViewController: PresenterToViewCartPageProtocol {
    func sendDataToView(cartFoodList: Array<CartModel>) {
        self.foodList = cartFoodList
        DispatchQueue.main.async {
            self.cartTableView.reloadData()
            self.getTotal()
        }
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
        cell.foodCartImageView.image = UIImage(named: food.yemek_resim_adi!)
        cell.showImage(imageName: "\(food.yemek_resim_adi!)")
        cell.totalCount.text = ("Toplam adet : 🛒 \(food.yemek_siparis_adet!)")
        cell.selectionStyle = .none
        return cell
    }
}
