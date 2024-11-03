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
            ForEach(0..<RoomieGroup.flat.roomies.count, id: \.self) { i in
                RoomiesDetail(name: RoomieGroup.flat.roomies[i].name, expense: RoomieGroup.flat.roommateBalances[i].description)
                        }
            RoomiesDetail(name: "TOTAL", expense: RoomieGroup.flat.totalAmountDue.description)
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
                Text("$"+expense)
                    .font(.subheadline)
            }
            .padding(25) // padding for background
            .background(Color.secondary.opacity(0.2))
            .cornerRadius(15)
            .padding() // padding between roomies
        }
    }
}
