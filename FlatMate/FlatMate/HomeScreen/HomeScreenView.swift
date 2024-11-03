//
//  HomeScreenView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/2/24.
//

import SwiftUI

struct HomeScreenView: View {
    @Binding var flat: RoomieGroup
    @State var index = 0
    @State var showAddExpense = false
    @State var showPayExpense = false
    
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
                Text("$"+flat.roommateBalances[0].description)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(25)
                
                

                
                HStack {
                    Button {
                        showPayExpense.toggle()
                    } label: {
                        ExpenseBox(image: "square.and.pencil", nameTop: "Pay", nameBottom: "Expense", color: Color.green)
                    }
                    Spacer()
                    Button {
                        showAddExpense.toggle()
                    } label: {
                        ExpenseBox(image: "plus.square.on.square", nameTop: "Add", nameBottom: "Expense", color: Color.red)
                    }
                }
                .padding(.top)
                Spacer().frame(height: 150)
            }
            // Roommate Group Summary
            Divider()
            ScrollView(showsIndicators: false) {
                GroupSummaryView(flat: $flat)
            }
        }
        .padding()
        .sheet(isPresented: $showAddExpense) {
            AddExpenseView(flat: $flat, showSheet: $showAddExpense)
                .presentationDetents([.fraction(0.5)])
        }
        .sheet(isPresented: $showPayExpense) {
            PayExpenseView(flat: $flat, showSheet: $showPayExpense)
                .presentationDetents([.fraction(0.5)])
        }
    }
}

#Preview {
    MainView()
}

extension HomeScreenView {
    
    struct HeaderBar: View {
        var body: some View {
            HStack { // HEADER
                Text(DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none))
                    .font(.title3)
                Spacer()
                NavigationLink {
                } label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    Text(RoomieGroup.flat.roomies[0].name)
                        .font(.title3)
                }
            }
            .foregroundColor(Color.primary)
        }
    }
    
    struct ExpenseBox: View {
        let image: String
        let nameTop: String
        let nameBottom: String
        let color: Color
        
        var body: some View {
            HStack {
                Image(systemName: image).resizable().frame(width: 40, height: 40).fontWeight(.bold)
                VStack(alignment: .leading) {
                    Text(nameTop)
                    Text(nameBottom)
                }
                .fontWeight(.bold)
                .font(.subheadline)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 30)
            .background(color)
            .foregroundColor(Color.white)
            .cornerRadius(15)
        }
    }
}

// TabBar View
struct MainView: View {
    @State var flat: RoomieGroup = RoomieGroup(roomies: [Roomie(name: "Lizzie", index: 0),
                                                         Roomie(name: "Charlotte", index: 1),
                                                         Roomie(name: "Caitlin", index: 2),
                                                         Roomie(name: "Caroline", index: 3)],
                                               bills: [Bill(name: "Electricity", balance: 300, balanceBreakdown: [75, 75, 75, 75]),
                                                       Bill(name: "Trash", balance: 50, balanceBreakdown: [12.50, 12.50, 12.50, 12.50]),
                                                       Bill(name: "Water", balance: 100, balanceBreakdown: [25, 25, 25, 25]),
                                                       Bill(name: "Recycling", balance: 25, balanceBreakdown: [6.25, 6.25, 6.25, 6.25])])
    var body: some View {
        TabView {
            HomeScreenView(flat: $flat)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            TransactionView(flat: $flat)
                .tabItem {
                    Label("Transaction", systemImage: "arrow.left.arrow.right")
                }
            
            RoommateNavigationView(flat: $flat)
                .tabItem {
                    Label("My Group", systemImage: "person.crop.circle")
                }
        }
    }
}
