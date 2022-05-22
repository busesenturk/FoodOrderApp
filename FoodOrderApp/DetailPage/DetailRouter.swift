//
//  DetailRouter.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import Foundation

class DetailRouter: PresenterToRouterDetailPageProtocol {
    static func createModule(ref: DetailViewController) {
        ref.detailPagePresenterObject = DetailPresenter()
        ref.detailPagePresenterObject?.detailPageInteractor = DetailInteractor()
    }
}
