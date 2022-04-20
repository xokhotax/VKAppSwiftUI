//
//  ContentView.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 20.04.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
  
  @State private var login = ""
  @State private var password = ""
  @State private var shouldShowLogo: Bool = true
  private let textFieldWidth = CGFloat(220)
  private let frameWidth = CGFloat(320)
  private let loginPicture = "loginBackgroundPic"
  private let keyboardIsOnPublisher = Publishers.Merge( NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification).map { _ in true }, NotificationCenter.default.publisher(for:UIResponder.keyboardWillHideNotification) .map { _ in false }).removeDuplicates()
  
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
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in withAnimation(Animation.easeInOut(duration: 0.5)) {
              self.shouldShowLogo = !isKeyboardOn }
            }
            .frame(maxWidth:frameWidth)
            .onTapGesture {
              UIApplication.shared.endEditing() }
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

extension UIApplication { func endEditing() {
  sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}
}
