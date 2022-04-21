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
  private let frameWidth = CGFloat(320)
  private let loginPicture = "loginBackgroundPic"
  
  @FocusState private var textIsFocused: Field?
  
  var body: some View {
    
    ZStack {
      GeometryReader { geometry in Image(loginPicture)
          .resizable()
          .edgesIgnoringSafeArea(.all) .aspectRatio(contentMode: .fill) .frame(maxWidth: geometry.size.width, maxHeight:geometry.size.height)
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
              .focused($textIsFocused,
                       equals: .login)
              .padding(16)
              .frame(width: textFieldWidth,
                     alignment: .trailing)
              .textFieldStyle(.roundedBorder)
          }
          HStack {
            Text("Password")
              .foregroundColor(.white)
              .padding(.leading, 16)
            Spacer()
            TextField("", text: $password)
              .focused($textIsFocused,
                       equals: .password)
              .padding(16)
              .frame(width: textFieldWidth,
                     height: .infinity,
                     alignment: .center)
              .textFieldStyle(.roundedBorder)
          }
          HStack {
            Button {
              print("Login success")
            } label: {
              Text("Log In")
            }
            .disabled(login.isEmpty || password.isEmpty)
            .foregroundColor(.white)
            .font(.system(size: 16, weight:.bold))
            .frame(maxWidth:frameWidth)
          }
          Spacer()
        }
        .frame(maxWidth:frameWidth)
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
