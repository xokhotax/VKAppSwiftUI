//
//  FriendsView.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 27.04.2022.
//

import SwiftUI
import RealmSwift
import Alamofire

struct FriendsView: View {
  private let networkServices = NetworkServices()
  private var friend: Results<FriendsVK>? = try? Realm(configuration: RealmService.deleteIfMigration).objects(FriendsVK.self)

  var body: some View {
    NavigationView {
//      ZStack {
        GeometryReader { geometry in
          BackGroundImage {
            Image(backGroundPicture)
          }
          .frame(maxWidth: geometry.size.width, maxHeight:geometry.size.height)
          List(friend!) { friend in
            NavigationLink(destination: FriendView(friend: friend)) {
              FriendsListRow(friend: friend)
              
            }
            .listRowBackground(Color.clear)
            .foregroundColor(Color.white)
          }
          .listStyle(.plain)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
//      }
    }
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
    .navigationBarTitleDisplayMode(.inline)
    .onAppear(perform: networkServices.fetchVKFriends)
  }
}

struct FriendsView_Previews: PreviewProvider {
  static var previews: some View {
    FriendsView()
  }
}
