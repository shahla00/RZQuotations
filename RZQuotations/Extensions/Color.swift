//
//  Color.swift
//  RZQuotations
//
//  Created by Shahla Almasri Hafez on 10/19/19.
//  Copyright © 2019 Shahla Almasri Hafez. All rights reserved.
//

import SwiftUI

extension Color {
  static let lightBlue = Color(hex: "E2D4B9")
  static let darkBlue = Color(hex: "233C67")
}

extension Color {
  init(hex: String) {
      let scanner = Scanner(string: hex)
      var rgbValue: UInt64 = 0
      scanner.scanHexInt64(&rgbValue)

      let r = (rgbValue & 0xff0000) >> 16
      let g = (rgbValue & 0xff00) >> 8
      let b = rgbValue & 0xff


      self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
  }
}
