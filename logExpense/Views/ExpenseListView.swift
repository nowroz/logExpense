//
//  ContentView.swift
//  logExpense
//
//  Created by Nowroz Islam on 22/9/23.
//

import SwiftUI

struct ExpenseListView: View {
    @Environment(\.expenseList) var expenseList
    
    @State private var showingAddExpenseSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal: \(expenseList.personalExpenses.count)") {
                    ForEach(expenseList.personalExpenses) { expense in
                        ExpenseView(expense)
                    }
                    .onDelete(perform: deletePersonalExpenses)
                }
                
                Section("Business: \(expenseList.businessExpenses.count)") {
                    ForEach(expenseList.businessExpenses) { expense in
                        ExpenseView(expense)
                    }
                    .onDelete(perform: deleteBusinessExpenses)
                }
            }
            .navigationTitle("logExpense")
            .toolbar {
                Button {
                    showingAddExpenseSheet = true
                } label: {
                    Label("Add expense", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpenseSheet) {
                AddExpenseView()
            }
        }
    }
    
    func deletePersonalExpenses(at offsets: IndexSet) {
        for index in offsets {
            let expense = expenseList.personalExpenses[index]
            expenseList.expenses.removeAll {
                $0 === expense
            }
        }
    }
    
    func deleteBusinessExpenses(at offsets: IndexSet) {
        for index in offsets {
            let expense = expenseList.businessExpenses[index]
            expenseList.expenses.removeAll {
                $0 === expense
            }
        }
    }
}

#Preview {
    ExpenseListView()
}
