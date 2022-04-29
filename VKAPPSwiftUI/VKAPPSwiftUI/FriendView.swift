//
//  FriendView.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 28.04.2022.
//

import SwiftUI

struct FriendView: View {
  
  var friend: Friend
  
  var body: some View {
    VStack {
      Text(friend.name)
      
      Image(friend.pictures[0])
        .resizable()
        .frame(width: 150, height: 150, alignment: .top)
      Spacer()
      
    }
  }
}
