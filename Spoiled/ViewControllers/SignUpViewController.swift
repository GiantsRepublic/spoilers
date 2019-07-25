//
//  SignUpViewController.swift
//  Spoiled
//
//  Created by Jason Wei on 7/23/19.
//  Copyright © 2019 GiantsRepublic. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet var emailField: UITextField!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var pwField: UITextField!
    @IBOutlet var rppwField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func signUpPressed(_ sender: Any) {
        if emailField.text?.isEmpty == false && usernameField.text?.isEmpty == false && pwField.text?.isEmpty == false && rppwField.text?.isEmpty == false {
            let email = emailField.text!
            let password = pwField.text!
            let username = usernameField.text!
            
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if error != nil {
                    print("Error creating account: \(error.debugDescription)")
                } else {
//                    print("uid \(Auth.auth().currentUser!.uid)")
                    let currID = Auth.auth().currentUser!.uid
                    let rootRef = Database.database().reference().child("UserData").child(currID)
                    rootRef.updateChildValues(["username": username])
                    print("action finished")
                    self.dismiss(animated: true, completion: nil)
                    //self.performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
                }
            }
        } else {
            let emptyAlert = UIAlertController(title: "Warning!", message: "Please complete all fields before proceeding", preferredStyle: .alert)
            emptyAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(emptyAlert, animated: true)
        }
    }
}
