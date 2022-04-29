//
//  EventVC.swift
//  AlumniMgt
//
//  Created by Xperience 09 on 10/5/20.
//  Copyright © 2020 Xperience 09. All rights reserved.
//

import UIKit

class EventVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // Creating Arrays
    var name: [AnyObject] = []
    var desc: [AnyObject] = []
    var time: [AnyObject] = []
    
    
    
        
    // Assigning Number of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.name.count
    }
    
    
    // Providing Info for rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as! EventTableViewCell
        
        
            cell.Name.text = (name[indexPath.row] as! String)
            cell.Details.text = (desc[indexPath.row] as! String)
            cell.Time.text = (time[indexPath.row]as! String)
        
        
        return cell
    }
    
    // Section (Collection of same group of rows) (Repetition)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide the keyboard when tapped arround
        self.hideKeyboardWhenTappedAround()
        
        // join the table to the TableViewCell
        let nib = UINib(nibName: "EventTableViewCell", bundle: nil)
        tableView.register(nib,forCellReuseIdentifier:"EventTableViewCell")
        
        
        
        //get the values from sql/Json
              let url = NSURL(string: "http://192.168.64.6/AlumniMgt/Event.php")
              
                let data = NSData(contentsOf: url! as URL)
                var tmpValues = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                tmpValues = tmpValues.reversed() as NSArray
                reloadInputViews()
                
                
                for candidate in tmpValues {
                   if let cdict = candidate as? NSDictionary {
                    
                    //Name is the column name in sql/json
                    let Name = cdict["e_name"]
                    self.name.append(Name! as AnyObject)
                    
                    //Rating
                    let Description = cdict["e_desc"]
                    self.desc.append(Description! as AnyObject)
                    
                    // Number of Reviews
                    let Time = cdict["e_date"]
                    self.time.append(Time! as AnyObject)
           
                    }
                }
        
       
    }
    
    
   
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
