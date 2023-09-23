//
//  ExpenseView.swift
//  logExpense
//
//  Created by Nowroz Islam on 23/9/23.
//

import SwiftUI

struct ExpenseView: View {
    var expense: Expense
    
    let currencyCode: String = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expense.name)
                    .font(.headline)
                
                Text(expense.type.rawValue)
                    .font(.subheadline)
            }
            
            Spacer()
            
            Text(expense.amount, format: .currency(code: currencyCode))
                .foregroundStyle(expense.amountColor)
        }
    }
    
    init(_ expense: Expense) {
        self.expense = expense
    }
}

#Preview {
    ExpenseView(Expense())
}
