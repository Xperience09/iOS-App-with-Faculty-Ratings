//
//  LogInViewController.swift
//  AlumniMgt
//
//  Created by Xperience 09 on 10/1/20.
//  Copyright © 2020 Xperience 09. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }
    
// MARK: - For admin Login
    
    @IBOutlet weak var AdminUsername: UITextField!
    @IBOutlet weak var AdminPassword: UITextField!
    var a=""
    
    var user=""
   // var type=""
    
    @IBAction func AdminLogin(_ sender: Any) {
        //put the link of the php file here. The php file connects the mysql and swift
                let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.64.6/AlumniMgt/Admin_Login.php")! as URL)
                request.httpMethod = "POST"
                 let postString = "a=\(AdminUsername.text!) & b=\(AdminPassword.text!) "
                
                
                request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { [self]
                    data, response, error in
                    
                    if error != nil {
                        print("error=\(String(describing: error))")
                        
                        return
                    }
                    
                    let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                        self.a=(String(describing: responseString))
                        print(self.a)
            
            DispatchQueue.main.async {
                // if the username and password is correct
            if (self.a=="Optional(Success)"){
               
                performSegue(withIdentifier: "AdminGo", sender: self)
               
                                
                    }
            
            else{
                //show error alert
                    let alertController = UIAlertController(title: "Error!", message: "Incorrect Username or Password", preferredStyle: UIAlertController.Style.alert)
                    alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default,handler: nil))
                            
                            self.present(alertController, animated: true, completion: nil)
            }
            }
                       
                        
                    
                
                }
                task.resume()
        
       

        
        
    }
    
    
    
// MARK: - For alumni Login
    
    @IBOutlet weak var AlumniUsername: UITextField!
    @IBOutlet weak var AlumniPassword: UITextField!
    
    @IBAction func AlumniLogin(_ sender: Any) {
        
        
        //put the link of the php file here. The php file connects the mysql and swift
                let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.64.6/AlumniMgt/Alumni_Login.php")! as URL)
                request.httpMethod = "POST"
                 let postString = "a=\(AlumniUsername.text!) & b=\(AlumniPassword.text!) "
                
                
                request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { [self]
                    data, response, error in
                    
                    if error != nil {
                        print("error=\(String(describing: error))")
                        
                        return
                    }
                    
                    let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                        self.a=(String(describing: responseString))
                        print(self.a)
            
            DispatchQueue.main.async {
                // if the username and password is correct
            if (self.a=="Optional(Success)"){
                
                // proceeed to another page
                performSegue(withIdentifier: "AlumniGo", sender: self)
               // user = AlumniUsername.text!
                //type = "Alumni"
                                
                    }
            
            else{
                
                // show error alert
                    let alertController = UIAlertController(title: "Error!", message: "Incorrect Username or Password", preferredStyle: UIAlertController.Style.alert)
                    alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default,handler: nil))
                            
                            self.present(alertController, animated: true, completion: nil)
            }
            }
                       
                        
                    
                
                }
                task.resume()
        
       
        
    }
    
    
    
// MARK: - For Student Login

    @IBOutlet weak var StudentUsername: UITextField!
    @IBOutlet weak var StudentPassword: UITextField!
    
    @IBAction func StudentLogin(_ sender: Any) {
        
        //put the link of the php file here. The php file connects the mysql and swift
                let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.64.6/AlumniMgt/Student_Login.php")! as URL)
                request.httpMethod = "POST"
                 let postString = "a=\(StudentUsername.text!) & b=\(StudentPassword.text!) "
                
                
                request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { [self]
                    data, response, error in
                    
                    if error != nil {
                        print("error=\(String(describing: error))")
                        
                        return
                    }
                    
                    let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                        self.a=(String(describing: responseString))
                        print(self.a)
            
            DispatchQueue.main.async {
                // if the username and password is correct
            if (self.a=="Optional(Success)"){
                
                // proceeed to another page
                performSegue(withIdentifier: "StudentGo", sender: self)
                //user = StudentUsername.text!
                //type = "Student"
                                
                    }
            
            else{
                // show error alert
                    let alertController = UIAlertController(title: "Error!", message: "Incorrect Username or Password", preferredStyle: UIAlertController.Style.alert)
                    alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default,handler: nil))
                            
                            self.present(alertController, animated: true, completion: nil)
            }
            }
                       
                        
                    
                
                }
                task.resume()
        
        
    }
    
    
    
    
    // Show info of the logged in user
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  segue.identifier == "AdminGo" || segue.identifier == "AlumniGo" || segue.identifier == "StudentGo" {
            
            guard segue.destination is HomeViewController else  { return }
            }
        }
    
    

}

