//
//  AuthorizationController.swift
//  HairSalone New 1.0
//
//  Created by Elvin778 on 06.05.17.
//  Copyright © 2017 Elvin778. All rights reserved.
//

import UIKit


class AuthorizationController: UIViewController {
    @IBOutlet weak var passwordField : UITextField!
    @IBOutlet weak var cpasswordField : UITextField!
    @IBOutlet weak var emailField : UITextField!
    @IBAction func signInButton(sender: UIButton) {
        
            // prepare json data
            let json: [String: Any] = ["email" : emailField.text!, "password" : passwordField.text!]
            let jsonData = try? JSONSerialization.data(withJSONObject: json)
            
            // create post request
            let url = URL(string: "https://hair-salon-personal.herokuapp.com/login/login")!
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

                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                if let responseJSON = responseJSON as? [String: Any] {
                    if let token = responseJSON ["token"]{
                        print (token)
                    }
                } else {
                
                }
                //            semaphore signal
                //self.displayMyAlertMessage(userMessage: "Register Complete")
            }
            //semaphotre
            task.resume()
        }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
