//
//  AnasayfaProtocols.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 18.10.2022.
//

import Foundation
import UIKit

// view -> presenter -> interactor

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor : PresenterToInteractorAnasayfaProtocol? { get set }
    var anasayfaView : PresenterToViewAnasayfaProtocol? {get set}
    
    func yemekleriYukle()
    //func resimEkle(resimAdi:String)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter : InteractorToPresenterAnasayfaProtocol? {get set}
    func tumYemekleriAl()
    //func tumResimleriAl(resimAdi:String)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraYemekleriGonder(yemeklerListesi : [Yemekler])
    //func presenteraResmiGonder(resimAdi : UIImageView)
}

protocol PresenterToViewAnasayfaProtocol {
    func viewaYemekleriGonder(yemeklerListesi: [Yemekler])
    //func viewaResmiGonder(resimAdi : UIImageView)
}

protocol presenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnasayfaVC)
}
