//
//  YemekSepetVC.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 19.10.2022.
//

import UIKit
import Kingfisher

class YemekDetayVC: UIViewController {
    
    var yemek : Yemekler?
    
    var yemekDetayPresenterNesnesi : ViewToPresenterYemekDetayProtocol?

 
    @IBOutlet weak var yemekDetayImageView: UIImageView!
    @IBOutlet weak var yemekDetayIsim: UILabel!
    @IBOutlet weak var yemekDetayYildiz: UILabel!
    @IBOutlet weak var yemekDetayFiyat: UILabel!
    @IBOutlet weak var yemekDetayTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        YemekDetayRouter.createModule(ref: self)
        
        if let yemek = yemek {
            yemekDetayIsim.text = yemek.yemek_adi
            yemekDetayFiyat.text = "\(yemek.yemek_fiyat ?? "") ₺"
            let randomDouble = Double.random(in: 3...5)
            yemekDetayYildiz.text = String(format: "%.1f ★", randomDouble)
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)"){
                DispatchQueue.main.async {
                    self.yemekDetayImageView.kf.setImage(with: url)
                }
            }
            
        }
    }
    
    @IBAction func sepeteEkleButton(_ sender: Any) {
        if Int(yemekDetayTextField.text!) != nil {
            yemekDetayPresenterNesnesi?.ekle(yemek_adi: (yemek?.yemek_adi)!, yemek_resim_adi: (yemek?.yemek_resim_adi)!, yemek_fiyat: Int((yemek?.yemek_fiyat)!)!, yemek_siparis_adet:Int(yemekDetayTextField.text!)!, kullanici_adi: Components.Degiskenler.kullanici_adi)
            makeAlert(title: "Onaylandı", message: "\(yemek!.yemek_adi!) sepetinize eklendi (fiyat: \(Int(yemekDetayTextField.text!)! * Int(((yemek?.yemek_fiyat)!))!) ₺)")
        } else {
            makeAlert(title: "Hata", message: "Lutfen Sayi Giriniz")
        }
          
    }
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
 
