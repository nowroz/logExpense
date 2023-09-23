//
//  ExpenseList.swift
//  logExpense
//
//  Created by Nowroz Islam on 22/9/23.
//

import Foundation
import SwiftUI

@Observable final class ExpenseList {
    var expenses: [Expense] = []
}

extension ExpenseList {
    var personalExpenses: [Expense] {
        expenses.filter {
            $0.type == .personal
        }
    }
    
    var businessExpenses: [Expense] {
        expenses.filter {
            $0.type == .business
        }
    }
}

fileprivate struct ExpenseListKey: EnvironmentKey {
    static var defaultValue: ExpenseList = ExpenseList()
}

extension EnvironmentValues {
    var expenseList: ExpenseList {
        get { self[ExpenseListKey.self] }
        set {
            self[ExpenseListKey.self] = newValue
        }
    }
}
