//
//  Quote.swift
//  RZQuotations
//
//  Created by Shahla Almasri Hafez on 10/19/19.
//  Copyright © 2019 Shahla Almasri Hafez. All rights reserved.
//

import Foundation
import Combine
import CoreData

extension Quote: Identifiable {
    static func allQuotes() -> NSFetchRequest<Quote> {
        let request: NSFetchRequest<Quote> = Quote.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "dateModified", ascending: false)]
        return request
    }
}
