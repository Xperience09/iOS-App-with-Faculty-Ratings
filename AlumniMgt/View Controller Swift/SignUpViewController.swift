//
//  SignUpViewController.swift
//  AlumniMgt
//
//  Created by Xperience 09 on 10/1/20.
//  Copyright © 2020 Xperience 09. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Alumni Sign Up
    
    @IBOutlet weak var AlumniName: UITextField!
    @IBOutlet weak var AlumniEmail: UITextField!
    @IBOutlet weak var AlumniPassword: UITextField!
    @IBOutlet weak var AlumniBranch: UITextField!
    @IBOutlet weak var AlumniSession: UITextField!
    @IBOutlet weak var AlumniAddress: UITextField!
    @IBOutlet weak var AlumniCompany: UITextField!
    @IBOutlet weak var AlumniErrorLabel: UILabel!
    
    @IBAction func AlumniSignUp(_ sender: Any) {
        
        //put the link of the php file here. The php file connects the mysql and swift
                let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.64.6/AlumniMgt/Alumni_SignUp.php")! as URL)
                request.httpMethod = "POST"
                
        let postString = "a=\(AlumniName.text!) & b=\(AlumniPassword.text!) & c=\(AlumniEmail.text!) & d=\(AlumniSession.text!) & e=\(AlumniAddress.text!) & f=\(AlumniBranch.text!) & g=\(AlumniCompany.text!)"
                
                
                request.httpBody = postString.data(using: String.Encoding.utf8)
                
        
        // If all fields are filled
        if(!(AlumniName.text!.isEmpty || AlumniPassword.text!.isEmpty || AlumniEmail.text!.isEmpty || AlumniBranch.text!.isEmpty || AlumniCompany.text!.isEmpty || AlumniSession.text!.isEmpty || AlumniAddress.text!.isEmpty)){
            performSegue(withIdentifier: "AlumniLoginGo", sender: self)
                let task = URLSession.shared.dataTask(with: request as URLRequest) {
                    data, response, error in
                    
                    if error != nil {
                        print("error=\(String(describing: error))")
                        return
                    }
                    
                    print("response = \(String(describing: response))")
                    
                    let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    print("responseString = \(String(describing: responseString))")
                }
                task.resume()
            
                //alert
                let alertController = UIAlertController(title: "Alumni Info.", message:
                                                            "Successfully Added", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Proceed", style: UIAlertAction.Style.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
        
            AlumniName.text = ""
            AlumniPassword.text = ""
            AlumniEmail.text = ""
            AlumniBranch.text = ""
            AlumniCompany.text = ""
            AlumniSession.text = ""
            AlumniAddress.text = ""
            
            
        }
        
        // Any field left blank
        else{
                
            AlumniErrorLabel.text="All Fields Required! **"
            
        }
    }
    
    
    
    
    
    
    
    
// MARK: - Student Sign Up
    @IBOutlet weak var StudentName: UITextField!
    @IBOutlet weak var StudentEmail: UITextField!
    @IBOutlet weak var StudentPassword: UITextField!
    @IBOutlet weak var StudentGender: UITextField!
    @IBOutlet weak var StudentErrorLabel: UILabel!
    
    
    
    @IBAction func StudentSignUp(_ sender: Any) {
        
        //put the link of the php file here. The php file connects the mysql and swift
                let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.64.6/AlumniMgt/Student_SignUp.php")! as URL)
                request.httpMethod = "POST"
                
        let postString = "a=\(StudentName.text!) & b=\(StudentPassword.text!) & c=\(StudentEmail.text!) & d=\(StudentGender.text!)"
                
                
                request.httpBody = postString.data(using: String.Encoding.utf8)
                
        
        // If all fields are filled
        if(!((StudentName.text!.isEmpty || StudentPassword.text!.isEmpty || StudentEmail.text!.isEmpty || StudentGender.text!.isEmpty) || (StudentGender.text!.lowercased() != "male" && StudentGender.text!.lowercased() != "female"))){
            
           /* if (!(StudentGender.text?.caseInsensitiveCompare("male") == .orderedSame || StudentGender.text?.caseInsensitiveCompare("female") == .orderedSame)){
                StudentErrorLabel.text="**Incorrect Gender!!"
            
            }*/
            performSegue(withIdentifier: "StudentLoginGo", sender: self)
                let task = URLSession.shared.dataTask(with: request as URLRequest) {
                    data, response, error in
                    
                    if error != nil {
                        print("error=\(String(describing: error))")
                        return
                    }
                    
                    print("response = \(String(describing: response))")
                    
                    let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    print("responseString = \(String(describing: responseString))")
                }
                task.resume()
            
                //alert
                let alertController = UIAlertController(title: "Student Info.", message:
                                                            "Successfully Added", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Log In", style: UIAlertAction.Style.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
        
                self.StudentName.text = ""
                self.StudentPassword.text = ""
                self.StudentEmail.text = ""
                self.StudentGender.text = ""
            
            
              
            

        }
        
        // Any field left blank
        else{
            
            StudentErrorLabel.text="Invalid Fields ! **"
            
        }
    
    }
    
    
    
    
    
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if  segue.identifier == "StudentLoginGo" || segue.identifier == "AlumniLoginGo" {
            
            guard segue.destination is ViewController else  { return }
            }
       
    }
   
   

}
