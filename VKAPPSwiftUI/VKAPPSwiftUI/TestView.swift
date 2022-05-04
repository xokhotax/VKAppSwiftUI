//
//  TestView.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 29.04.2022.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VKLoginWebView()
     
      NavigationView{
        NavigationLink(destination: MainView()) {
          Text("NExt")
        }
      }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
