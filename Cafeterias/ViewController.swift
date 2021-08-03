//
//  ViewController.swift
//  Cafeterias
//
//

import UIKit
import Firebase
class ViewController: UIViewController {
    
    let ref =  Database.database().reference()
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
      /*  self.ref.child("cafeterias").child("fime").child("botanas").child("doritos").child("price").setValue(50)
        self.ref.child("cafeterias").child("fime").child("botanas").child("doritos").child("name").setValue("Doritos Nacho")
        self.ref.child("cafeterias").child("civil").child("botanas").child("doritos").child("price").setValue(50)
        self.ref.child("cafeterias").child("civil").child("botanas").child("doritos").child("name").setValue("Doritos Nacho")
        self.ref.child("cafeterias").child("facpya").child("botanas").child("doritos").child("price").setValue(50)
        self.ref.child("cafeterias").child("facpya").child("botanas").child("doritos").child("name").setValue("Doritos Nacho")*/
        self.ref.child("cafeterias").observeSingleEvent(of: .value){
         (snapshot) in
         let data =  snapshot.value as? [String:Any]
     //    print(data!)
         print(data!)
         if let unwrapped = data {
             for cafe in unwrapped{
                 print(cafe.key)
                 let cafet = cafeteria(name:cafe.key)
               self.cafes.append(cafet)
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
        print(con.name)
        cell.cafeName.text = con.name
        
        
        return cell
    }
}

