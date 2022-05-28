//
//  HomeViewController.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 21.05.2022.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    private var foodList = [AllFoodModel]()
    var homePresenterObject: ViewToPresenterHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        homeCollectionView.collectionViewLayout = ColumnFlowLayout(numberOfColumns: 3, minColumnSpacing: 10, minLineSpacing: 10)
        HomeRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homePresenterObject?.downloadFood()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailPage" {
            let food = sender as? AllFoodModel
            let destinationVC = segue.destination as? DetailViewController
            destinationVC!.food = food
        }
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            goToLoginPage()
        } catch {
            print("error")
        }
    }
}

//MARK: - Navigation
extension HomeViewController {
    func goToLoginPage() {
        guard let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        navigationController?.pushViewController(loginVC, animated: true)
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
        let food = foodList[indexPath.row]
        performSegue(withIdentifier: "toDetailPage", sender: food)
    }
}
