//
//  ProfileCevap.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 30.10.2022.
//

import Foundation
class ProfilBilgileri : Codable {
     
    var email : String?
    var kullanici_adi : String?
    
    init(email: String, kullanici_adi: String) {
       self.email = email
       self.kullanici_adi = kullanici_adi
   }
    
}
