//
//  SepetYemekRouter.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 26.10.2022.
//

import Foundation
class SepetYemekRouter : PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetYemekVCViewController) {
        let presenter = SepetYemekPresenter()
        
        ref.sepetPresenterNesnesi = presenter
        
        
        ref.sepetPresenterNesnesi?.sepetInteractor = SepetYemekInteractor()
        ref.sepetPresenterNesnesi?.sepetView = ref
        
        ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter
        
    }
    
}
