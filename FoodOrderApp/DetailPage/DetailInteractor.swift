//
//  DetailInteractor.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import Foundation

class DetailInteractor : PresenterToInteractorDetailPageProtocol {
    func foodTotalCount(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: Int, kullanici_adi: String) {
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php")!
        let stringData = "yemek_adi=\(yemek_adi)&yemek_resim_adi=\(yemek_resim_adi)&yemek_fiyat=\(yemek_fiyat)&yemek_siparis_adet=\(yemek_siparis_adet)&kullanici_adi=\(kullanici_adi)"
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = stringData.data(using: .utf8)
        URLSession.shared.dataTask(with: request){ data,response,error in
            if error != nil || data == nil {
                print(error ?? "error")
                return
            }
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                    print(json)
                }
            }catch{
                print(String(describing: error))
            }
        }.resume()
    }
}
