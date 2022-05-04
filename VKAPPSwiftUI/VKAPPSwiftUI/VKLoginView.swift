//
//  TestView.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 29.04.2022.
//

import SwiftUI

struct VKLoginView: View {
  var body: some View {
    
    ZStack {
      NavigationView {
        NavigationLink(destination: MainView()) {
          VKLoginWebView()
            .navigationBarHidden(true)
        }
      }
    }
  }
}

struct TestView_Previews: PreviewProvider {
  static var previews: some View {
    VKLoginView()
  }
}
