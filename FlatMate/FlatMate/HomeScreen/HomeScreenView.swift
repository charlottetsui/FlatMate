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
            
            ProfileView()
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
                Text("00.00")
                    .font(.largeTitle)
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
                Text("DATE 00")
                Spacer()
                Image(systemName: "person.crop.circle")
                Text("NAME")
            }
        }
    }
}

// Placeholder Views for other tabs
struct SettingsView: View {
    var body: some View {
        Text("Settings Screen")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Screen")
    }
}


