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
      HStack {
        Text("Quote ")
          .foregroundColor(.white)
        TextField("Quote", text: $quoteContent)
          .textFieldStyle(RoundedBorderTextFieldStyle())
      }
      .padding()
      
      HStack {
        Text("Book   ")
          .foregroundColor(.white)
        TextField("Book", text: $book)
          .textFieldStyle(RoundedBorderTextFieldStyle())
      }
      .padding()
      
      HStack {
        Text("Author")
          .foregroundColor(.white)
        TextField("Author", text: $author)
          .textFieldStyle(RoundedBorderTextFieldStyle())
      }
      .padding()
    }
    .cornerRadius(10)
    .background(Color.darkBlue)
    .padding()
    .navigationBarItems(trailing: Button(action: save) { Text("Save") })
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
