//
//  DetailViewController.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import UIKit
import Firebase

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailFoodName: UILabel!
    @IBOutlet weak var detailFoodPrice: UILabel!
    @IBOutlet weak var foodTotalCount: UILabel!
    
    var detailPagePresenterObject: ViewToPresenterDetailPageProtocol?
    private var count: Int = 1
    private var total: Int = 0
    var food: AllFoodModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        detailFoodName.text = food?.yemek_adi
        detailFoodPrice.text = "\(food!.yemek_fiyat ?? "0")₺"
        detailImageView.image = UIImage(named: (food?.yemek_resim_adi)!)
        showImage(imageName: "\(food!.yemek_resim_adi!)")
        DetailRouter.createModule(ref: self)
    }
    
    func showImage(imageName:String) {
        if let url = URL(string:"http://kasimadalan.pe.hu/yemekler/resimler/\(imageName)") {
            DispatchQueue.main.async {
                self.detailImageView.kf.setImage(with: url)
            }
        }
    }
    
    @IBAction func increaseProductCount(_ sender: Any) {
        count += 1
        if let strFoodPrice = food?.yemek_fiyat! {
            if let intFoodPrice = Int(strFoodPrice){
                total = intFoodPrice * count
                detailFoodPrice.text = "\(total) ₺"
            }
        }
        foodTotalCount.text = String(count)
    }
    
    @IBAction func decreaseProductCount(_ sender: Any) {
        
        if count > 1 {
            count -= 1
        }
        
        if let strFoodPrice = food?.yemek_fiyat! {
            if let intFoodPrice = Int(strFoodPrice){
                detailFoodPrice.text = "\(intFoodPrice * count) ₺"
            }
        }
        foodTotalCount.text = String(count)
    }
    
    @IBAction func addToCartButtonClicked(_ sender: Any) {
        detailPagePresenterObject?.totalCount(yemek_adi: (food?.yemek_adi)!, yemek_resim_adi: (food?.yemek_resim_adi)!, yemek_fiyat: (food?.yemek_fiyat!)!, yemek_siparis_adet: Int(foodTotalCount.text!)!, kullanici_adi: "\(Auth.auth().currentUser?.email ?? "")")
    }
}

