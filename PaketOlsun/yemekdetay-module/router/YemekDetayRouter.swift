//
//  YemekDetayRouter.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 21.10.2022.
//

import Foundation
class YemekDetayRouter : PresenterToRouterYemekDetayInteractor{
    static func createModule(ref: YemekDetayVC) {
        ref.yemekDetayPresenterNesnesi = YemekDetayPresenter()
        ref.yemekDetayPresenterNesnesi?.yemekDetayInteractor = YemekDetayInteractor()
    }
}
