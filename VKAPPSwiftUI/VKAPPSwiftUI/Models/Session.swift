//
//  Session.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 29.04.2022.
//

import Foundation
import RealmSwift

class Session: RealmSwift.Object {
  @Persisted var token: String = ""
  @Persisted var userId: String = ""
  @Persisted var friendId: String = ""
  
  convenience init(token: String, userId: String, friendId: String) {
    self.init()
    self.token = token
    self.userId = userId
    self.friendId = friendId
  }
  public static let shared = Session()
  
}


