//
//  DisplayRatingsViewController.swift
//  AlumniMgt
//
//  Created by Xperience 09 on 10/3/20.
//  Copyright © 2020 Xperience 09. All rights reserved.
//

import UIKit


     var a = "hi"
var b=""
var c=""
var txt=""


class DisplayRatingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var fName: UILabel?
    @IBOutlet weak var fRating: UILabel?
    @IBOutlet weak var fReview: UILabel?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Creating Arrays
    var name: [AnyObject] = []
    var rating: [AnyObject] = []
    var review: [AnyObject] = []
    var fCode: [AnyObject] = []
    
    var facName: [AnyObject] = []
    var facRating: [AnyObject] = []
    var facReview: [AnyObject] = []
    
   
    
    var searchedName: [AnyObject]!
    
    static var i : NSString?
    var j = 0
    
    
    
    
        
    // Assigning Number of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedName.count
    }
    
    
    // Providing Info for rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        
            cell.Name.text = (searchedName[indexPath.row] as! String)
        //txt=(searchedName[indexPath.row] as! String)
        //txt=cell.Name.text!
        //cell.Rating.text = (rating[indexPath.row] as! String)
            //cell.Review.text = (review[indexPath.row]as! String)
        
        
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
        
        //register the cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // join the table to the TableViewCell
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView?.register(nib,forCellReuseIdentifier:"TableViewCell")
        
        
        
        //get the values from sql/Json
              let url = NSURL(string: "http://192.168.64.6/AlumniMgt/Faculty_Ratings.php")
              
                let data = NSData(contentsOf: url! as URL)
                let tmpValues = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                //tmpValues = tmpValues.reversed() as NSArray
                reloadInputViews()
                
                
                for candidate in tmpValues {
                   if let cdict = candidate as? NSDictionary {
                    
                    //Name is the column name in sql/json
                    let Name = cdict["Name"]
                    self.name.append(Name! as AnyObject)
                    
                    //Rating
                    let Rating = cdict["Rating"]
                    self.rating.append(Rating! as AnyObject)
                    
                    // Number of Reviews
                    let Review = cdict["Student_Reviews"]
                    self.review.append(Review! as AnyObject)
                       
                       let fCode = cdict["Fac_code"]
                       self.fCode.append(fCode! as AnyObject)
                       
           
                    }
                }
         searchedName = name
        searchBar?.delegate=self
        //print(searchedName)
        
        DispatchQueue.main.async{
            self.fName?.text = a
            self.fRating?.text = b
            self.fReview?.text = c
        }
    }
    
    
    
    //MARK: Search Bar Config
    
func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    searchedName = []
    
    if searchText==""{
        searchedName=name
    }
    else{
        for i in name{
            if i.contains(searchText){
                searchedName.append(i)
                //a=IndexPath.searchedName[indexPath.row]
            }
        }
    }
    self.tableView.reloadData()
   
    
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        
        
        
        
        //print((cell.Name.text)as! String)
        DisplayRatingsViewController.i=(cell.Name.text)!as NSString
        //print(DisplayRatingsViewController.i)
        
        
       // DispatchQueue.main.async{
        //MARK: show specific rating
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.64.6/AlumniMgt/specificFaculty.php")! as URL)
        request.httpMethod = "POST"
        
        let postString = "a=\(DisplayRatingsViewController.i!)"
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(String(describing: error))")
                return
            }
            
            //print("response = \(String(describing: response))")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
           // print("responseString = \(String(describing: responseString))")
            
            let tmpValues = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
            //tmpValues = tmpValues.reversed() as NSArray
           // self.reloadInputViews()
            
            for candidate in tmpValues {
               if let cdict = candidate as? NSDictionary {
                
                //Username is the column name in sql/json
                let messg = cdict["Name"]
                   self.facName.append(messg! as AnyObject)
                   //print(facName)
                
                let index = cdict ["Student_Reviews"]
                   self.facReview.append(index! as AnyObject)
                
                let ans = cdict ["Rating"]
                   self.facRating.append(ans! as AnyObject)
                   
                   //print(facName[0] as! String)
                }
            }
            //print(facName[indexPath.row] as! String)
            
            
            a = (self.facName[0] as! String)
            self.facName.removeAll()
            //fName?.text = "Sup"
            
            //self.fRating.text = (facRating[0] as! String)
            b = (self.facRating[0] as! String)
            self.facRating.removeAll()
            //self.fReview.text = (facReview[0] as! String)
            c = (self.facReview[0] as! String)
            self.facReview.removeAll()
        
        }
        task.resume()
    
        performSegue(withIdentifier: "selectedFaculty", sender: self)
      
    }
        
    }
    
    
    
  
    
 
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

