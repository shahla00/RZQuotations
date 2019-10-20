//
//  SwiftUIView.swift
//  RZQuotations
//
//  Created by Shahla Almasri Hafez on 10/20/19.
//  Copyright © 2019 Shahla Almasri Hafez. All rights reserved.
//

import SwiftUI

struct QuoteCard: View {
  var quote: Quote
  
  var body: some View {
    GeometryReader { geometry in
      VStack(alignment: .center) {
        Text(self.quote.quote ?? "")
          .font(.title)
          .frame(width: geometry.size.width)
          .padding(.top)
        
        Spacer()
        Text("By \(self.quote.author ?? "")")
          .font(.body)
          .padding(.bottom)
      }
      .background(Color.darkBlue)
      .cornerRadius(10)
      .foregroundColor(.white)
    }
  }
}
