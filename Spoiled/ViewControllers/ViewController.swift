//
//  ViewController.swift
//  Spoiled
//
//  Created by Jason Wei on 7/23/19.
//  Copyright © 2019 GiantsRepublic. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet var emailField: UITextField!
    @IBOutlet var pwField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signInPressed(_ sender: Any) {
        if let email = emailField.text, let password = pwField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if error != nil {
                    print("Error with login \(error.debugDescription)")
                    let alert = UIAlertController(title: "Warning!", message: "Something went wrong :( please check your login information", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                } else {
                    self.performSegue(withIdentifier: "signInSegue", sender: nil)
                }
            }
        } else if emailField.text?.isEmpty == true || pwField.text?.isEmpty == true{
            let emptyAlert = UIAlertController(title: "Warning!", message: "Please complete both fields", preferredStyle: .alert)
            emptyAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(emptyAlert, animated: true)
        }
    }

}

