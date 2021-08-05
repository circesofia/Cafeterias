//
//  ViewController.swift
//  Cafeterias
//
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseStorageUI
class ViewController: UIViewController {
    
    let ref =  Database.database().reference()
    // Get a reference to the storage service using the default Firebase App
    let storage = Storage.storage()
    

   
   
    
    var cafes = [cafeteria]()
    var cafes1 = ["name":"fime"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        dataFirebase()
    }
//trae los items
    func dataFirebase() {
        
        
        self.ref.child("cafeterias").observeSingleEvent(of: .value){
         (snapshot) in
         let data =  snapshot.value as? [String:Any]
     
         //print(data!)
         if let unwrapped = data {
             for cafe in unwrapped{
              //  print(cafe as AnyObject)
                 let cafet = cafeteria(name:cafe.key)
               self.cafes.append(cafet)
               self.tableView.reloadData()
             }
         
         }
         
        }
       
        
       

      
    }
    

          

}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let storageRef = storage.reference()
        
        
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cafeteria", for: indexPath) as! TableViewCell
        
        let con = cafes[indexPath.row]
        let ref = storageRef.child("\(con.name)\(".jpg")") //imageReference
        cell.cafeName.text = con.name
      
        cell.cafeImage.sd_setImage(with: ref)
        cell.cafeImage.layer.cornerRadius = cell.frame.height / 2
       
        return cell
    }
}

