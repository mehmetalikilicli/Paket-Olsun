//
//  AnasayfaInteractor.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 18.10.2022.
//

import Foundation
import Alamofire
import UIKit
import Kingfisher

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumResimleriAl(resimAdi: String) {
        var uiImageView = UIImageView()
        //anasayfaPresenter?.presenteraResmiGonder(resimAdi: uiImageView)
        print(resimAdi)
        /*
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)"){
            DispatchQueue.main.async {
                
            }
        }*/
    }
    
    
    func tumYemekleriAl() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                    if let liste = cevap.yemekler {
                        print("Anasayfa Tekrar yuklendi")
                        self.anasayfaPresenter?.presenteraYemekleriGonder(yemeklerListesi: liste)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
