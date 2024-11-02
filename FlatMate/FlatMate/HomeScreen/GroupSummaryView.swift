//
//  GroupSummaryView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/2/24.
//

import SwiftUI

struct GroupSummaryView: View {
    var body: some View {
        VStack {
            RoomiesDetail(name: "NAME", expense: "EXPENSE")
            RoomiesDetail(name: "NAME", expense: "EXPENSE")
            RoomiesDetail(name: "NAME", expense: "EXPENSE")
            RoomiesDetail(name: "NAME", expense: "EXPENSE")
        }
        .padding()
    }
}

#Preview {
    GroupSummaryView()
}

extension GroupSummaryView {
    
    struct RoomiesDetail: View {
        let name: String
        let expense: String
        
        var body: some View {
            HStack {
                Text(name)
                    .font(.headline)
                Spacer()
                Text(expense)
                    .font(.subheadline)
            }
            .padding(25) // padding for background
            .background(Color.secondary.opacity(0.2))
            .cornerRadius(15)
            .padding() // padding between roomies
        }
    }
}
