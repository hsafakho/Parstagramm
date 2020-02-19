//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Kay Lab on 2/18/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var UserNameField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignin(_ sender: Any) {
        
        let username = UserNameField.text!
        let password = PasswordField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
    @IBAction func onSignup(_ sender: Any) {
        let user = PFUser()
        user.username = UserNameField.text
        user.password = PasswordField.text
        
        user.signUpInBackground { (success, error) in
            if error != nil{
                if success {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
                else{
                    print("Error: \(error?.localizedDescription)")
                }
                
            }
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
