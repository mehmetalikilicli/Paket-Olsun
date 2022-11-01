//
//  ProfileVC.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 30.10.2022.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var kullaniciAdiLabel: UILabel!
    
    var profilePresenterNesnesi : ViewToPresenterProfileProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ProfileRouter.createModule(ref: self)

    }
    
    
    
    @IBAction func cikisYapButton(_ sender: Any) {
        profilePresenterNesnesi?.userBilgileriniAl()
        performSegue(withIdentifier: "toAuthVC", sender: nil)
    }
}
