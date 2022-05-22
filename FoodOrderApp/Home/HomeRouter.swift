//
//  HomeRouter.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import Foundation

class HomeRouter: PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeViewController) {
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        
        //View controller için
        ref.homePresenterObject = presenter
        
        //Presenter için
        ref.homePresenterObject?.homeInteractor = HomeInteractor()
        ref.homePresenterObject?.homeView = ref
        
        //Interactor için
        ref.homePresenterObject?.homeInteractor?.homePresenter = presenter
    }
}
