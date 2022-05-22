//
//  ViewController.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func onEyeButtonTapped(_ sender: Any) {
        eyeButton.isSelected = !eyeButton.isSelected
        passwordTextField.isSecureTextEntry = !eyeButton.isSelected
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        tabBarController?.tabBar.isHidden = true
    }

    @IBAction func signInButton(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { authData, error in
                if error != nil {
                    self.showAlertMessage(titleInput: "Hata!", messageInput: error?.localizedDescription
                    ?? "Error!")
                } else {
                    self.performSegue(withIdentifier: "toHomeViewController", sender: nil)
                }
            }
        } else {
            
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authdata, error) in
                if error != nil {
                    self.showAlertMessage(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toHomeViewController", sender: nil)
                }
            }
        } else {
           showAlertMessage(titleInput: "Hata!", messageInput: "Kullanıcı adı veya şifre alanı boş bırakılamaz.")
        }
    }
}

