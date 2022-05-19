//
//  FriendsListRow.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 28.04.2022.
//

import SwiftUI
import Kingfisher

struct FriendsListRow: View {
  var friend: FriendsVK
  
  var body: some View {
    
    HStack {
      KFImage(friend.friendAvatar!)
        .resizable()
        .frame(width: 100, height: 100, alignment: .top)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
      VStack(alignment: .leading) {
        Text("\(friend.firstName) \(friend.lastName)")
      }
      Spacer()
    }
  }
}

