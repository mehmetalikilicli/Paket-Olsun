//
//  AuthProtocols.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 30.10.2022.
//

import Foundation
protocol ViewToPresenterAuthProtocol {
    var authInteractor : PresenterToInteractorAuthProtocol? {get set}
    var authView : PresenterToViewAuthProtocol? {get set}
    
    func singIn(email : String, password: String, kullanici_adi : String)
    func singUp(email : String, password: String, kullanici_adi : String)
}

protocol PresenterToInteractorAuthProtocol {
    var authPresenter : InteractorToPresenterAuthProtocol? {get set}
    
    func userSignIn(email : String, password: String, kullanici_adi : String)
    func userSignUp(email : String, password: String, kullanici_adi : String)
    
}

protocol InteractorToPresenterAuthProtocol {
    func presenteraSignUpCevabiGonder(signUpOnaylandiMi : Bool)
    func presenteraSignInCevabiGonder(signInOnaylandiMi : Bool)

}

protocol PresenterToViewAuthProtocol {
    func viewaSignUpCevabiGonder(SignUpOnaylandiMi : Bool)
    func viewaSignInCevabiGonder(SignInOnaylandiMi : Bool)

}

protocol PresenterToRouterAuthProtocol {
    static func createrModule(ref: AuthVC)
}
