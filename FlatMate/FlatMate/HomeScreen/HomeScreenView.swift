//
//  HomeScreenView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/2/24.
//

import SwiftUI

struct HomeScreenView: View {
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
                Text("$0.00")
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
                GroupSummaryView()
            }
        }
        .padding()
        .sheet(isPresented: $showAddExpense) {
            AddExpenseView(showSheet: $showAddExpense)
                .presentationDetents([.fraction(0.5)])
        }
        .sheet(isPresented: $showPayExpense) {
            PayExpenseView(showSheet: $showPayExpense)
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
            
            RoommateNavigationView()
                .tabItem {
                    Label("My Group", systemImage: "person.crop.circle")
                }
        }
    }
}
