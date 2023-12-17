//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Devmuruvvet on 29.09.2023.
//

import UIKit
import Parse

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
        
    }


    
    @IBAction func signInClicked(_ sender: Any) {
        
        if usernameText.text !=  "" && passwordText.text != "" {
            
            PFUser.logInWithUsername(inBackground: usernameText.text!, password: passwordText.text!){ (user, error) in
                if error != nil {
                    self.makeAlert(tittleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    
                    // Segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                    
                }
                
            }
            
            
        } else {
            makeAlert(tittleInput: "Error", messageInput: "Username / Password?? ")
        }
        
        
    }

    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if usernameText.text != "" && passwordText.text != "" {
            let user = PFUser()
            user.username = usernameText.text!
            user.password = passwordText.text!
            user.signUpInBackground{ (success , error) in
                if error != nil {
                    self.makeAlert(tittleInput: "Error", messageInput: error?.localizedDescription ?? "Error!!")
                } else {
                    // Segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
                
            }
            
            
        } else {
            makeAlert(tittleInput: "Error", messageInput: "Username / Password??")
        }
        
    }
    
    func makeAlert (tittleInput : String , messageInput : String){
        let alert = UIAlertController(title: tittleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}





// Do any additional setup after loading the view.
/*
let parseObject = PFObject(className: "Fruits")
parseObject["name"] = "Apple"
parseObject["calories"] = 100
parseObject.saveInBackground{(success, error) in
    if error != nil {
        print(error?.localizedDescription)
    }else {
        print("uploaded")
    }

}
 
    let query = PFQuery(className: "Fruits")
//query.whereKey("name", equalTo: "Apple")
//query.whereKey("calories", greaterThan: 120)
query.findObjectsInBackground{ (objects, error) in
    if error != nil {
        print(error?.localizedDescription)
    } else{
        print(objects)
    }
        
    
}

*/
