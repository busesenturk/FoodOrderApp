//
//  CartRouter.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 23.05.2022.
//

import Foundation

class CartRouter: PresenterToRouterCartPageProtocol {
    static func createModule(ref: CartViewController) {
        let presenter = CartPresenter()
        ref.cartPresenterObject = presenter
        ref.cartPresenterObject?.cartPageInteractor = CartInteractor()
        ref.cartPresenterObject?.cartPageView = ref
        ref.cartPresenterObject?.cartPageInteractor?.cartPagePresenter = presenter
    }
}
