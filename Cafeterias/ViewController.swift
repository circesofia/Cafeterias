//
//  ViewController.swift
//  Cafeterias
//
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseStorageUI
import Nuke
class ViewController: UIViewController {
    
    let ref =  Database.database().reference()
    let storage = Storage.storage()
    var cafes = [cafeteria]()
    
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
     //    print(data!)
         
         if let unwrapped = data {
            
             for cafe in unwrapped{
                let  nombre = cafe.value as! [String:Any]
                
                let cafeteria = cafeteria(name: cafe.key as! String, image: nombre["imagePath"] as! String)
                self.cafes.append(cafeteria)
                
               self.tableView.reloadData()
             }
            print(self.cafes.count)
         }
         
        }
         
        print("here ", cafes.count)
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
        
            
             
              let cell = tableView.dequeueReusableCell(withIdentifier: "cafeteria", for: indexPath) as! TableViewCell
              
              let con = cafes[indexPath.row]
               //imageReference
              cell.cafeName.text = con.name
             
            
              let url = URL(string: cafes[indexPath.row].image)
              Nuke.loadImage(with: url! , into: cell.cafeImage)
              cell.cafeImage.layer.cornerRadius = cell.frame.height / 2
             
              return cell

    }
}

