//
//  SepetYemekVCViewController.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 26.10.2022.
//

import UIKit
import Kingfisher
class SepetYemekVCViewController: UIViewController {

    @IBOutlet weak var sepetTableView: UITableView!
    
    
    
    var sepetYemeklerListesi = [SepetYemekler]()
    
    var sepetPresenterNesnesi : ViewToPresenterSepetProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sepetTableView.delegate = self
        sepetTableView.dataSource = self

        SepetYemekRouter.createModule(ref: self)
        
        self.navigationItem.title = "Sepet"
        
        let appearance = UINavigationBarAppearance()
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "AppColor5")!, .font: UIFont(name: "Pacifico-Regular", size: 22)]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
        
    }
    
    @IBAction func sepeteOnaylaButton(_ sender: Any) {
        performSegue(withIdentifier: "toMapVC", sender: nil)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.sepetYemekleriGetir()
    }
}

extension SepetYemekVCViewController :PresenterToViewSepetProtocol {
    func viewaSepetYemekleriGonder(sepetYemeklerListesi: [SepetYemekler]) {
        self.sepetYemeklerListesi = sepetYemeklerListesi
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
        }
    }
    
}

extension SepetYemekVCViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepetYemeklerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sepetYemek = sepetYemeklerListesi[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepetYemeklerHucre") as! SepetHucreTableViewCell
        
        hucre.sepetYemekIsım.text = "\(sepetYemek.yemek_adi!)"
        hucre.yemekAdet.text = "Adet: \(sepetYemek.yemek_siparis_adet!)"
        
        var toplam = Int(sepetYemek.yemek_siparis_adet!)! * Int(sepetYemek.yemek_fiyat!)!
        hucre.sepetYemekFiyat.text = "\(toplam) ₺"
        
        let randomDouble = Double.random(in: 3...5)
        hucre.sepetYemekYildiz.text = String(format: "%.1f ★", randomDouble)
        
        hucre.backgroundColor = UIColor(white: 0.9, alpha: 1)
        hucre.sepetArkaPlan.layer.cornerRadius = 8.0

        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(sepetYemek.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                hucre.sepetImageView.kf.setImage(with: url)
            }
        }
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){(contextualAction, view, bool) in
            
            let yemek = self.sepetYemeklerListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Sepetten Çıkarılacak", message: "\(yemek.yemek_adi!) sepetten çıkarılacak, çıkarmak istediğinize emin misiniz?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                self.sepetPresenterNesnesi?.sil(sepet_yemek_id: Int(yemek.sepet_yemek_id!)!, kullanici_adi: Components.Degiskenler.kullanici_adi)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    
}
