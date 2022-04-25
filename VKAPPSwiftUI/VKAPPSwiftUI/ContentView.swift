//
//  ContentView.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 20.04.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
  
  enum Field: Hashable {
    case login
    case password
  }
  
  @State private var login = ""
  @State private var password = ""
  @State private var shouldShowLogo: Bool = true
  private let textFieldWidth = CGFloat(220)
  private let textFieldHeight = CGFloat(16)
  private let frameWidth = CGFloat(320)
  
  @FocusState private var textIsFocused: Bool
  
  var body: some View {
    
    NavigationView {
      
      ZStack {
        GeometryReader { geometry in
          BackGroundImage {
            Image(backGroundPicture)
          }
          .frame(maxWidth: geometry.size.width, maxHeight:geometry.size.height)
        }
        
        ScrollView(showsIndicators: false) {
          
          VStack {
            if shouldShowLogo {
              Text("Welcome to VK App")
                .foregroundColor(.white)
                .padding(.top, 10)
                .textCase(.uppercase)
                .font(.system(size: 16,
                              weight: .bold,
                              design: .default))
            }
            HStack {
              Text("Login")
                .foregroundColor(.white)
                .padding(.leading, 16)
              Spacer()
              TextField("", text: $login)
                .focused($textIsFocused)
                .keyboardType(.emailAddress)
                .modifier(FrameModifier(width: textFieldWidth, height: textFieldHeight, alignment: .center))
            }
            HStack {
              Text("Password")
                .foregroundColor(.white)
                .padding(.top, 16)
                .padding(.leading, 16)
              Spacer()
              TextField("", text: $password)
                .focused($textIsFocused)
                .modifier(FrameModifier(width: textFieldWidth, height: textFieldHeight, alignment: .center))
            }
            
            HStack {
              NavigationLink(destination: CellView()){
                Text("Log In")
              }
              .padding(16)
              .disabled(login.isEmpty || password.isEmpty)
              .foregroundColor(.white)
              .font(.system(size: 16, weight:.bold))
              .frame(maxWidth:frameWidth)
              .navigationBarHidden(true)
            }
            
            Spacer()
          }
          .frame(maxWidth:frameWidth)
        }
      }
      .onTapGesture(count: 1) {
        textIsFocused = false
      }
    }
  }
  
  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
        .previewInterfaceOrientation(.portraitUpsideDown)
    }
  }
}
