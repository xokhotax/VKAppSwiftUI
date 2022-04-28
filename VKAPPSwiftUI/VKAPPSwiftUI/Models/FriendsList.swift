//
//  FriendsList.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 28.04.2022.
//

import Foundation

struct Friend: Identifiable {
    let name: String
  let pictures: [String]
    let id = UUID()
}

let friendsList = [
  Friend(name: "Bart", pictures: ["Bart"]),
  Friend(name: "Homer", pictures: ["Homer"]),
  Friend(name: "Lois", pictures: ["Lois"]),
  Friend(name: "Chris", pictures: ["Chris"]),
  Friend(name: "Meg", pictures: ["Meg"])
]
