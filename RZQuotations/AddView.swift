//
//  EditView.swift
//  RZQuotations
//
//  Created by Shahla Almasri Hafez on 10/19/19.
//  Copyright © 2019 Shahla Almasri Hafez. All rights reserved.
//

import SwiftUI

struct AddView: View {
  @Environment(\.managedObjectContext) var managedObjectContext
  @Environment(\.presentationMode) var presentationMode
  
  @State var updatedIdeaTitle: String = ""
  @State var updatedIdeaDescription: String = ""
  
  var body: some View {
    VStack {
      VStack {
        TextField("Idea title", text: $updatedIdeaTitle)
          .textFieldStyle(RoundedBorderTextFieldStyle())
        
        TextField("Idea description", text: $updatedIdeaDescription)
          .textFieldStyle(RoundedBorderTextFieldStyle())
      }
      
      VStack {
        Button(action: save) { Text("Save") }
          .padding()
      }
    }
  }
  
  private func save() {
    let quote = Quote(context: self.managedObjectContext)
    quote.id = UUID()
    quote.quote = self.updatedIdeaTitle
    quote.author = self.updatedIdeaDescription
    
    do {
      try self.managedObjectContext.save()
    } catch {
      print(error)
    }
    
    self.presentationMode.wrappedValue.dismiss()
  }
}
