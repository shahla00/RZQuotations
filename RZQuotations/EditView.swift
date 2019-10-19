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
    
    @State var updatedIdeaTitle: String = ""
    @State var updatedIdeaDescription: String = ""
    
    var body: some View {
        VStack {
            VStack {
                TextField("Idea title", text: $updatedIdeaTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onAppear {
                      self.updatedIdeaTitle = self.quote.quote ?? ""
                }
        
                TextField("Idea description", text: $updatedIdeaDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onAppear {
                        self.updatedIdeaDescription = self.quote.author ?? ""
                }
            }
            
            VStack {
                Button(action: ({
                    self.quote.quote = self.updatedIdeaTitle
                    self.quote.author = self.updatedIdeaDescription
                    
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        print(error)
                    }
                    
                    self.presentationMode.wrappedValue.dismiss()
                })) {
                    Text("Save")
                }
            .padding()
            }
        }
    }
}
