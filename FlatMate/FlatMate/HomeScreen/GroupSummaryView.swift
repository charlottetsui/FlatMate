//
//  GroupSummaryView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/2/24.
//

import SwiftUI

struct GroupSummaryView: View {
    @Binding var flat: RoomieGroup
    var body: some View {
        VStack {
            ForEach(0..<flat.roomies.count, id: \.self) { i in
                RoomiesDetail(name: flat.roomies[i].name, expense: flat.roommateBalances[i].description)
                        }
            Text("Total")
                .fontWeight(.bold)
                .font(.headline)
                .foregroundColor(Color.secondary)
                .padding(.top)
            Text("\(flat.totalAmountDue.description)")
                .font(.title)
            
        }
        .padding()
    }
}

//#Preview {
    //GroupSummaryView()
//}

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
