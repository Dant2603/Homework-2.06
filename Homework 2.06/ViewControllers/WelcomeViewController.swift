//
//  WelcomeViewController.swift
//  Homework 2.06
//
//  Created by Мария Гетманская on 10.06.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var greetingLabel: UILabel!
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Welcome, \(username ?? "")!"

    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
