//
//  HomeViewController.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 21.05.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    private var foodList = [AllFoodModel]()
    private var selectedIndex: Int = 0
    var homePresenterObject: ViewToPresenterHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.collectionViewLayout = ColumnFlowLayout(numberOfColumns: 3, minColumnSpacing: 10, minLineSpacing: 10)
        HomeRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homePresenterObject?.downloadFood()
    }
}

extension HomeViewController: PresenterToViewHomeProtocol {
    func sendDataToView(foodList: Array<AllFoodModel>) {
        self.foodList = foodList
        DispatchQueue.main.async {
            self.homeCollectionView.reloadData()
        }
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        let food = foodList[indexPath.row]
        cell.foodNameLabel.text = food.yemek_adi
        cell.foodPriceLabel.text = "\(food.yemek_fiyat!)₺"
        cell.foodImageView.image = UIImage(named: food.yemek_resim_adi!)
        cell.showImage(imageName: "\(food.yemek_resim_adi!)")
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 20.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.item
    }
}
