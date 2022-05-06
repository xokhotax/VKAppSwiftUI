//
//  FriendView.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 28.04.2022.
//

import SwiftUI
import Kingfisher

struct FriendView: View {
  @EnvironmentObject var friendID: FriendID
  
  var friend: FriendsVK
  
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      KFImage(friend.friendAvatar!)
        .resizable()
        .frame(width: 150, height: 150, alignment: .top)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
      Text("\(friend.firstName) \(friend.lastName)")
        .padding(.top, 16)
      
      FriendGalleryList(friend: friend)
      
      
      
      Spacer()
    }
    .navigationBarTitleDisplayMode(.inline)
  }
}

