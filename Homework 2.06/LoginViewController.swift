//
//  ViewController.swift
//  Homework 2.06
//
//  Created by Мария Гетманская on 10.06.2024.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    let username = "admin"
    let password = "12345"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowWelcomeScreen" {
            if let welcomeVC = segue.destination as? WelcomeViewController {
                welcomeVC.username = userNameTF.text
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let usernameField = userNameTF.text ?? ""
        let passwordField = passwordTF.text ?? ""
        
        if usernameField != username || passwordField != password {
            showError("Please enter correct login and password")
            return false
        }
        
        return true
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func forgotUserNameButtonTapped(_ sender: Any) {
        showUserData("Your username is \(username) 😉")
    }
    
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        showUserData("Your password is \(password) 😉")
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Invalid login or password", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in self.passwordTF.text = "" }))
        present(alert, animated: true, completion: nil)
    }
    
    func showUserData(_ message: String) {
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in self.passwordTF.text = "" }))
        present(alert, animated: true, completion: nil)
    }
}

