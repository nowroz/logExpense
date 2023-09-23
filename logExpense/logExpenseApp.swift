//
//  logExpenseApp.swift
//  logExpense
//
//  Created by Nowroz Islam on 22/9/23.
//

import SwiftUI

@main
struct logExpenseApp: App {
    var expenseList: ExpenseList = ExpenseList()
    
    var body: some Scene {
        WindowGroup {
            ExpenseListView()
                .environment(\.expenseList, expenseList)
        }
    }
}
