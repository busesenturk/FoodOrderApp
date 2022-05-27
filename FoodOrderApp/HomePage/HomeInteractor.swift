//
//  HomeInteractor.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import Foundation
import Alamofire

class HomeInteractor: PresenterToInteractorHomeProtocol {
    
    var homePresenter: InteractorToPresenterHomeProtocol?
    
    func getAllFood() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(AllFoodAnswer.self, from: data)
                    var list = [AllFoodModel]()
                    if let incomeList = answer.yemekler {
                        list = incomeList
                    }
                    self.homePresenter?.sendDataToPresenter(foodList: list)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
