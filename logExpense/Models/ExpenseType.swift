//
//  ExpenseType.swift
//  logExpense
//
//  Created by Nowroz Islam on 22/9/23.
//

import Foundation

enum ExpenseType: String, CaseIterable, Identifiable {
    case personal = "Personal"
    case business = "Business"
    
    var id: Self {
        self
    }
}
