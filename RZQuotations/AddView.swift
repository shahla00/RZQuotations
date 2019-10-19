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
  
  @State var quoteContent: String = ""
  @State var book: String = ""
  @State var author: String = ""
  
  var body: some View {
    VStack {
      TextField("Quote", text: $quoteContent)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
      TextField("Book", text: $book)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
      TextField("Author", text: $author)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
      VStack {
        Button(action: save) { Text("Save") }
          .padding()
      }
    }
  }
  
  private func save() {
    let quote = Quote(context: self.managedObjectContext)
    quote.id = UUID()
    quote.quote = self.quoteContent
    quote.author = self.author
    quote.book = self.book
    quote.dateCreated = Date()
    quote.dateModified = Date()
    
    do {
      try self.managedObjectContext.save()
    } catch {
      print(error)
    }
    
    self.presentationMode.wrappedValue.dismiss()
  }
}
