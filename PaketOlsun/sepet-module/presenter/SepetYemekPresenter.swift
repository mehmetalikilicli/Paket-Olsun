//
//  SepetYemekPresenter.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 26.10.2022.
//

import Foundation
class SepetYemekPresenter : ViewToPresenterSepetProtocol {
    func sil(sepet_yemek_id: Int, kullanici_adi: String) {
        sepetInteractor?.sepetYemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
    var sepetView: PresenterToViewSepetProtocol?
    
    func sepetYemekleriGetir() {
        sepetInteractor?.tumSepetYemekleriGetir()
    }
    
}

extension SepetYemekPresenter : InteractorToPresenterSepetProtocol {
    func presenteraSepetYemekleriGonder(sepetYemeklerListesi: [SepetYemekler]) {
        sepetView?.viewaSepetYemekleriGonder(sepetYemeklerListesi: sepetYemeklerListesi)
    }
}
