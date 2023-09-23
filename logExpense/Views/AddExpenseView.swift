//
//  AddExpenseView.swift
//  logExpense
//
//  Created by Nowroz Islam on 23/9/23.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.expenseList) private var expenseList
    
    @Bindable var expense: Expense = Expense()
    
    let currencyCode: String = Locale.current.currency?.identifier ?? "USD"
    
    var trimmedName: String {
        expense.name.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    @State private var showingAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense name", text: $expense.name)
                
                Picker("Expense type", selection: $expense.type) {
                    ForEach(ExpenseType.allCases) { type in
                        Text(type.rawValue)
                    }
                }
                
                TextField("Expense amount", value: $expense.amount, format: .currency(code: currencyCode))
                    .multilineTextAlignment(.trailing)
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                       save()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel", role: .cancel) {
                        cancel()
                    }
                }
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func save() {
        guard trimmedName.isEmpty == false else {
            displayAlert(
                withTitle: "Empty Name",
                withMessage: "The expense must have a name."
            )
            return
        }
        
        expenseList.expenses.append(expense)
        dismiss()
    }
    
    func cancel() {
        dismiss()
    }
    
    func displayAlert(withTitle title: String, withMessage message: String) {
        alertTitle = title
        alertMessage = message
        showingAlert = true
    }
}

#Preview {
    AddExpenseView()
}
