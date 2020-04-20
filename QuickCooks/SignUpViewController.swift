//
//  SignUpViewController.swift
//  QuickCooks
//
//  Created by user168008 on 4/13/20.
//  Copyright © 2020 Jada Grant. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var UserFirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var UserEmailTextField: UITextField!
    @IBOutlet weak var userPhone: UITextField!
    @IBOutlet weak var userAddress: UITextField!
    @IBOutlet weak var userZip: UITextField!
    @IBOutlet weak var userCity: UITextField!
    @IBOutlet weak var userState: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func onSgnBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpToHomeSegue", sender: nil)
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
