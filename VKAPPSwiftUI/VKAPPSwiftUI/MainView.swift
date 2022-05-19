//
//  CellView.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 25.04.2022.
//

import SwiftUI
import CoreData
import RealmSwift

struct MainView: View {
  
  @State private var surname = ""
  @State private var groups = ""
  
  private let networkServices = NetworkServices()
  
  @FocusState private var textIsFocused: Bool
  
  var body: some View {
    TabView {
      FriendsView()
        .tabItem {
          Image(systemName: "person.3")
          Text("Friends")
        }
      GroupsView()
        .tabItem {
          Image(systemName: "network")
          Text("Groups")
        }
      NewsView()
        .tabItem {
          Image(systemName: "newspaper")
          Text("News")
        }
    }
    .onAppear(perform: networkServices.fetchVKFriends)
    .navigationBarBackButtonHidden(true)
    .navigationBarHidden(true)
    .navigationBarTitleDisplayMode(.inline)
  }

}

struct CellView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .previewInterfaceOrientation(.portrait)
  }
}

