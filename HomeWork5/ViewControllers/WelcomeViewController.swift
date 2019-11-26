//
//  WelcomeViewController.swift
//  HomeWork5
//
//  Created by Наташа Лемешевская on 11/26/19.
//  Copyright © 2019 Наташа Лемешевская. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var nameOfUser = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(nameOfUser)!"
    }
}
