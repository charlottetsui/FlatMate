//
//  LandScreenView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/2/24.
//

import SwiftUI

struct LandScreenView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("LandScreenImage")
                    .resizable()
                    .scaledToFit().ignoresSafeArea()
                    .shadow(radius: 5.0)
                
                Spacer()
                Text("FlatMate")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Text("\"For Fair, Friendly, and Easy Balance\"")
                    .font(.title3)
                    .italic()
                    .foregroundColor(Color.secondary)
                    .padding(10)
                Spacer()
                NavigationLink {
                    MainView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Continue")
                        .padding()
                        .padding(.horizontal, 35)
                        .background(Color.primary)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
            }
        }
    }
}

#Preview {
    LandScreenView()
}
