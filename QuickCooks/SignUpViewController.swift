//
//  SignUpViewController.swift
//  QuickCooks
//
//  Created by user168008 on 4/13/20.
//  Copyright © 2020 Jada Grant. All rights reserved.
//

import UIKit
import Parse
class SignUpViewController: UIViewController {

    @IBOutlet weak var UserFirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var UserEmailTextField: UITextField!
    @IBOutlet weak var userPhone: UITextField!
    @IBOutlet weak var userAddress: UITextField!
    @IBOutlet weak var userZip: UITextField!
    @IBOutlet weak var userCity: UITextField!
    @IBOutlet weak var userState: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var user = PFUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func onSgnBtn(_ sender: Any) {
        
        user.username = userName.text
        user.password = userPassword.text
        user.email = UserEmailTextField.text
        user["firstname"] = UserFirstNameTextField.text
        user["lastname"] = LastNameTextField.text
        user["address"] = userAddress.text
        user["pnumber"] = Int(userPhone.text!) ?? 0
        user["zipcode"] = Int(userZip.text!) ?? 0
        user["city"] = userCity.text
        user["state"] = userState.text
        
        user.signUpInBackground { (success, error) in
            if(success){
                self.performSegue(withIdentifier: "signUpToHomeSegue", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    
    @IBAction func userOrChefPressed(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:

            let chef = PFObject(className: "Chefs")
            chef["firstname"] = UserFirstNameTextField.text
            chef["lastname"] = LastNameTextField.text
            chef["address"] = userAddress.text
            chef["pnumber"] = userPhone.text
            chef["zipcode"] = userZip.text
            chef["city"] = userCity.text
            chef["state"] = userState.text
            
            chef.saveInBackground { (success, error) in
                if(success){
                    print("success")
                }
                else{
                    print("error saving chef")
                }
            }
            
        case 1: print("regular user")
        default:
            break
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


