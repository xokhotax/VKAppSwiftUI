//
//  CellView.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 25.04.2022.
//

import SwiftUI
import CoreData


struct CellView: View {
  
  @State private var surname = ""
  @State private var groups = ""
  private let textFieldWidth = CGFloat(200)
  private let frameWidth = CGFloat(320)
  private let textFieldHeight = CGFloat(16)
  
  private var groupsList = [
    Groups(name: "Pikabu"),
    Groups(name: "Music"),
    Groups(name: "Cartoons"),
    Groups(name: "Swift"),
    Groups(name: "Punk")
  ]

  @FocusState private var textIsFocused: Bool
  
  var body: some View {
    
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
  }
  
  struct CellView_Previews: PreviewProvider {
    static var previews: some View {
      CellView()
        .previewInterfaceOrientation(.portraitUpsideDown)
    }
  }
}
