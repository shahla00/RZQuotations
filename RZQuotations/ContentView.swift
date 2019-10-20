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
  
  @State private var action: Int? = 0
  
  init() {
    UITableView.appearance().separatorStyle = .none
  }
  
  var body: some View {
      NavigationView {
        
        List {
          ForEach(self.quotes) { quote in
            NavigationLink(destination: EditView(quote: quote), tag: quote.dateModified.hashValue, selection: self.$action) { EmptyView() }
            
            GeometryReader { geometry in
            VStack(alignment: .center) {
              Text(quote.quote ?? "")
                .font(.title)
                .frame(width: geometry.size.width)
                .padding(.top)
              
              Spacer()
              Text("By \(quote.author ?? "")")
                .font(.body)
                .padding(.bottom)
            }
            .background(Color.darkBlue)
            .cornerRadius(10)
            .foregroundColor(.white)
            }
            .frame(height: 110)
            .onTapGesture {
              self.action = quote.dateModified.hashValue
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
