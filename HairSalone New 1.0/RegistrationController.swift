//
//  RegistrationController.swift
//  HairSalone New 1.0
//
//  Created by Elvin778 on 06.05.17.
//  Copyright © 2017 Elvin778. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {
    @IBOutlet weak var nameField : UITextField!
    @IBOutlet weak var lastNameField : UITextField!
    @IBOutlet weak var passwordField : UITextField!
    @IBOutlet weak var cpasswordField : UITextField!
    @IBOutlet weak var numberField : UITextField!
    @IBOutlet weak var emailField : UITextField!
    //let BASEURL : URL = "https://hair-salon-personal.herokuapp.com/͟"
    @IBAction func signUpButton(sender: UIButton) {
        //let user = MasterInfo(name: String, lastName: String, number: String, password: String, email: String)
        let userName = nameField.text!;
        let userLastName = lastNameField.text!;
        let userNumber = numberField.text!;
        let userPassword = passwordField.text!;
        let userCPassword = cpasswordField.text!;
        let userEmail = emailField.text!;
        
        // Store data
        let myUser : MasterInfo = MasterInfo(name: userName, lastName: userLastName, number: userNumber, password: userPassword, email: userEmail)

        myUser.name = userName
        myUser.lastName = userLastName
        myUser.number = userNumber
        myUser.password = userPassword
        myUser.email = userEmail
        
        //print("email is \(myUser.email)")
        // prepare json data
        let json: [String: Any] = ["email" : myUser.email, "password" : myUser.password]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "https://hair-salon-personal.herokuapp.com/register/master")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type" : "application/json"]
        
        // insert json data to the request
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
//            print("Help \(String.init(data: data, encoding: .utf8) ?? " no")")
            //print(response!)
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //print(responseJSON!)
            if let responseJSON = responseJSON as? [String: Any] {
                if let token = responseJSON ["token"]{
                    print (token)
//                if self.cpasswordField.text == self.passwordField.text && self.emailField.text != nil && self.passwordField.text != nil {
//                    if (userEmail.isEmpty || userPassword.isEmpty || userCPassword.isEmpty) {
//                        self.displayMyAlertMessage(userMessage : "error of register")
//                    } else {
//                        self.displayMyAlertMessage(userMessage : "register complete")
//                    }
//                } else {
//                    self.displayMyAlertMessage(userMessage  : "error from filling fields")
//                }
//                print(responseJSON)
              
                }
            } else {
                self.displayMyAlertMessage(userMessage: "Help \(String.init(data: data, encoding: .utf8) ?? "No alert")")
            }
//            semaphore signal
            //self.displayMyAlertMessage(userMessage: "Register Complete")
        }
        //semaphotre
        task.resume()
    }
    func displayMyAlertMessage(userMessage:String) {
            let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
            myAlert.addAction(okAction);
            self.present(myAlert, animated:true, completion:nil);
            
        }
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
