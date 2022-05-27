//
//  CartPresenter.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 23.05.2022.
//

import Foundation

class CartPresenter: ViewToPresenterCartPageProtocol {
    
    var cartPageInteractor: PresenterToInteractorCartPageProtocol?
    var cartPageView: PresenterToViewCartPageProtocol?
    
    func getFood(kullanici_adi: String) {
        cartPageInteractor?.getFoodInCart(kullanici_adi: kullanici_adi)
    }
    
    func delete(sepet_yemek_id: String, kullanici_adi: String) {
        cartPageInteractor?.deleteFood(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
}

extension CartPresenter: InteractorToPresenterCartPageProtocol {
    func sendDataToPresenter(cartFoodList:Array<CartModel>) {
        cartPageView?.sendDataToView(cartFoodList: cartFoodList)
    }
}
