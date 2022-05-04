//
//  FriendView.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 28.04.2022.
//

import SwiftUI
import Kingfisher

struct FriendView: View {
  
  var friend: FriendsVK
  
  var body: some View {
    VStack {
      Text(friend.firstName)
      KFImage(friend.friendAvatar!)
        .resizable()
        .frame(width: 150, height: 150, alignment: .top)
      Spacer()
      
    }
  }
}
