//
//  CellView.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 25.04.2022.
//

import SwiftUI
import CoreData


struct MainView: View {
  
  @State private var surname = ""
  @State private var groups = ""

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
    
        ScrollView(showsIndicators: false) {
        VStack {
          HStack {
            Text("Surname")
              .foregroundColor(.white)
              .bold()
              .padding(.horizontal, 16)
            Spacer()
            TextField("", text: $surname)
              .focused($textIsFocused)
              .keyboardType(.emailAddress)
              .modifier(FrameModifier(width: textFieldWidth, height: textFieldHeight, alignment: .center))
          }
          HStack {
            Text("Groups")
              .foregroundColor(.white)
              .bold()
              .padding(.horizontal, 16)
            Spacer()
            List(groupsList) {
              Text($0.name)
            }
            .padding(16)
            .frame(width: textFieldWidth, height:CGFloat(groupsList.count * 56), alignment: .center)
            .listStyle(.plain)
          }
        }
          
        .frame(width: frameWidth, alignment: .center)
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
  }
  
    struct CellView_Previews: PreviewProvider {
    static var previews: some View {
      MainView()
        .previewInterfaceOrientation(.portrait)
    }
  }
}
