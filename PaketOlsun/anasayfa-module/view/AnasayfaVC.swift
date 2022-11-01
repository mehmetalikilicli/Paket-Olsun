//
//  ViewController.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 18.10.2022.
//

import UIKit

class AnasayfaVC: UIViewController {
    
    @IBOutlet weak var yemeklerTableView: UITableView!
    
    var yemeklerListesi = [Yemekler]()
    
    var anasayfaPresenterNesnesi : ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yemeklerTableView.delegate = self
        yemeklerTableView.dataSource = self
        
        AnasayfaRouter.createModule(ref: self)
        
        self.navigationItem.title = "Paket Olsun"
        
        let appearance = UINavigationBarAppearance()
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "AppColor5")!, .font: UIFont(name: "Pacifico-Regular", size: 22)]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    //Yemekler Anasayfa her açıldığında tekrar yemekleri çekicek.
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yemekleriYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetayVC" {
            if let yemek = sender as? Yemekler {
                let gidilecekVC = segue.destination as! YemekDetayVC
                gidilecekVC.yemek = yemek
            }
        }
    }
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func viewaResmiGonder(resimAdi: UIImageView) {
    }
    
    func viewaYemekleriGonder(yemeklerListesi: [Yemekler]) {
        self.yemeklerListesi = yemeklerListesi
        DispatchQueue.main.async {
            self.yemeklerTableView.reloadData()
        }
    }
}

extension AnasayfaVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemeklerListesi[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yemeklerHucre") as! YemeklerHucre
        hucre.yemekIsımLabel.text = "\(yemek.yemek_adi!)"
        hucre.yemekFiyatLabel.text = "\(yemek.yemek_fiyat!) ₺"
        let randomDouble = Double.random(in: 3...5)
        hucre.yemekYildizLabel.text = String(format: "%.1f ★", randomDouble)
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                hucre.yemeklerImageView.kf.setImage(with: url)
            }
        }
        
        hucre.yemeklerArkaPlan.layer.cornerRadius = 8.0
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemeklerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetayVC", sender: yemek)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
