//
//  Models.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 28.04.2022.
//

import Foundation
// import UIKit
// import SwiftyJSON
// import RealmSwift

struct Groups: Identifiable {
  let name: String
  let id = UUID()
}

let groupsList = [
  Groups(name: "Pikabu"),
  Groups(name: "Music"),
  Groups(name: "Cartoons"),
  Groups(name: "Swift"),
  Groups(name: "Punk")
]



//class Groups: Object {
//  @Persisted var name: String = ""
//  @Persisted  var photoUrl: String = ""
//  @objc dynamic var avatar: URL? { URL(string: "\(photoUrl)") }
//  @Persisted var id = ""
//  
//  override static func primaryKey() -> String? {
//    return "id"
//  }
//  
//  convenience init(json: SwiftyJSON.JSON) {
//    self.init()
//    
//    self.name = json["name"].stringValue
//    self.photoUrl = json["photo_100"].stringValue
//    self.id = json["id"].stringValue
//  }
//}
