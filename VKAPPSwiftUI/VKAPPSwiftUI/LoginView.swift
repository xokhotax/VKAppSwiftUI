//
//  ContentView.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 20.04.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
  
  @State private var vkLoginWindowShow = false
  
  var body: some View {

    NavigationView {
      VStack {
        Button("Login via VK"){
          vkLoginWindowShow.toggle()
        }
        .sheet(isPresented: $vkLoginWindowShow) {
          VKLoginWebView()
        }
        Spacer()
        NavigationLink(destination: MainView()) {
          Text("To Main View")
        }
      }
    }
  }
  
  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      LoginView()
        .previewInterfaceOrientation(.portraitUpsideDown)
    }
  }
}
