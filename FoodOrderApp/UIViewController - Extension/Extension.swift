//
//  Extension.swift
//  FoodOrderApp
//
//  Created by Buse Şentürk on 22.05.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlertMessage(titleInput: String, messageInput: String) {
           let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle:     UIAlertController.Style.alert)
           let okButton = UIAlertAction(title: "Tamam", style: .default)
           alert.addAction(okButton)
           present(alert, animated: true)
    }
    
    func hideKeyboardWhenTappedAround() {
            let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
