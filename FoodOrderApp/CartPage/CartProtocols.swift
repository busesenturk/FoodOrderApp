//
//  CartProtocols.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 23.05.2022.
//

import Foundation

protocol ViewToPresenterCartPageProtocol {
    var cartPageInteractor:PresenterToInteractorCartPageProtocol? {get set}
    var cartPageView:PresenterToViewCartPageProtocol? { get set }
    
    func getFood(kullanici_adi: String)
    func delete(sepet_yemek_id: String, kullanici_adi: String)
}

protocol PresenterToInteractorCartPageProtocol {
    var cartPagePresenter:InteractorToPresenterCartPageProtocol? { get set }
    
    func getFoodInCart(kullanici_adi: String)
    func deleteFood(sepet_yemek_id: String, kullanici_adi: String)
}

protocol InteractorToPresenterCartPageProtocol {
    func sendDataToPresenter(cartFoodList:Array<CartModel>)
}

protocol PresenterToViewCartPageProtocol {
    func sendDataToView(cartFoodList:Array<CartModel>)
}

protocol PresenterToRouterCartPageProtocol {
    static func createModule(ref:CartViewController)
}

