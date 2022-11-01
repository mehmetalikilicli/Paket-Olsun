//
//  ProfilePresenter.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 30.10.2022.
//

import Foundation
class ProfilePresenter : ViewToPresenterProfileProtocol {
    var profileInteractor: PresenterToInteractorProfileProtocol?
    
    
    func userBilgileriniAl() {
        profileInteractor?.bilgileriAl()
    }
    
    
}

