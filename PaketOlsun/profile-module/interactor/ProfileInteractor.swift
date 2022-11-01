//
//  ProfileInteractor.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 30.10.2022.
//

import Foundation
import Firebase

class ProfileInteractor : PresenterToInteractorProfileProtocol{
    
    func bilgileriAl() {
        do {
            try Auth.auth().signOut()
            print("cikis yapildi")
        } catch {
            print(error.localizedDescription)
        }
    }
}
