//
//  FriendGalleryList.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 06.05.2022.
//

import SwiftUI
import Kingfisher

struct FriendGalleryList: View {
  var friend: FriendsVK
  var networkServices = NetworkServices()
  @StateObject var friendID = FriendID()
  
  var body: some View {
    Text("FriendGalleryList")
    VStack {
      ForEach(friend.photosArray, id: \.self) { photo in
        Image(uiImage: photo!)
          .resizable()
          .frame(width: 100, height: 100, alignment: .center)
      }
      Spacer()
    }
    .onTapGesture(perform: networkServices.fetchVKFriendPhoto)
  }
}

