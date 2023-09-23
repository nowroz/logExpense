//
//  Expense.swift
//  logExpense
//
//  Created by Nowroz Islam on 22/9/23.
//

import Foundation
import SwiftUI

@Observable final class Expense: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var type: ExpenseType = .personal
    var amount: Double = 0.0
}

extension Expense {
    var amountColor: Color {
        if amount < 100 {
            return .green
        } else if amount < 1000 {
            return .orange
        } else {
            return .red
        }
    }
}
