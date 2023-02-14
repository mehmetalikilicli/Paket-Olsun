//
//  AuthVC.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 30.10.2022.
//

import UIKit

class AuthVC: UIViewController {


    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var kullaniciAdiTextField: UITextField!
    @IBOutlet weak var sifreTextField: UITextField!
    
    var signInOnaylandiMi = false
    var signUpOnaylandiMi = false
    
    var authPresenterNesnesi : ViewToPresenterAuthProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AuthRouter.createrModule(ref: self)

    }
    
    @IBAction func oturumAcButton(_ sender: Any) {

        if kullaniciAdiTextField.text != "" && sifreTextField.text != "" {
            authPresenterNesnesi?.singIn(email: emailTextField.text!, password: sifreTextField.text!, kullanici_adi: kullaniciAdiTextField.text!)
        } else {
            self.makeAlert(title: "Hata", message: "Email, Kullanıcı Adı ve Şifre boş olamaz!")
        }
    }
    
    @IBAction func kaydolButton(_ sender: Any) {
        if kullaniciAdiTextField.text != "" && sifreTextField.text != "" {
            authPresenterNesnesi?.singUp(email: emailTextField.text!, password: sifreTextField.text!, kullanici_adi: kullaniciAdiTextField.text!)
            
        } else {
            self.makeAlert(title: "Hata", message: "Email, Kullanıcı Adı ve Şifre boş olamaz!")
        }
        
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

extension AuthVC : PresenterToViewAuthProtocol {
    func viewaSignUpCevabiGonder(SignUpOnaylandiMi: Bool) {
            self.signUpOnaylandiMi = SignUpOnaylandiMi
        print("Kaydolma Başarılı \(kullaniciAdiTextField.text!) kullanıcı adı ve \(emailTextField.text!) mail adresi ile kaydoldunuz.")
        Components.Degiskenler.kullanici_adi = kullaniciAdiTextField.text!
            performSegue(withIdentifier: "toAnasayfaVC", sender: nil)
    }
    
    func viewaSignInCevabiGonder(SignInOnaylandiMi: Bool) {
        self.signInOnaylandiMi = SignInOnaylandiMi
        print( "Giriş Başarılı \(kullaniciAdiTextField.text!) kullanıcı adı ve \(emailTextField.text!) mail adresi ile giriş yaptınız.")
        Components.Degiskenler.kullanici_adi = kullaniciAdiTextField.text!
        performSegue(withIdentifier: "toAnasayfaVC", sender: nil)
    }
}
