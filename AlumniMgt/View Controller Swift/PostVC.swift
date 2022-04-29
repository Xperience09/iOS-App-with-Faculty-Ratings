//
//  PostVC.swift
//  AlumniMgt
//
//  Created by Xperience 09 on 10/15/20.
//  Copyright © 2020 Xperience 09. All rights reserved.
//

import UIKit

class PostVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    //array
        var values: [AnyObject] = []
    var index: [AnyObject] = []
    var reply: [AnyObject] = []
    static var i : NSInteger?
    var j = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell.Question.text = (values[indexPath.row] as! String)
        if ((reply[indexPath.row] as? String) == nil){
            cell.Answer.text = "No Reply Yet! Click To Add."
        }
        else{
        cell.Answer.text = (reply[indexPath.row] as? String)
        }
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Selected row info.
        
        PostVC.i = NSInteger(index[indexPath.item] as! String)!
                   // i = index[indexPath.item]
        //print(PostVC.i!)
        
        
        
        
        
        
        
        // Show chat messg
        performSegue(withIdentifier: "AddAnswer", sender: (self))
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    
  
    
// MARK: - Add Question
    
    @IBOutlet weak var AddQuestion: UITextView!
    @IBAction func SubmitQuestion(_ sender: Any) {
        //put the link of the php file here. The php file connects the mysql and swift
        if (AddQuestion.text != ""){
                let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.64.6/AlumniMgt/AddQuestion.php")! as URL)
                request.httpMethod = "POST"
                
                let postString = "a=\(AddQuestion.text!)"
                
                
                request.httpBody = postString.data(using: String.Encoding.utf8)
                
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
                
                
                let alertController = UIAlertController(title: "Question", message:
                                                            "Successfully Added", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
        
                AddQuestion.text = ""
        }
        else{
            let alertController = UIAlertController(title: "Error!", message:
                                                        "Question Needed", preferredStyle: UIAlertController.Style.alert)
    alertController.addAction(UIAlertAction(title: "Try Again!", style: UIAlertAction.Style.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }

    }
    
    
    
    
    
    
    
//MARK: - Add Answer
    
    @IBOutlet weak var AddAnswer: UITextView!
    @IBAction func SubmitAnswer(_ sender: Any) {
        DispatchQueue.main.async{
        
            if (self.AddAnswer.text != ""){
        //put the link of the php file here. The php file connects the mysql and swift
                let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.64.6/AlumniMgt/AddAnswer.php")! as URL)
                request.httpMethod = "POST"
                
            let postString = "a=\(self.AddAnswer.text!) & b=\(PostVC.i!)"
                
                
                request.httpBody = postString.data(using: String.Encoding.utf8)
                
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
                
                
                let alertController = UIAlertController(title: "Answer", message:
                                                            "Successfully Added", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
        
        
            self.AddAnswer.text = ""
        }
            else{
                let alertController = UIAlertController(title: "Error!", message:
                                                            "Answer Needed", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Try Again!", style: UIAlertAction.Style.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    
    
    
    
    
//MARK: - RETRIEVE DATA
    override func viewDidLoad() {
       // print(MessgViewController.i as Any)
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        //register the cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //nib
        let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView?.register(nib,forCellReuseIdentifier:"PostTableViewCell")
        
        // Retriving data from the table Message
        //get the values from sql/Json
              let url = NSURL(string: "http://192.168.64.6/AlumniMgt/ShowPost.php")
              
                let data = NSData(contentsOf: url! as URL)
                var tmpValues = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                tmpValues = tmpValues.reversed() as NSArray
                reloadInputViews()
                
                
                for candidate in tmpValues {
                   if let cdict = candidate as? NSDictionary {
                    
                    //Username is the column name in sql/json
                    let messg = cdict["question"]
                    self.values.append(messg! as AnyObject)
                    
                    let index = cdict ["id"]
                    self.index.append(index! as AnyObject)
                    
                    let ans = cdict ["answer"]
                    self.reply.append(ans! as AnyObject)
           
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
