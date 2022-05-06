//
//  FriendsList.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 28.04.2022.
//

import SwiftyJSON
import RealmSwift
import UIKit

//MARK: - Online
 
class FriendsVK: Object, Identifiable  {
  @Persisted var firstName = ""
  @Persisted var lastName = ""
  @Persisted var friendImageUrlText = ""
  var friendAvatar: URL? { URL(string: "\(friendImageUrlText)") }
  var photosArray: [UIImage?] = []
  @Persisted var friendId = ""
  let id = UUID()
  
  override static func primaryKey() -> String? {
    return "friendId"
  }
  
  convenience init(json: SwiftyJSON.JSON) {
    self.init()
    
    self.firstName = json["first_name"].stringValue
    self.lastName = json["last_name"].stringValue
    self.friendImageUrlText = json["photo_200_orig"].stringValue
    self.friendId = json["id"].stringValue

  }
  public static let shared = FriendsVK()
}


class FriendID: ObservableObject {
  @Published var friendID = " "
  
}
