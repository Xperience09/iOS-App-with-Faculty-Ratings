//
//  ViewController.swift
//  AlumniMgt
//
//  Created by Xperience 09 on 8/23/20.
//  Copyright © 2020 Xperience 09. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }
    
   // Put this piece of code anywhere you like
    
    // MARK: Code for Segue
    @IBAction func back(segue: UIStoryboardSegue){
        
    }
    
}


   // MARK: - For dismissing keyboard when tapped anywhere in the screen

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    
    

    
    // MARK: - For Event Table
    
}
