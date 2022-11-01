//
//  ProfileRouter.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 30.10.2022.
//

import Foundation
class ProfileRouter : presenterToRouterProfileProtocol {
    static func createModule(ref: ProfileVC) {
        let presenter = ProfilePresenter()
        
        ref.profilePresenterNesnesi = presenter
        
        ref.profilePresenterNesnesi?.profileInteractor = ProfileInteractor()
        
    }
    
}
