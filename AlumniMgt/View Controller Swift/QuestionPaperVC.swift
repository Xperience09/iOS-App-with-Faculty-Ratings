//
//  QuestionPaperVC.swift
//  AlumniMgt
//
//  Created by Xperience 09 on 10/24/20.
//  Copyright © 2020 Xperience 09. All rights reserved.
//

import UIKit



class QuestionPaperVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    static var subj = ""
    
    var dldQP = [ "dld1" , "dld2" ]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func DLD(_ sender: Any) {
        DispatchQueue.main.async {
            QuestionPaperVC.subj = "DLD"
        
            self.performSegue(withIdentifier: "ShowQP", sender: self)
            print(QuestionPaperVC.subj)
        }
    }
    
    
    @IBAction func DSA(_ sender: Any) {
        DispatchQueue.main.async {
            QuestionPaperVC.subj = "DSA"
        
            self.performSegue(withIdentifier: "ShowQP", sender: self)
            print(QuestionPaperVC.subj)
        }
    }
    
    @IBAction func Calculus(_ sender: Any) {
        DispatchQueue.main.async {
            QuestionPaperVC.subj = "Calculus"
        
            self.performSegue(withIdentifier: "ShowQP", sender: self)
            print(QuestionPaperVC.subj)
        }
    }
    
    @IBAction func DiscreteMaths(_ sender: Any) {
        DispatchQueue.main.async {
            QuestionPaperVC.subj = "Discrete Maths"
        
            self.performSegue(withIdentifier: "ShowQP", sender: self)
            print(QuestionPaperVC.subj)
        }
    }
    
    @IBAction func Chemistry(_ sender: Any) {
        DispatchQueue.main.async {
            QuestionPaperVC.subj = "Chemistry"
        
            self.performSegue(withIdentifier: "ShowQP", sender: self)
            print(QuestionPaperVC.subj)
        }
    }
     
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (QuestionPaperVC.subj == "DLD"){
        return dldQP.count
        }
        
        else{
        return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionPaperTableViewCell", for: indexPath) as! QuestionPaperTableViewCell
        
        if (QuestionPaperVC.subj == "DLD"){
           //cell.QuestionPaper.image = UIImage(named: "dld")
            //cell.QuestionPaper.image = UIImage(named: "dld2")
            
            let imageStr = dldQP[indexPath.row]
            let image = UIImage(named:imageStr)
            cell.QuestionPaper.image = image
            
            return cell
            //cell.QuestionPaper.image = ((dldQP[indexPath.row]) as! UIImage)
        }
        
        else if (QuestionPaperVC.subj == "DSA"){
            cell.QuestionPaper.image = UIImage(named:"DSA")
            return cell
        }
        
        else if (QuestionPaperVC.subj == "Calculus"){
            cell.QuestionPaper.image = UIImage(named: "Calculus")
            return cell
        }
        
        else if (QuestionPaperVC.subj == "Discrete Maths"){
            cell.QuestionPaper.image = UIImage(named: "Discrete Maths")
            return cell
        }
        
        else if (QuestionPaperVC.subj == "Chemistry"){
            cell.QuestionPaper.image = UIImage(named: "Chemistry")
            return cell
        }
        else{
            cell.QuestionPaper.image = UIImage(named: "q")
            return cell
        }
        
        
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(QuestionPaperVC.subj)
        // nib
        let nib = UINib(nibName: "QuestionPaperTableViewCell", bundle: nil)
        tableView?.register(nib,forCellReuseIdentifier:"QuestionPaperTableViewCell")

        // Do any additional setup after loading the view.
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
