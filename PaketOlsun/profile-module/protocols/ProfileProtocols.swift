//
//  ProfileProtocols.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 30.10.2022.
//

import Foundation
protocol ViewToPresenterProfileProtocol {
    var profileInteractor : PresenterToInteractorProfileProtocol? {get set}
    //var profileView : PresenterToViewProfileProtocol? {get set}
    
    func userBilgileriniAl()
}

protocol PresenterToInteractorProfileProtocol {
    
    //var profilePresenter : InteractorToPresenterProfileProtocol? {get set}
    func bilgileriAl()
    
}

/*protocol InteractorToPresenterProfileProtocol {
    func presentaraBilgileriGonder(userInfo : ProfilBilgileri)
}

protocol PresenterToViewProfileProtocol {
    func viewaBilgileriGonder(userInfo : ProfilBilgileri)
}*/
protocol presenterToRouterProfileProtocol {
    static func createModule(ref:ProfileVC)
}

