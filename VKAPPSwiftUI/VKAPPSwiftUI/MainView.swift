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
      ZStack {
        GeometryReader { geometry in Image(backGroundPicture)
          BackGroundImage {
            Image(backGroundPicture)
          }
          .frame(maxWidth: geometry.size.width, maxHeight:geometry.size.height)
        }
        
      }
      .tabItem {
        Image(systemName: "icloud")
          .symbolRenderingMode(.monochrome)
          .foregroundColor(.red)
          .symbolVariant(.fill)
        Text("Main")
      }
      FriendsView()
        .tabItem {
          Image(systemName: "person.3")
            .symbolRenderingMode(.monochrome)
            .foregroundColor(.red)
            .symbolVariant(.fill)
          Text("Friends")
        }
      GroupsView()
        .tabItem {
          Image(systemName: "network")
            .symbolRenderingMode(.monochrome)
            .foregroundColor(.red)
            .symbolVariant(.fill)
          Text("Groups")
        }
      NewsView()
        .tabItem {
          Image(systemName: "newspaper")
            .symbolRenderingMode(.monochrome)
            .foregroundColor(.red)
            .symbolVariant(.fill)
          Text("News")
        }
    }
    .navigationBarBackButtonHidden(true)
    .navigationBarHidden(true)
    .onAppear(perform: networkServices.fetchVKFriends)
  }
  
  struct CellView_Previews: PreviewProvider {
    static var previews: some View {
      MainView()
        .previewInterfaceOrientation(.portrait)
    }
  }
}
