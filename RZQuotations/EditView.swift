//
//  EditView.swift
//  RZQuotations
//
//  Created by Shahla Almasri Hafez on 10/19/19.
//  Copyright © 2019 Shahla Almasri Hafez. All rights reserved.
//

import SwiftUI
import CoreData

struct EditView: View {
  @Environment(\.managedObjectContext) var managedObjectContext
  @Environment(\.presentationMode) var presentationMode
  
  var quote: Quote
  
  @State var quoteContent: String = ""
  @State var book: String = ""
  @State var author: String = ""
  
  var body: some View {
    VStack {
      VStack {
        TextField("Quote", text: $quoteContent)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .onAppear {
            self.quoteContent = self.quote.quote ?? ""
        }
        
        TextField("Book", text: $book)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .onAppear {
            self.book = self.quote.book ?? ""
        }
        
        TextField("Author", text: $author)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .onAppear {
            self.author = self.quote.author ?? ""
        }
      }
      .navigationBarItems(trailing: Button(action: save) { Text("Save") })
    }
  }
  
  func save() {
    self.quote.quote = self.quoteContent
    self.quote.author = self.author
    self.quote.book = self.book
    self.quote.dateModified = Date()
    
    do {
      try self.managedObjectContext.save()
    } catch {
      print(error)
    }
    
    self.presentationMode.wrappedValue.dismiss()
  }
}
