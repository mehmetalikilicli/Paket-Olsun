//
//  AuthInteractor.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 30.10.2022.
//

import Foundation
import Firebase
import UIKit
import FirebaseFirestore
import FirebaseAuth
import FirebaseDatabase

class AuthInteractor : PresenterToInteractorAuthProtocol {
    
    var authPresenter : InteractorToPresenterAuthProtocol?

    
    func userSignIn(email: String, password: String, kullanici_adi: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                self.authPresenter?.presenteraSignInCevabiGonder(signInOnaylandiMi: true)
                Components.ProfileInfo.userEmail = email
                Components.ProfileInfo.userKullaniciAdi = kullanici_adi
            }
        }
    }
    
    func userSignUp(email: String, password: String, kullanici_adi: String) {
        Auth.auth().createUser(withEmail: email, password: password) {  (auth, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                let fireStore = Firestore.firestore()
                
                let userDictionary = ["email" : email, "kullanici_adi" : kullanici_adi] as [String : Any]
                
                fireStore.collection("UserInfo").addDocument(data: userDictionary) { (error) in
                    if error != nil {
                        print(error?.localizedDescription)
                    } else {
                        self.authPresenter?.presenteraSignUpCevabiGonder(signUpOnaylandiMi: true)
                    }
                }
            }
        }
    }
    

}
