//
//  LoginViewController.swift
//  HomeWork5
//
//  Created by Наташа Лемешевская on 11/26/19.
//  Copyright © 2019 Наташа Лемешевская. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
        
    private let login = "Natasha"
    private let password = "nata1213"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "successLoginSegue" else { return }
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.nameOfUser = login
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {}
    
    @IBAction func hintButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            showAlert(title: "Ooops", message: "Your login is \(login) ☺️")
        case 1:
            showAlert(title: "Ooops", message: "Your password is \(password) 🤭")
        default: break
        }
    }
    
    @IBAction func logButton() {
        guard let testLogin = loginTextField.text else { return }
        guard let testPassword = passwordTextField.text else { return }
        
        if testLogin == login && testPassword == password {
            performSegue(withIdentifier: "successLoginSegue", sender: nil)
        } else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        }else {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension LoginViewController{
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

