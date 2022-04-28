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

        Image(systemName: friend.pictures[0])
          .resizable()
          .edgesIgnoringSafeArea(.all)
          .aspectRatio(contentMode: .fill)
          
       
      }
      
    }
}
