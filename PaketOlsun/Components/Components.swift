//
//  Degiskenler.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 30.10.2022.
//

import Foundation

struct Components {
    
    struct Degiskenler {
        static var kullanici_adi = "mehmetali"
    }
    
    struct Urls {
        static let tumYemekleriAlUrl = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php"
        static let sepettekiYemekleriAlUrl = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php"
        static let sepeteYemekEkleUrl = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php"
        static let sepettenYemekSilUrl = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php"
        static let yemekResimleriniAlUrl = "http://kasimadalan.pe.hu/yemekler/resimler/ayran.png"
    }
    
    struct ProfileInfo {
        static var userEmail : String?
        static var userKullaniciAdi : String?
    }
     
}
