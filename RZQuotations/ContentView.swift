//
//  ContentView.swift
//  RZQuotations
//
//  Created by Shahla Almasri Hafez on 10/19/19.
//  Copyright © 2019 Shahla Almasri Hafez. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @Environment(\.managedObjectContext) var managedObjectContext
  @FetchRequest(fetchRequest: Quote.allQuotes()) var quotes: FetchedResults<Quote>
  
  var body: some View {
    NavigationView {
      List {
        ForEach(self.quotes) { quote in
            NavigationLink(destination: EditView(quote: quote)) {
                VStack(alignment: .leading) {
                    Text(quote.quote ?? "")
                        .font(.headline)
                    Text(quote.author ?? "")
                        .font(.subheadline)
                }
            }
        }
        .onDelete { (indexSet) in
            let quote = self.quotes[indexSet.first!]
            self.managedObjectContext.delete(quote)
            
            do {
                try self.managedObjectContext.save()
            } catch {
                print(error)
            }
        }
      }
      .navigationBarTitle(Text("My Quotations"))
      .navigationBarItems(trailing: NavigationLink(destination: AddView()) { Text("Add Quote")})
    }
  }
}
