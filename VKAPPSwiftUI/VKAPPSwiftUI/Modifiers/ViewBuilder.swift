//
//  ViewBuilder.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 25.04.2022.
//

import SwiftUI

struct BackGroundImage: View { var content: Image
  init(@ViewBuilder content: () -> Image) {
    self.content = content() }
  
  var body: some View { content
    .resizable()
    .edgesIgnoringSafeArea(.all)
    .aspectRatio(contentMode: .fill)
  }
}
