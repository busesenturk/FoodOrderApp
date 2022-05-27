//
//  DetailProtocols.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import Foundation

protocol ViewToPresenterDetailPageProtocol {
    
    var detailPageInteractor: PresenterToInteractorDetailPageProtocol? { get set }
    
    func totalCount(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String, yemek_siparis_adet:Int, kullanici_adi:String)
}

protocol PresenterToInteractorDetailPageProtocol {
    
    func foodTotalCount(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String, yemek_siparis_adet:Int, kullanici_adi:String)
}

protocol PresenterToRouterDetailPageProtocol {
    static func createModule(ref:DetailViewController)
}
