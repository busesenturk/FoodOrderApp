//
//  HomePresenter.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import Foundation

class HomePresenter: ViewToPresenterHomeProtocol {
    
    var homeInteractor: PresenterToInteractorHomeProtocol?
    var homeView: PresenterToViewHomeProtocol?
    
    func downloadFood() {
        homeInteractor?.getAllFood()
    }
    
    func find(searchWord: String) {
        homeInteractor?.findFood(searchWord: searchWord)
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func sendDataToPresenter(foodList: Array<AllFoodModel>) {
        homeView?.sendDataToView(foodList: foodList)
    }
}

