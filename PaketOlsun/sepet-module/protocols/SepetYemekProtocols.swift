//
//  SepetYemekProtocols.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 26.10.2022.
//

import Foundation
protocol ViewToPresenterSepetProtocol {
    var sepetInteractor : PresenterToInteractorSepetProtocol? {get set}
    var sepetView : PresenterToViewSepetProtocol? {get set}
    
    func sepetYemekleriGetir()
    func sil(sepet_yemek_id:Int,kullanici_adi:String)
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter : InteractorToPresenterSepetProtocol? {get set}
    
    func tumSepetYemekleriGetir()
    func sepetYemekSil(sepet_yemek_id:Int,kullanici_adi:String)
}

protocol InteractorToPresenterSepetProtocol {
    func presenteraSepetYemekleriGonder(sepetYemeklerListesi: [SepetYemekler])
}

protocol PresenterToViewSepetProtocol {
    func viewaSepetYemekleriGonder(sepetYemeklerListesi : [SepetYemekler])
}
protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetYemekVCViewController)
}
