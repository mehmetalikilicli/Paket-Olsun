//
//  AuthPresenter.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 30.10.2022.
//

import Foundation
class AuthPresenter : ViewToPresenterAuthProtocol{
    var authInteractor: PresenterToInteractorAuthProtocol?
    
    var authView: PresenterToViewAuthProtocol?
    
    func singIn(email: String, password: String, kullanici_adi: String) {
        authInteractor?.userSignIn(email: email, password: password, kullanici_adi: kullanici_adi)
    }
    
    func singUp(email: String, password: String, kullanici_adi: String) {
        authInteractor?.userSignUp(email: email, password: password, kullanici_adi: kullanici_adi)
    }
    
}
extension AuthPresenter : InteractorToPresenterAuthProtocol {
    func presenteraSignUpCevabiGonder(signUpOnaylandiMi: Bool) {
        authView?.viewaSignUpCevabiGonder(SignUpOnaylandiMi: signUpOnaylandiMi)

    }
    
    func presenteraSignInCevabiGonder(signInOnaylandiMi: Bool) {
        authView?.viewaSignInCevabiGonder(SignInOnaylandiMi: signInOnaylandiMi)
    }
    
}
