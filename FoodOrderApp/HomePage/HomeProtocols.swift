//
//  HomeProtocols.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import Foundation

protocol ViewToPresenterHomeProtocol {
    var homeInteractor:PresenterToInteractorHomeProtocol? { get set }
    var homeView:PresenterToViewHomeProtocol? { get set }
    
    func downloadFood()    
}

protocol PresenterToInteractorHomeProtocol {
    var homePresenter:InteractorToPresenterHomeProtocol? { get set }
    
    func getAllFood()    
}

protocol InteractorToPresenterHomeProtocol {
    func sendDataToPresenter(foodList:Array<AllFoodModel>)
}

protocol PresenterToViewHomeProtocol {
    func sendDataToView(foodList:Array<AllFoodModel>)
}

protocol PresenterToRouterHomeProtocol {
    static func createModule(ref:HomeViewController)
}
