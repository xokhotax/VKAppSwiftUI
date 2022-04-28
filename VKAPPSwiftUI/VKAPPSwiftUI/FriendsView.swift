//
//  FriendsView.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 27.04.2022.
//

import SwiftUI

struct FriendsView: View {
  
  var body: some View {
    
    NavigationView{
      ZStack {
        GeometryReader { geometry in
          BackGroundImage {
            Image(backGroundPicture)
          }
          .frame(maxWidth: geometry.size.width, maxHeight:geometry.size.height)
        }
        ScrollView(showsIndicators: false) {
          
          List(friendsList) { friend in
            NavigationLink(destination: FriendView(friend: friend)) {
              FriendsListRow(friend: friend)
            }
            .listRowBackground(Color.clear)
            .foregroundColor(Color.white)
            
          }
          
          .listStyle(.plain)
          
          .modifier(FrameModifier(width: frameWidth, height: 500, alignment: .center))
        }
      }
    }
  }
}

struct FriendsView_Previews: PreviewProvider {
  static var previews: some View {
    FriendsView()
  }
}
