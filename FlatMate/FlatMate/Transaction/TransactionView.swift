//
//  TransactionView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/2/24.
//

import SwiftUI

struct TransactionView: View {
    var body: some View {
        ScrollView {
            TransactionBox()
            TransactionBox()
            TransactionBox()
            TransactionBox()
            TransactionBox()
            TransactionBox()
        }
        .padding()
    }
}

#Preview {
    TransactionView()
}

extension TransactionView {
    
    struct TransactionBox: View {
        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text("EXPENSE")
                        .fontWeight(.bold)
                        .padding(.vertical)
                    Text("DESCRIPTION")
                        .font(.caption)
                        .foregroundColor(Color.secondary)
                }
                Spacer()
                Text("AMOUNT")
            }
            .padding(15)
            .background(Color.secondary.opacity(0.2))
            .cornerRadius(15)
            .padding()
        }
    }
}
