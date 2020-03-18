//
//  ViewController.swift
//  RelamDemo
//
//  Created by Rohit Gupta on 17/02/20.
//  Copyright © 2020 Sahabe Alam. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var listTableView: UITableView!

    
    var listArray = [SurveyListObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()
       // callForSubjectList()
        
        
        // Do any additional setup after loading the view.
//     let notes = ["sagar","shubham","vishal","Alam","Kartik"]
        
     /* let realm = try! Realm()
        print(realm.configuration.description)
        print(realm.configuration.deleteRealmIfMigrationNeeded.description)
        
       
        realm.beginWrite()
        for text in notes
        {
            let note = NoteModel()
            note.name = text
            realm.add(note)
        }
        try! realm.commitWrite()
        
        
        // Get Data From list..
        let results = realm.objects(NoteModel.self)
        print(results)
        for result in results
        {
            print(result.name)
        }
        */
        
       /*
        //Delete
        try! realm.write {
         realm.delete(note)

        }
        */
        
      /*
         // Add Note MOdel
        let note = NoteModel()
        note.id = 1
        note.title = "Remember the milk!"
        note.text = "Mom asked if I could bring a gallon of milk home."
        note.name = "Sagar"

        try! realm.write{
            realm.add(note)
        }
        */
        
    }

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
            let obj = self.listArray[indexPath.row]
            print(obj)
            cell.lable1.text = obj.title
            cell.lable2.text = "\(obj.id)"
            return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 210
        }

    
}

extension ViewController{
    
//    func callForSubjectList(){
//
//        let urlStr = "https://jsonplaceholder.typicode.com/todos"
//        print(urlStr)
//        NetworkManager.sharedInstance.networkCall(header: [:], url: urlStr, method: .get, parameters: nil , completionHandler:  { (json, status) in
//            if status as? Int == 200{
//                let realm = try! Realm()
//                print(realm.configuration.description)
//                print(realm.configuration.deleteRealmIfMigrationNeeded.description)
//
//                let arr = json?.array
//                 realm.beginWrite()
//                for obj in arr ?? []
//                 {
//                    let list = ListModel()
//                    list.title = obj["title"].stringValue
//                    list.id = obj["id"].intValue
//                    list.userId = obj["userId"].intValue
//                    list.completed = obj["completed"].boolValue
//                    realm.add(list)
//                 }
//                 try! realm.commitWrite()
//
//                // Get Data From list..
//                let results = realm.objects(ListModel.self)
//                print(results)
//                for item in results
//                {
//                    self.listArray.append(item)
//                }
//                self.listTableView.reloadData()
//                print(self.listArray)
//
//            }
//            else{
//                print("Error")
//            }
//        })
//    }
    
}

extension ViewController{
    
    func callAPI() {
      print("http://202.21.33.20/api/v1/mobile/site-survey?status=all")
        APIClient.getSurveyList(urlString: "http://202.21.33.20/api/v1/mobile/site-survey?status=all") { (list) in
            var arr = [RelamSurveyList]()
            var arr1 = [SurveyListObject]()

            let realm = try! Realm()
            print(realm.configuration.description)
            print(realm.configuration.deleteRealmIfMigrationNeeded.description)
            realm.beginWrite()
            
            for list in list?.object ?? []{
                arr1.append(list)
            }
            
        }

    }
}
