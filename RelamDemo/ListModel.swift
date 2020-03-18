//
//  ListModel.swift
//  RelamDemo
//
//  Created by Rohit Gupta on 17/02/20.
//  Copyright © 2020 Sahabe Alam. All rights reserved.
//

import UIKit
import RealmSwift
//import SwiftyJSON
class RelamSurveyList: Object {
    
//     dynamic var id = 0
//     dynamic var userId = 0
//     dynamic var title = ""
//     dynamic var completed = false
       dynamic var id : Int?
       dynamic var title : String?
       dynamic var status : String?
       dynamic var isDeleted : Bool?
       dynamic var created_at : String?
       dynamic var images : [String]?
       dynamic var coordinates : [String]?
       dynamic var address : String?
       dynamic var createdBy : String?
       dynamic var contactPerson:String?
       dynamic var region:String = ""
       dynamic var project : String?
       dynamic var legal : String?
       dynamic var operations : String?
    

    /*
    override static func primaryKey() -> String? { //you need this in case you will want to update this object in Realm
         return "id"
      }
    override init(data: JSON) {

         self.id = data["id"].intValue
         self.userId = data["userId"].intValue
         self.completed = data["completed"].boolValue
         self.title = data["title"].stringValue
      }
    
    */
    
}

struct SurveyList:Decodable {
    let error : Bool?
    let object : [SurveyListObject]?
    let message : String?
    let extendedMessage : String?
    let status : Int?
    let timeStamp : Int?
}

struct SurveyListObject : Decodable {
    let id : Int?
    let title : String?
    let status : String?
    let isDeleted : Bool?
    let created_at : String?
    let images : [String]?
    let coordinates : [String]?
    let address : String?
    let createdBy : String?
    let contactPerson:String?
    let region:String
    let project : String?
    let legal : String?
    let operations : String?
    
  init(id:Int,title:String,status:String,isDeleted:Bool,created_at:String,images:[String],coordinates:[String],address:String,createdBy:String,contactPerson:String,region:String,project:String,legal:String,operations:String) {
        self.id = id
        self.title = title
        self.status = status
        self.isDeleted = isDeleted
        self.created_at = created_at
        self.images = images
        self.coordinates = coordinates
        self.address = address
        self.createdBy = createdBy
        self.contactPerson = contactPerson
        self.region = region
        self.project = project
        self.legal = legal
        self.operations = operations
    }

}


extension SurveyListObject{
    init(relamSurveyList:RelamSurveyList) {
        self.id = relamSurveyList.id
        self.title = relamSurveyList.title
        self.status = relamSurveyList.status
        self.isDeleted = relamSurveyList.isDeleted
        self.created_at = relamSurveyList.created_at
        self.images = relamSurveyList.images
        self.coordinates = relamSurveyList.coordinates
        self.address = relamSurveyList.address
        self.createdBy = relamSurveyList.createdBy
        self.contactPerson = relamSurveyList.contactPerson
        self.region = relamSurveyList.region
        self.project = relamSurveyList.project
        self.legal = relamSurveyList.legal
        self.operations = relamSurveyList.operations

    }
}

extension RelamSurveyList{
    convenience init(surveyList:SurveyListObject) {
        self.init()
        self.id = surveyList.id
        self.title = surveyList.title
        self.status = surveyList.status
        self.isDeleted = surveyList.isDeleted
        self.created_at = surveyList.created_at
        self.images = surveyList.images
        self.coordinates = surveyList.coordinates
        self.address = surveyList.address
        self.createdBy = surveyList.createdBy
        self.contactPerson = surveyList.contactPerson
        self.region = surveyList.region
        self.project = surveyList.project
        self.legal = surveyList.legal
        self.operations = surveyList.operations

    }
}
