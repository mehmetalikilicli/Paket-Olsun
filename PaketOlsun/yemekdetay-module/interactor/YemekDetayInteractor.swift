//
//  YemekDetayInteractor.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 21.10.2022.
//

import Foundation
import Alamofire
class YemekDetayInteractor : PresenterToInteractorYemekDetayProtocol{
    
    var list = [SepetYemekler]()
    
    
    func sepeteEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        
        var sepeteEklendiMi : Bool = false

        
        //Sepetteki tum yemekler alınır.
        let params: Parameters = ["kullanici_adi" : Components.Degiskenler.kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method:.post,parameters: params).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data)
                    if let answerList = answer.sepet_yemekler {
                        self.list = answerList
                        print(self.list[0].yemek_adi!)
                    }
                } catch {
                    print(error.localizedDescription)
                }
                
                // Eger sepetteki yemeklerden birinin adi ile su an eklenecek
                //yemekgin adi ayniysa sepetteki yemegin adedini alip
                //simdiki eklenecek yemegin adedine ekleyip, sepete eklenecek
                
                for sepetYemekler in self.list {
                    if sepetYemekler.yemek_adi == yemek_adi {
                        print(sepetYemekler.yemek_adi)
                        //Urunun eski adedini al
                        
                        var urunAdedi = Int(sepetYemekler.yemek_siparis_adet!)!
                        
                        //Sepetten yemegi sil
                        let paramsSepetYemekSil : Parameters = ["sepet_yemek_id" : sepetYemekler.sepet_yemek_id!, "kullanici_adi": kullanici_adi]
                        
                        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: paramsSepetYemekSil).response { response in
                            if let data = response.data {
                                do {
                                    let cevap = try JSONSerialization.jsonObject(with: data)
                                    print("sepetten silindi")
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                            
                        }
                        
                        var urunAdediYeni = urunAdedi + yemek_siparis_adet
                        let paramsSepeteYemekEkle : Parameters = ["yemek_adi" : yemek_adi,"yemek_resim_adi" : yemek_resim_adi,"yemek_fiyat" : yemek_fiyat,"yemek_siparis_adet" : urunAdediYeni, "kullanici_adi" : kullanici_adi]
                        
                        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post, parameters: paramsSepeteYemekEkle).response { response in
                            if let data = response.data {
                                do {
                                    let cevap = try JSONSerialization.jsonObject(with: data)
                                    print("yeni urun adediyle eklendi")
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                        }
                        sepeteEklendiMi = true
                    }
                }
                if sepeteEklendiMi == false {
                    let paramsSepeteYemekEkle : Parameters = ["yemek_adi" : yemek_adi,"yemek_resim_adi" : yemek_resim_adi,"yemek_fiyat" : yemek_fiyat,"yemek_siparis_adet" : yemek_siparis_adet, "kullanici_adi" : kullanici_adi]
                    
                    AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post, parameters: paramsSepeteYemekEkle).response { response in
                        if let data = response.data {
                            do {
                                let cevap = try JSONSerialization.jsonObject(with: data)
                                print("Urun eklendi")
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
            }
        }
    }
    
}
