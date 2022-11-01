//
//  SepetYemekInteractor.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 26.10.2022.
//

import Foundation
import Alamofire
class SepetYemekInteractor : PresenterToInteractorSepetProtocol {
    func sepetYemekSil(sepet_yemek_id: Int, kullanici_adi: String) {
        let params : Parameters = ["sepet_yemek_id" : sepet_yemek_id, "kullanici_adi": kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                    self.tumSepetYemekleriGetir()
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
    
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    
    let params: Parameters = ["kullanici_adi" : Components.Degiskenler.kullanici_adi]
    
    func tumSepetYemekleriGetir() {
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method:.post,parameters: params).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data)
                    var list = [SepetYemekler]()
                    if let answerList = answer.sepet_yemekler {
                        list = answerList
                    }
                    self.sepetPresenter?.presenteraSepetYemekleriGonder(sepetYemeklerListesi: list)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
