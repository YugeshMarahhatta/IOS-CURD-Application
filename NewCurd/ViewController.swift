//
//  ViewController.swift
//  NewCurd
//
//  Created by Yugesh Marahatta on 24/06/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var Section_Name_box: UITextField!

    
    var Data = [DataList]()
    var cSectionText : UITextField?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func fetchData(){
        //let url = URL(string: "http://localhost/CURDApplication/getdata.php/")
        let url = URL(string: "http://192.168.68.105/CURDApplication/getdata.php")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            guard let data = data, error == nil else {
                print("Error occured while accessing data with url")
                return
            }
            var cList = [DataList]()
            do {
                cList = try JSONDecoder().decode([DataList].self, from: data)
                
            }
            catch {
                print("Error occured while decoding JSON into SWIFT structure \(error)")
            }
            
            //assigning data from empty array
            self.Data = cList
            
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }

        })
        dataTask.resume()
    }
    
   

    
    // function for inserting data in database
    @IBAction func AddNewSection(_ sender: Any) {
        
        if self.Section_Name_box.text != ""
        {
            print("Pressed")
        if let Section_Name = self.Section_Name_box.text
        {
            let params = "a="+Section_Name
            print("\(params)")
            let regUrl = "http://192.168.68.105/CURDApplication/insert.php/post"
            let request = NSMutableURLRequest(url: NSURL(string: regUrl)! as URL)
            let session = URLSession.shared
            
            request.httpMethod = "POST"
            request.httpBody = params.data(using: String.Encoding.utf8)
//            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = session.dataTask(with: request as URLRequest) { data, response, error in
                guard data != nil else {
                    print("no data found \(error)")
                    return
                }
                print("data \(data)")
            }
            print("All Done!!")
            task.resume()
            }
        
       
        else {
            print("Textfield is empty")
        }
        }
        else {
            // create the alert
                    let alert = UIAlertController(title: "Error !!!", message: "Please enter Location", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
        
   
        Section_Name_box.text = ""
        fetchData()
  
    }
    
    //function for swipe
    func editClicked(indexVal:Int,indexPathVal:IndexPath){
        print("Hello Edit")
        
        //myTableView.beginUpdates()
        
        let vc = UIAlertController(title: "Enter value ?", message: nil, preferredStyle: .alert)
        vc.addTextField()
        
        let submitAction = UIAlertAction(title: "Update", style: .default,handler: { _ in
            let textObj = vc.textFields![0]
            var name = textObj.text!
            print("\(name)")
            
            var id = "\(self.Data[indexVal].Section_ID)"
            print("\(id)")
            // send data ho page
         
            let params = "a="+name+"&b="+id
            print("\(params)")
            let regUrl = "http://192.168.68.105/CURDApplication/update.php"
            let request = NSMutableURLRequest(url: NSURL(string: regUrl)! as URL)
            let session = URLSession.shared
            
            request.httpMethod = "POST"
            request.httpBody = params.data(using: String.Encoding.utf8)
//            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = session.dataTask(with: request as URLRequest) { data, response, error in
                guard data != nil else {
                    print("no data found \(error)")

                    return
                }
                print("data \(data)")
              
            }
            print("All Done!!")
            task.resume()
            
         
            
            // end
            
        })
        vc.addAction(submitAction)
        present(vc, animated: true)
        
        //reload data
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
        fetchData()
        
    }
    func deleteClicked(indexVal:Int,indexPathVal:IndexPath){
            var id = "\(self.Data[indexVal].Section_ID)"
            print("\(id)")
            // send data ho page
            
            let params = "a="+id
            print("\(params)")
            let regUrl = "http://192.168.68.105/CURDApplication/delete.php"
            let request = NSMutableURLRequest(url: NSURL(string: regUrl)! as URL)
            let session = URLSession.shared
            
            request.httpMethod = "POST"
            request.httpBody = params.data(using: String.Encoding.utf8)
//            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = session.dataTask(with: request as URLRequest) { data, response, error in
                guard data != nil else {
                    print("no data found \(error)")
                    return
                }
                print("data \(data)")
            }
        //var ID = "\(self.Data[indexVal].Section_ID)"
                print("Deleted!!!")
                task.resume()
                
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
        fetchData()
        
    }
    
    //end of class
    }

// end of inserting data

//using extension for UITABLEVIEW

extension ViewController: UITableViewDelegate,UITableViewDataSource
    {
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Data.count
        }
        
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "\(self.Data[indexPath.row].Section_ID) .             \(self.Data[indexPath.row].Section_Name)"
            return cell
        }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let btnDelete = UIContextualAction(style: .normal, title: "Delete") {(action,view,completion) in
            print("Delete Clicked")
            self.deleteClicked(indexVal:indexPath.row,indexPathVal:indexPath)
            completion(true)
        
        }
        btnDelete.backgroundColor = .blue
        
        let btnEdit = UIContextualAction(style: .normal, title: "Edit") {(action,view,completion) in
            print("Edit Clicked")
            self.editClicked(indexVal:indexPath.row,indexPathVal:indexPath)
            completion(true)
        
        }
        btnEdit.backgroundColor = .green
        
        
        let btnCancel = UIContextualAction(style: .normal, title: "Cancel") {(action,view,completion) in
            print("Canceled")
            
            completion(true)
        
        }
        btnCancel.backgroundColor = .red
        
        
        
        let config = UISwipeActionsConfiguration(actions:[btnCancel,btnEdit,btnDelete])
        return config
    }
}
    
    
    //for delete
    /*func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.Data.remove(at: indexPath.row)
            self.myTableView.reloadData()
            print("Deleted")
        }
    
    }*/
    //for edir
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        //delete
//        let deleteButton = UITableViewRowAction(style: .normal, title: "Delete") { rowAction, indexPath in
//            self.Data.remove(at: indexPath.row)
//            self.myTableView.reloadData()
//            print("Deleted")
//        }
//        deleteButton.backgroundColor = UIColor.gray
//        //edit
//        let editButton = UITableViewRowAction(style: .default, title: "Edit") { rowAction, indexPath in
//            print("Edited")
//        }
//
//        editButton.backgroundColor = UIColor.green
//        //cancel
//        let cancelButton = UITableViewRowAction(style: .default, title: "Cancel") { rowAction, indexPath in
//            print("Canceled")
//        }
//        editButton.backgroundColor = UIColor.green
//        return[cancelButton,editButton,deleteButton]
//
//    }
//
    
    // edit data in alert box
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sectionSelected = Data[indexPath.row]
        let dialogMessage = UIAlertController(title: "Edit Operation", message: "Edit name of Location", preferredStyle: .alert)
        
        let update = UIAlertAction(title: "Update", style: .default) { (action) in
            let updatedSection = self.cSectionText!.text
            self.Data[indexPath.row].Section_Name = updatedSection!
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Edit operation Cancelled by User")
        }
        dialogMessage.addAction(update)
        dialogMessage.addAction(cancel)
        
        dialogMessage.addTextField { (textfield) in
            self.cSectionText = textfield
            self.cSectionText?.placeholder = "Update Locatoin"
        }
    }
    
    */
  
    


