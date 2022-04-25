//
//  VievModifier.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 25.04.2022.
//

import SwiftUI

struct FrameModifier: ViewModifier {
  let width: CGFloat?
  let height: CGFloat?
  let alignment: Alignment
  func body(content: Content) -> some View { content
    .frame(width: width, height: height, alignment: alignment)
    .textFieldStyle(.roundedBorder)
    .padding(.top, 16)
  }
}
