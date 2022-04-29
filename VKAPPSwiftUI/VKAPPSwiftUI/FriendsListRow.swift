//
//  FriendsListRow.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 28.04.2022.
//

import SwiftUI

struct FriendsListRow: View {
  var friend: FriendsVK
  
  var body: some View {
    
    HStack {
      VStack(alignment: .leading) {
        Text(friend.firstName)
      }
      Spacer()
    }
  }
}

