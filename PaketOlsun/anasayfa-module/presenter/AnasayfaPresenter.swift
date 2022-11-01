//
//  AnasayfaPresenter.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 18.10.2022.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
   /* func resimEkle(resimAdi: String) {
        anasayfaInteractor?.tumResimleriAl(resimAdi: resimAdi)
    } */
    
    
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func yemekleriYukle() {
        anasayfaInteractor?.tumYemekleriAl()
    }
    
}

extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraYemekleriGonder(yemeklerListesi: [Yemekler]) {
        anasayfaView?.viewaYemekleriGonder(yemeklerListesi: yemeklerListesi)

    }
    
  /*  func presenteraResmiGonder(resimAdi: UIImageView) {
        anasayfaView?.viewaResmiGonder(resimAdi: resimAdi)
    } */
    
}
