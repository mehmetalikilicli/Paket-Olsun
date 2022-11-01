//
//  AuthRouter.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 30.10.2022.
//

import Foundation
class AuthRouter : PresenterToRouterAuthProtocol{
    static func createrModule(ref: AuthVC) {
        
        let presenter = AuthPresenter()
        
        ref.authPresenterNesnesi = presenter
        
        ref.authPresenterNesnesi?.authInteractor = AuthInteractor()
        ref.authPresenterNesnesi?.authView = ref
        
        ref.authPresenterNesnesi?.authInteractor?.authPresenter = presenter
        
        
    }
}
