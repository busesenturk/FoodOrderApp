//
//  CartInteractor.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 23.05.2022.
//

import Foundation
import Alamofire

class CartInteractor: PresenterToInteractorCartPageProtocol {
    var cartPagePresenter: InteractorToPresenterCartPageProtocol?
    
    func getFoodInCart(kullanici_adi: String) {
        let params : Parameters = ["kullanici_adi":kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response{ response in
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(CartAnswer.self, from: data)
                    var liste = [CartModel]()
                    if let gelenListe = answer.sepet_yemekler {
                        liste = gelenListe
                    }
                    self.cartPagePresenter?.sendDataToPresenter(cartFoodList: liste)
                }catch let error {
                    print(error)
                }
            }
        }
    }
    
    func deleteFood(sepet_yemek_id: String, kullanici_adi: String) {
            let params:Parameters = ["sepet_yemek_id":sepet_yemek_id, "kullanici_adi":kullanici_adi]
            AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post,parameters:   params).response { response in
                if let data = response.data {
                    do {
                        if try JSONSerialization.jsonObject(with: data, options: []) is [String:Any]{
                            self.getFoodInCart(kullanici_adi:kullanici_adi)
                        }
                    }catch{
                        print(error)
                    }
                }
            }
        }
}
