//
//  TransactionView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/2/24.
//

import SwiftUI

struct TransactionView: View {
    @Binding var flat: RoomieGroup
    var body: some View {
        ScrollView {
            ForEach(flat.bills, id: \.id) {
                bill in TransactionBox(bill: bill)
            }
        }
        .padding()
    }
}

//#Preview {
 //   TransactionView()
//}

extension TransactionView {
    
    struct TransactionBox: View {
        var bill: Bill
        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(bill.name.description)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    Text(bill.name.description)
                        .font(.caption)
                        .foregroundColor(Color.secondary)
                }
                Spacer()
                Text("$"+bill.balance.description)
            }
            .padding(15)
            .background(Color.secondary.opacity(0.2))
            .cornerRadius(15)
            .padding()
        }
    }
}
