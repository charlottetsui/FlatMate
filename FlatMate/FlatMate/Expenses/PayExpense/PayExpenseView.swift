//
//  PayExpenseView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/2/24.
//

import SwiftUI

struct PayExpenseView: View {
    @Binding var flat: RoomieGroup
    @Binding var showSheet: Bool
    @State var expenseAmount = 0.0
    @State var expenseName = ""
    @State var expenseDescription = ""
    @State var selectedBill: Bill? // Changed to Bill? for better selection management
    private let bills: [Bill] = [Bill(name: "Electricity", balance: 300), Bill(name: "Trash", balance: 50), Bill(name: "Water", balance: 100)]

    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
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
                        Group {
                            Text("Bill")
                                .font(.headline)
                            
                            Picker("", selection: $selectedBill) {
                                ForEach(bills, id: \.self) { bill in
                                    Text("\(bill.name), \(String(format: "%.2f", bill.balance))")
                                        .tag(bill as Bill?)
                                }
                            }
                            .frame(width: 375, height: 40)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary, lineWidth: 1))
                        }
                        Spacer()
                        Button {
                            showSheet = false
                        } label: {
                            Text("Continue")
                                .fontWeight(.bold)
                                .padding()
                                .frame(width: 375)
                                .background(Color.green)
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

//#Preview {
 //   PayExpenseView(showSheet: .constant(true))
//}

