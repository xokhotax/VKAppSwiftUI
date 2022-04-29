//
//  Models.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 28.04.2022.
//

import Foundation

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
