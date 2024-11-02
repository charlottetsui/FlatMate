//
//  HomeScreenView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/2/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            TransactionView()
                .tabItem {
                    Label("Transaction", systemImage: "arrow.left.arrow.right")
                }
            
            TransactionView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

struct HomeScreenView: View {
    @State var index = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderBar()
                Divider()
                
                Spacer().frame(height: 100)
                Text("Amount Owed")
                    .font(.subheadline)
                    .foregroundColor(Color.secondary)
                
                // TODO: remove hard-coding here
                Text("$"+RoomieGroup.house.roomies[0].amountOwed.description)
                    .font(.largeTitle)
                
                HStack {
                    Image(systemName: "square.and.pencil")
                    Text("Pay Expense")
                    Spacer()
                    Image(systemName: "plus.square.on.square")
                    Text("Add Expense")
                }
                
                Spacer().frame(height: 200)
                
                
            }
            
            //// Roommate Group Summary
            Divider()
            ScrollView(showsIndicators: false) {
                GroupSummaryView()
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}

extension HomeScreenView {
    
    struct HeaderBar: View {
        var body: some View {
            HStack { // HEADER
                Text(DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none))
                Spacer()
                Image(systemName: "person.crop.circle")
                Text(RoomieGroup.house.roomies[0].name)
            }
        }
    }
}
