//
//  DetailPresenter.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import Foundation

class DetailPresenter: ViewToPresenterDetailPageProtocol {
    
    var detailPageInteractor: PresenterToInteractorDetailPageProtocol?
    
    func totalCount(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: Int, kullanici_adi: String) {
                detailPageInteractor?.foodTotalCount(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
}
