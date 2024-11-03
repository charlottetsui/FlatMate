//
//  AddExpenseView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/2/24.
//

import SwiftUI

struct AddExpenseView: View {
    @Binding var showSheet: Bool
    @State var expenseAmount = 0.0
    @State var expenseName = ""
    @State var expenseDescription = ""
    @StateObject var vm = BillViewModel()
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            VStack(alignment: .leading) {
                Spacer()
                VStack(alignment: .leading) {
                    Text("How much?")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white.opacity(0.5))
                    TextField("0.0", value: $expenseAmount, format: .currency(code: "USD"))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                .padding()
                
                ZStack {
                    Color.white.ignoresSafeArea()
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Expense")
                            .font(.headline)
                        TextField("", text: $expenseName)
                            .textFieldStyle(.roundedBorder)
                            .font(.title2)
                        Spacer()
                        Text("Description")
                            .font(.headline)
                        TextField("", text: $expenseDescription)
                            .textFieldStyle(.roundedBorder)
                            .font(.title2)
                        Spacer()
                        // TODO: FUNCTION CHECK!!
                        Button {
                            vm.addExpense(name: expenseName, balance: expenseAmount, numRoommates: 1)
                            showSheet = false
                        } label: {
                            Text("Continue")
                                .fontWeight(.bold)
                                .padding()
                                .frame(width: 375)
                                .background(Color.red)
                                .foregroundColor(Color.white)
                                .cornerRadius(15)
                        }
                    }
                    .padding()
                }
                .foregroundColor(Color.secondary)
            }
        }
    }
}

#Preview {
    AddExpenseView(showSheet: .constant(true))
}
